"""Check the actual MCU net assignment against the HAL GPIO mapping."""
from pathlib import Path
import json,re
root=Path(__file__).resolve().parents[3]
d=json.loads((root/'hardware/mini-rect-v15/input-control-pa2-pb5/design.json').read_text())
pins=next(p['pins'] for p in d['parts'] if p['ref']=='U1')
text=(root/'firmware/stm32/board/usb_input_v15_pins.h').read_text()
for role,net in [('SUSPEND','USB_SUSPEND_PULSE'),('BUDGET','USB_HIGH_BUDGET'),('RESUME','USB_RESUME_PULSE')]:
 port=re.search(r'#define USB_INPUT_'+role+r'_PORT GPIO([A-Z])',text).group(1)
 num=re.search(r'#define USB_INPUT_'+role+r'_PIN GPIO_PIN_(\d+)',text).group(1)
 matches=[p for p in pins if p['net']==net]
 assert len(matches)==1 and matches[0]['name']=='P'+port+num,(role,matches)
print('PASS firmware GPIO map matches three actual schematic MCU nets')

storage=(root/'firmware/stm32/board/storage_power_pins.h').read_text()
port=re.search(r'#define STORAGE_ENABLE_PORT GPIO([A-Z])',storage).group(1)
num=re.search(r'#define STORAGE_ENABLE_PIN GPIO_PIN_(\d+)',storage).group(1)
assert [p['name'] for p in pins if p['net']=='SD_EN']==['P'+port+num]
print('PASS storage enable map matches actual schematic MCU net')
