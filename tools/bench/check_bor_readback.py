#!/usr/bin/env python3
"""Check an externally captured STM32U535 FLASH_OPTR value; never program hardware."""
import argparse,json
from pathlib import Path

def check(record):
    for field in ('unit_serial','captured_at','capture_method','reset_after_programming'):
        if field not in record: raise ValueError('Missing '+field)
    for field in ('unit_serial','captured_at','capture_method'):
        if not isinstance(record[field],str) or not record[field].strip(): raise ValueError('Invalid '+field)
    value=record.get('flash_optr')
    if isinstance(value,str):
        try: value=int(value,0)
        except ValueError as e: raise ValueError('Invalid FLASH_OPTR') from e
    if type(value) is not int or not 0<=value<=0xffffffff: raise ValueError('FLASH_OPTR must be an unsigned 32-bit integer')
    if type(record['reset_after_programming']) is not bool: raise ValueError('reset_after_programming must be boolean')
    level=(value&0x700)>>8
    issues=[]
    if level!=4: issues.append('BOR4 is required for the current candidate circuit')
    if not record['reset_after_programming']: issues.append('Readback must follow option-byte reload/reset')
    return {'status':'READBACK_FIELDS_PASS' if not issues else 'READBACK_FIELDS_FAIL','unit_serial':record['unit_serial'],'flash_optr':f'0x{value:08X}','bor_level':level,'issues':issues,'limits':['Input provenance is supplied by operator; retain raw programmer capture with unit identity','Does not program or verify a connected device','Does not prove reset voltage, transient response, recording endurance, or complete option-byte configuration']}

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('record',type=Path);a=p.parse_args()
    try: result=check(json.loads(a.record.read_text()))
    except (ValueError,OSError,TypeError) as e: p.error(str(e))
    print(json.dumps(result,indent=2));return bool(result['issues'])
if __name__=='__main__': raise SystemExit(main())
