#!/usr/bin/env python3
"""Rev C0 size-first electrical study; not a manufacturing release."""
import json,shutil,re
from pathlib import Path
R=Path(__file__).resolve().parents[1];O=R/'rev-c';O.mkdir(exist_ok=True)
a={p['ref']:p for p in json.loads((R/'rev-a/design.json').read_text())['parts']}
b=json.loads((R/'rev-b/design.json').read_text())
# Remove wireless MCU and gauge; preserve microphone/charger safety circuits.
remove={'U1','U7','C21','R18','R19','R20','C20'}
parts=[p for p in b['parts'] if p['ref'] not in remove]
# 48-pin LDO package: USB supply shares VDD, so use 3.3 V with tolerance headroom.
for p in parts:
 for q in p['pins']:
  if q['net']=='V3':q['net']='V3V3'
 if p['ref']=='U2':p['value']='USBLC6-2P6';p['footprint']='Package_TO_SOT_SMD:SOT-666';p['note']='ST DS4260 same 6-pin function diagram; smaller package, LCSC C15999 catalog; orientation/land pattern final audit pending.'
 if p['ref']=='U4':p['value']='TPS7A0233PDBVR';p['note']='3.3V main rail: 48-pin MCU has no separate USB supply; dropout/capacity measurement required.'
 if p['ref'] in ['R8','R9']:p['value']='0R tuning';p['note']='STM32 integrated USB termination; external series value validate against ST USB layout guidance.'
 if p['ref']=='J3':p['note']='TC2030-NL/CTX standard; completed STM32-compatible probe/cable; access with battery disconnected.'
 if p['ref']=='C4':p['note']='Main bulk capacitor; check startup and effective capacitance.'
# Small passives and MCU support from Rev A, without dedicated USB regulator.
for r in ['C2','C3','C5','C6','C7','R1','R3','Q3','R13','R14','R15']:
 p=json.loads(json.dumps(a[r]))
 for q in p['pins']:
  if q['net']=='V3':q['net']='V3V3'
 parts.append(p)
def passive(r,v,net1,net2,cap=False):
 parts.append(dict(ref=r,value=v,pins=[dict(number='1',name='1',net=net1,type='passive'),dict(number='2',name='2',net=net2,type='passive')],section=2,note='Battery divider 1:2; sample after settling, calibrate with VREFINT; not coulomb counting.',footprint=('Capacitor_SMD:C' if cap else 'Resistor_SMD:R')+'_0402_1005Metric'))
passive('R33','1M 1%','BAT','BAT_ADC');passive('R34','1M 1%','BAT_ADC','GND');passive('C28','10n','BAT_ADC','GND',True)
s=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/symbols/MCU_ST_STM32U5.kicad_sym').read_text();s=s[s.index('(symbol "STM32U535CEUx"'):s.index('(symbol "STM32U535CEUxQ"')]
m={'VBAT':'V3V3','PC14':'LSE_IN','PC15':'LSE_OUT','NRST':'NRST','VSSA':'GND','VDDA':'VDDA','PA0':'VBUS_N','PA1':'BAT_ADC','PA2':'MIC_WAKE','PA3':'MIC_THSEL','PA4':'SD_CS_N','PA5':'SD_CLK_MCU','PA6':'SD_MISO','PA7':'SD_MOSI','PB0':'SD_EN','PB1':'MIC_EN','PB2':'CHG_DISABLE','VCAP':'VCAP','VSS':'GND','VDD':'V3V3','PB12':'REC_LED','PB13':'BUTTON_N','PB14':'CHG_N','PA8':'STATUS_LED','PA11':'USB_DM_MCU','PA12':'USB_DP_MCU','PA13':'SWDIO','PA14':'SWCLK','PB3':'PDM_CLK_MCU','PB4':'PDM_DATA','PH3':'BOOT0'}
pins=[]
for block in s.split('(pin ')[1:]:
 n=re.search(r'\(name "([^"]+)"',block);num=re.search(r'\(number "([^"]+)"',block)
 if n and num:pins.append(dict(number=num[1],name=n[1],net=m.get(n[1]),type=block.split()[0]))
assert len(pins)==49
parts.insert(0,dict(ref='U1',value='STM32U535CEU6',pins=pins,section=0,note='512KB Flash/274KB RAM; non-SMPS UFQFPN48. PB3/PB4 ADF AF3; PA5/6/7 SPI1 AF5. VDD USB shared 3.3V. JLC acceptance and pin review pending.',footprint='Package_DFN_QFN:QFN-48-1EP_7x7mm_P0.5mm_EP5.6x5.6mm'))
d={'revision':'C0 SIZE-FIRST ELECTRICAL / PLACEMENT STUDY - NOT FOR FABRICATION','parts':parts,'sources':{'mcu':'https://www.st.com/resource/en/datasheet/stm32u535ce.pdf','mcu_product':'https://www.st.com/en/microcontrollers-microprocessors/stm32u535ce.html','pin_reference':'KiCad 10 MCU_ST_STM32U5 STM32U535CEUx; ST DS14217 tables 26-28 require final independent audit'},'release_status':'BLOCKED: no routed/validated PCB, pin/footprint audit, procurement, assembly, runtime, firmware'}
(O/'design.json').write_text(json.dumps(d,indent=2)+'\n')
shutil.copytree(R/'rev-b/Pendant.pretty',O/'Pendant.pretty',dirs_exist_ok=True)
if not (O/'pendant-rev-c.kicad_pro').exists():(O/'pendant-rev-c.kicad_pro').write_text(json.dumps({'meta':{'filename':'pendant-rev-c.kicad_pro','version':1}},indent=2))
libs=sorted({p['footprint'].split(':')[0] for p in parts})
(O/'fp-lib-table').write_text('(fp_lib_table\n'+''.join('(lib (name "'+lib+'") (type "KiCad") (uri "'+('${KIPRJMOD}/Pendant.pretty' if lib=='Pendant' else '${KICAD10_FOOTPRINT_DIR}/'+lib+'.pretty')+'") (options "") (descr ""))\n' for lib in libs)+')\n')
print(len(parts),'parts')
