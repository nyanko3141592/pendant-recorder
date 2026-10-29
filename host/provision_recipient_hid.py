"""Provision one age public recipient through the recorder's write-once HID report.

Requires the cross-platform `hid` (hidapi) Python module at runtime. This tool
never accepts or reads an age private identity.
"""
import argparse
import time
from prepare_factory_config import recipient_bytes

REPORT_ID=1
PAYLOAD_BYTES=64
STATUS={0:'unavailable',1:'unprovisioned',2:'pending',3:'provisioned',4:'failed',5:'physical-confirmation-required'}

def crc32(data):
    value=0xffffffff
    for byte in data:
        value^=byte
        for _ in range(8): value=(value>>1)^((-(value&1))&0xedb88320)
    return (~value)&0xffffffff

def build_request(recipient):
    key=recipient_bytes(recipient)
    if not any(key):raise ValueError('All-zero X25519 recipient is not permitted')
    payload=bytearray(PAYLOAD_BYTES)
    payload[0]=1;payload[1]=1;payload[4:36]=key
    payload[36:40]=crc32(payload[:36]).to_bytes(4,'little')
    return bytes([REPORT_ID])+bytes(payload),key

def build_cleanup_request(first,last):
    if not (0<=first<=last<=0xffffffff):raise ValueError('Invalid cleanup ID range')
    payload=bytearray(PAYLOAD_BYTES);payload[0]=1;payload[1]=2
    payload[4:8]=first.to_bytes(4,'little');payload[8:12]=last.to_bytes(4,'little')
    payload[36:40]=crc32(payload[:36]).to_bytes(4,'little')
    return bytes([REPORT_ID])+bytes(payload)

def parse_response(report):
    data=bytes(report)
    if len(data)==PAYLOAD_BYTES+1 and data[0]==REPORT_ID:data=data[1:]
    if len(data)!=PAYLOAD_BYTES or data[0]!=1 or int.from_bytes(data[36:40],'little')!=crc32(data[:36]):
        raise ValueError('Invalid HID response framing or CRC')
    if data[1] not in STATUS:raise ValueError('Unknown HID status')
    return data[1],data[4:36]

def provision(device,recipient,timeout_s=10):
    request,key=build_request(recipient)
    status,existing=parse_response(device.get_feature_report(REPORT_ID,PAYLOAD_BYTES+1))
    if status==3:
        if existing!=key:raise RuntimeError('Device is already provisioned to another recipient')
        return 'already-provisioned'
    if status not in (1,5):raise RuntimeError(f'Device cannot accept provisioning: {STATUS[status]}')
    deadline=time.monotonic()+timeout_s
    while time.monotonic()<deadline:
        if status in (1,5):
            if device.send_feature_report(request)!=len(request):raise RuntimeError('Short HID feature write')
            time.sleep(.05)
        status,existing=parse_response(device.get_feature_report(REPORT_ID,PAYLOAD_BYTES+1))
        if status==3:
            if existing!=key:raise RuntimeError('Committed recipient readback mismatch')
            return 'provisioned'
        if status==4:raise RuntimeError('Device flash commit failed')
        if status not in (1,2,5):raise RuntimeError(f'Unexpected device status: {STATUS[status]}')
        time.sleep(.05)
    raise TimeoutError('Hold the recorder button continuously for 2 seconds while provisioning, then keep holding until commit/readback completes')

def queue_cleanup(device,first,last):
    request=build_cleanup_request(first,last)
    status,_=parse_response(device.get_feature_report(REPORT_ID,PAYLOAD_BYTES+1))
    if status!=3:raise RuntimeError('Device is not provisioned')
    if device.send_feature_report(request)!=len(request):raise RuntimeError('Short HID cleanup write')
    response=bytes(device.get_feature_report(REPORT_ID,PAYLOAD_BYTES+1));payload=response[1:] if len(response)==65 else response
    parse_response(response)
    if payload[2]==4:raise RuntimeError('Physical confirmation required: hold the recorder button for 2 seconds, keep holding, and retry')
    if payload[2]!=1:raise RuntimeError('Device did not queue cleanup range')
    return 'cleanup-queued'

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--recipient-file',required=True,help='recipient.txt containing one public age1... value')
    p.add_argument('--vid',required=True,type=lambda s:int(s,0));p.add_argument('--pid',required=True,type=lambda s:int(s,0))
    p.add_argument('--serial',help='24-hex STM32 UID; required when more than one matching device is attached')
    a=p.parse_args();recipient=open(a.recipient_file,encoding='ascii').read().strip()
    try:import hid
    except ImportError as e:raise SystemExit('Python hidapi module `hid` is required') from e
    matches=[d for d in hid.enumerate(a.vid,a.pid) if not a.serial or d.get('serial_number')==a.serial]
    if len(matches)!=1:raise SystemExit(f'Expected exactly one matching recorder, found {len(matches)}')
    device=hid.device();device.open_path(matches[0]['path'])
    try:result=provision(device,recipient)
    finally:device.close()
    print(result)

if __name__=='__main__':main()
