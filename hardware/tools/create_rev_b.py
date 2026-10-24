#!/usr/bin/env python3
"""Create Rev B electrical draft. No fabrication readiness is implied."""
import json,shutil
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
a=ROOT/'rev-a'; b=ROOT/'rev-b';b.mkdir(exist_ok=True)
d=json.loads((a/'design.json').read_text())
remove={'U1','U5','C2','C3','C5','C6','C7','C8','C10','R1','R3','C17','Q3','R13','R14','R15','TP7','D3','D4','D5','R29','R30','R31','R26','R27'}
parts=[p for p in d['parts'] if p['ref'] not in remove]
# Pin numbers are MODULE pads, not Nordic SoC pins. Raytac version L pp14-17.
names=['GND','GND','P1.10','P1.11','P1.12','P1.13','P1.14','P1.15','P0.03','P0.29','P0.02','P0.31','P0.28','P0.30','GND','P0.27','P0.00/XL1','P0.01/XL2','P0.26','P0.04','P0.05','P0.06','P0.07','P0.08','P1.08','P1.09','P0.11','VDD','P0.12','VDDH','DCCH','VBUS','GND','USB_D-','USB_D+','P0.14','P0.13','P0.16','P0.15','P0.18/nRESET','P0.17','P0.19','P0.21','P0.20','P0.23','P0.22','P1.00','P0.24','P0.25','P1.02','SWDIO','P0.09/NFC1','SWDCLK','P0.10/NFC2','GND','P1.04','P1.06','P1.07','P1.05','P1.03','P1.01']
m={1:'GND',2:'GND',15:'GND',33:'GND',55:'GND',28:'V3',30:'V3',32:'VBUS',34:'USB_DM_MCU',35:'USB_DP_MCU',40:'NRST',51:'SWDIO',53:'SWCLK',17:'LSE_IN',18:'LSE_OUT',16:'I2C_SCL',19:'I2C_SDA',36:'PDM_CLK_MCU',37:'PDM_DATA',42:'SD_CLK_MCU',43:'SD_MISO',44:'SD_MOSI',45:'SD_CS_N',3:'REC_LED',4:'STATUS_LED',5:'BUTTON_N',6:'BAT_ALERT_N',7:'CHG_N',8:'CHG_DISABLE',9:'MIC_EN',10:'SD_EN',11:'MIC_WAKE',12:'MIC_THSEL'}
pins=[dict(number=str(i),name=n,net=m.get(i),type='power_in' if n in ('GND','VDD','VDDH','VBUS') else 'bidirectional') for i,n in enumerate(names,1)]
parts.insert(0,dict(ref='U1',value='MDBT50Q-1MV2',pins=pins,section=0,note='Raytac Ver L p40: normal voltage, VDD=VDDH=3V, DCCH NC; Reg1 DCDC inside. RF clearance required.',footprint='RF_Module:Raytac_MDBT50Q'))
rename={'SD_CMD':'SD_MOSI','SD_D0':'SD_MISO','SD_D3':'SD_CS_N'}
for p in parts:
 for q in p['pins']:
  q['net']=rename.get(q['net'],q['net'])
 if p['ref']=='U9':
  old={q['name']:q for q in p['pins']}
  order=['VCCA','A1','A2','A3','A4','NC','GND','OE','NC','B4','B3','B2','B1','VCCB']
  p['pins']=[dict(number=str(i),name=n,net=old[n]['net'] if n!='NC' else None,type=old[n]['type'] if n!='NC' else 'passive') for i,n in enumerate(order,1)]
  p['value']='TXS0104EPWR';p['footprint']='Package_SO:TSSOP-14_4.4x5mm_P0.65mm'
  p['note']='TI SCES651K table 5-3; JLC C44955 exact TSSOP-14 catalog match. Avoid 0.4mm DSBGA central-pad escape requirement.'
 if p['ref']=='U11':
  for q in p['pins']:
   q['name']={'1':'RSV','2':'CS_N','3':'CLK','4':'VSS','5':'DI','6':'DO','7':'RSV','8':'VCC'}[q['number']]
   if q['number'] in ['1','7']:q['net']=None
  p['note']='SPI mode per manufacturer p2; unused DAT1/DAT2 reserved; verify power-up and interrupted-write behavior.'
 if p['ref'] in ('R8','R9'):p['value']='27R 1%';p['note']='Raytac reference p40 USB series resistor; signal integrity validation pending.'
 if p['ref']=='J3':p['value']='TC2030 SWD target pads';p['note']='VTref,SWDIO,nRESET,SWCLK,GND,NC; use nRF-compatible completed J-Link probe/cable, not STM32 STLINK assumption.'
 if p['ref']=='C20':p['footprint']='Capacitor_SMD:C_0603_1608Metric';p['value']='10u 10V';p['note']='Raytac reference p40 VBUS capacitor; USB total input capacitance/inrush validation REQUIRED before release.'
 if p['ref']=='C4':p['note']='10u VDD/VDDH decoupling per Raytac p40; effective capacitance review pending.'
 if p['ref']=='D6':p['note']='Battery level by blink count; shared charging/error indication; exact LED MPN pending.'
d={'revision':'B0 ELECTRICAL DRAFT - NOT FOR FABRICATION','parts':parts,'sources':{'module':'https://www.raytac.com/download/index.php?index_id=43','module_pages':[11,14,15,16,17,40],'storage':'https://datasheet.lcsc.com/datasheet/pdf/bfa5f23b6901abecebf24c347afa6e3d.pdf?productCode=C5440134'},'release_status':'BLOCKED: sourcing, power/inrush/thermal, layout, runtime and assembly kit not validated'}
(b/'design.json').write_text(json.dumps(d,indent=2)+'\n')
shutil.copytree(a/'Pendant.pretty',b/'Pendant.pretty',dirs_exist_ok=True)
# Preserve deliberate PCB design settings across electrical regeneration.
if not (b/'pendant-rev-b.kicad_pro').exists():
 (b/'pendant-rev-b.kicad_pro').write_text(json.dumps({'meta':{'filename':'pendant-rev-b.kicad_pro','version':1}},indent=2))
libs=sorted({p['footprint'].split(':')[0] for p in parts})
(b/'fp-lib-table').write_text('(fp_lib_table\n'+''.join('(lib (name "'+lib+'") (type "KiCad") (uri "'+('${KIPRJMOD}/Pendant.pretty' if lib=='Pendant' else '${KICAD10_FOOTPRINT_DIR}/'+lib+'.pretty')+'") (options "") (descr ""))\n' for lib in libs)+')\n')
print(len(parts),'Rev B parts')
