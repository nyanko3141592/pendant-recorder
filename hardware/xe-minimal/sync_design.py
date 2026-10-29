"""Synchronize placement candidate pin table with inherited electrical design."""
import pcbnew
import json
from pathlib import Path
O=Path(__file__).resolve().parent; H=O.parent
b=pcbnew.LoadBoard(str(O/'placement-seed-NOT-ROUTED.kicad_pcb'))
fps={f.GetReference():f for f in b.GetFootprints()}
d=json.loads((H/'mini-rect-v15/input-control-pa2-pb5/design.json').read_text())
d['parts']=[p for p in d['parts'] if p['ref'] in fps]
u11={'ref':'U11','value':'CSNP32GCR01-BOW candidate','section':3,'note':'SPI managed storage comparison; supply, auxiliary land and peak energy not qualified.','pins':[{'number':str(n),'name':name,'net':net,'type':typ} for n,name,net,typ in [(1,'RSV',None,'no_connect'),(2,'CS_N','SD_CS_N','input'),(3,'CLK','SD_CLK','input'),(4,'VSS','GND','power_in'),(5,'DI','SD_MOSI','input'),(6,'DO','SD_MISO','output'),(7,'RSV',None,'no_connect'),(8,'VDD','SD_V3','power_in')]]}
d['parts'].append(u11)
for p in d['parts']:
 f=fps[p['ref']]
 p['footprint']=str(f.GetFPID().GetLibNickname())+":"+str(f.GetFPID().GetLibItemName())
 if p['ref']=='J3':
  p['pins']=[v for v in p['pins'] if v['number']!='6']; p['value']='Factory SWD pogo candidate';p['note']='Five exposed pads; factory fixture required; VTref sense only. No buyer flashing.';p['footprint']='PendantMinimal:SWD_Pogo_5Pad_P1.27mm'
 p.setdefault('note','Inherited engineering candidate; qualification pending.')
# Prove pin-level correspondence, including every connected physical pad.
errors=[];count=0
for p in d['parts']:
 expected={pin['number']:pin['net'] for pin in p['pins']}
 for pad in fps[p['ref']].Pads():
  number=pad.GetNumber();net=pad.GetNetname()
  if not number:
   if net:errors.append([p['ref'],'unnumbered connected pad',net])
   continue
  if p['ref']=='J2' and number=='MP' and not net:continue
  if number not in expected:errors.append([p['ref'],number,'missing schematic pin']);continue
  want=expected[number]; actual=net.lstrip('/') if net and not net.startswith('unconnected-') else None
  if want!=actual:errors.append([p['ref'],number,want,actual])
  count+=1
assert not errors,errors
d.update(revision='XE minimal placement experiment',status='UNROUTED_NOT_RELEASED',case_limit_mm=None)
(O/'design.json').write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n')
(O/'design-parity-review.json').write_text(json.dumps({'status':'PHYSICAL_PAD_NETS_MATCH_DESIGN_TABLE','checked_pads':count,'errors':errors,'scope':'Net correspondence only; not electrical correctness or routing qualification.'},indent=2)+'\n')
print('Matched',count,'pads')
