"""Build a public-only engineering configuration; never create keys or flash hardware."""
import argparse, hashlib, json, re
from pathlib import Path
ALPHABET='qpzry9x8gf2tvdw0s3jn54khce6mua7l'

def recipient_bytes(text):
    if text != text.lower() or not text.startswith('age1') or len(text)!=62:
        raise ValueError('Expected a lowercase age X25519 public recipient')
    try: data=[ALPHABET.index(c) for c in text[4:]]
    except ValueError: raise ValueError('Invalid recipient character') from None
    chk=1
    for value in [ord(c)>>5 for c in 'age']+[0]+[ord(c)&31 for c in 'age']+data:
        top=chk>>25; chk=((chk&0x1ffffff)<<5)^value
        for i,g in enumerate([0x3b6a57b2,0x26508e6d,0x1ea119fa,0x3d4233dd,0x2a1462b3]):
            if (top>>i)&1: chk^=g
    if chk!=1: raise ValueError('Invalid recipient checksum')
    acc=bits=0;out=bytearray()
    for v in data[:-6]:
        acc=(acc<<5)|v;bits+=5
        while bits>=8:
            bits-=8;out.append((acc>>bits)&255)
    if bits>=5 or (acc & ((1<<bits)-1)) or len(out)!=32:
        raise ValueError('Invalid recipient encoding')
    return bytes(out)

def prepare(directory, recipient, vid, pid, cutoff_mv, usb_profile="switched", experimental_charging=False, indicator_profile="button", firmware_version="XE-EVT1-UNQUALIFIED", source_revision="UNCOMMITTED"):
    if usb_profile not in ("switched", "fixed-100"):
        raise ValueError("Unknown USB hardware profile")
    if experimental_charging and usb_profile != "fixed-100":
        raise ValueError("This generator enables bench charging only for fixed-100")
    if indicator_profile not in ("button", "periodic-60s"):
        raise ValueError("Unknown battery indicator profile")
    interval_ms = 60000 if indicator_profile == "periodic-60s" else 0
    if not re.fullmatch(r'[A-Za-z0-9._+-]{1,64}',firmware_version) or not re.fullmatch(r'[A-Fa-f0-9]{7,40}|UNCOMMITTED',source_revision):
        raise ValueError('Unsafe firmware version or source revision')
    key=recipient_bytes(recipient) if recipient is not None else None
    if not 0<vid<65536 or not 0<pid<65536 or (vid,pid)==(0x1234,0x5678):
        raise ValueError('Explicit non-fixture USB identifiers required; allocation must be verified separately')
    if not 3000<=cutoff_mv<=4200: raise ValueError('Cutoff must be3000..4200mV; hardware qualification remains required')
    directory=Path(directory);directory.mkdir(parents=False,exist_ok=False)
    header=('/* Public-only engineering configuration; NOT a production release. */\n'
            + ('#define PENDANT_FACTORY_COMMON_FIRMWARE 1\n' if recipient is None else f'#define PENDANT_AGE_RECIPIENT "{recipient}"\n') +
            f'#define PENDANT_FIRMWARE_VERSION "{firmware_version}"\n#define PENDANT_SOURCE_REVISION "{source_revision}"\n'
            '#define PENDANT_HARDWARE_REVISION "XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH"\n'
            f'#define PENDANT_USB_VID 0x{vid:04x}\n#define PENDANT_USB_PID 0x{pid:04x}\n'
            '#define PENDANT_COOPERATIVE_SAVE 1\n#define WAV_CHUNK_SAMPLES 160000U\n'
            f'#define PENDANT_BATTERY_STOP_MV {cutoff_mv}U\n'
            f'#define PENDANT_FIXED_USB_LIMIT {int(usb_profile == "fixed-100")}\n'
            '#define PENDANT_USB_MAX_POWER_MA 100\n'
            f'#define PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS {interval_ms}U\n'
            f'#define PENDANT_EXPERIMENTAL_USB_CHARGING {int(experimental_charging)}\n')
    (directory/'device-config.h').write_text(header)
    common=recipient is None
    manifest={'status':'ENGINEERING_COMMON_CONFIG_ONLY_NOT_FLASH_OR_RELEASE' if common else 'ENGINEERING_CONFIG_ONLY_NOT_FLASH_OR_RELEASE','profile':'FIRST_USE_HID_RECIPIENT' if common else 'LEGACY_COMPILETIME_RECIPIENT','firmware_version':firmware_version,'source_revision':source_revision,'hardware_revision':'XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH','recipient':recipient,'recipient_key_sha256':hashlib.sha256(key).hexdigest() if key else None,'usb_vid':vid,'usb_pid':pid,'cutoff_mv':cutoff_mv,'header_sha256':hashlib.sha256(header.encode()).hexdigest(),'private_key_included':False,'buyer_public_key_included':not common,'usb_hardware_profile':usb_profile,'experimental_charging':experimental_charging,'indicator_profile':indicator_profile,'automatic_battery_indicator_ms':interval_ms,'remaining':['USB identifier allocation evidence','Cutoff/usable-capacity qualification','Application build with this config and no conflicting fixture defines','First-use HID/flash provisioning hardware qualification','Factory flash/readback','Hardware and manufacturing release review']}
    (directory/'config-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    return directory

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--recipient',help='Legacy per-buyer engineering build only; omit for common first-use-HID firmware');p.add_argument('--directory',required=True);p.add_argument('--vid',type=lambda x:int(x,0),required=True);p.add_argument('--pid',type=lambda x:int(x,0),required=True);p.add_argument('--cutoff-mv',type=int,required=True);p.add_argument('--firmware-version',default='XE-EVT1-UNQUALIFIED');p.add_argument('--source-revision',default='UNCOMMITTED');p.add_argument("--usb-profile",choices=["switched","fixed-100"],default="switched");p.add_argument("--experimental-charging",action="store_true");p.add_argument("--indicator-profile",choices=["button","periodic-60s"],default="button",help="periodic-60s disables the PA15 button input; requires matching hardware");a=p.parse_args()
    try: print(prepare(a.directory,a.recipient,a.vid,a.pid,a.cutoff_mv,a.usb_profile,a.experimental_charging,a.indicator_profile,a.firmware_version,a.source_revision))
    except (ValueError,OSError) as e:p.exit(1,str(e)+'\n')
