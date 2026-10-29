"""Create an isolated microSD electrical candidate. No manufacturing release."""
import json,hashlib,shutil
from pathlib import Path
P=Path(__file__).resolve().parent
src=P.parent/'mini-rect-v12/design-storage-4gb-4u7-candidate.json'
d=json.loads(src.read_text());d['revision']='mini-rect-v13 microSD electrical candidate'
d['status']='UNROUTED_NOT_RELEASED';d['release_status']='NOT_RELEASED'
d['source']={'path':str(src),'sha256':hashlib.sha256(src.read_bytes()).hexdigest()}
d['parts']=[p for p in d['parts'] if p['ref']!='U11']
rows=[('1','DAT2','SD_DAT2'),('2','DAT3_CS','SD_CS_N'),('3','CMD_DI','SD_MOSI'),('4','VDD','SD_V3'),('5','CLK','SD_CLK'),('6','VSS','GND'),('7','DAT0_DO','SD_MISO'),('8','DAT1','SD_DAT1'),('9','CD_A',None),('10','CD_B',None),('SH','SHELL','GND')]
d['parts'].append(dict(ref='J4',value='DM3D-SF candidate',section=3,footprint='Pendant:DM3D_SF_reviewed_candidate',pins=[dict(number=n,name=name,net=net,type='passive') for n,name,net in rows],note='Internal microSD fitted before case closure; CD switch unused, boot card probe required. Local land candidate matches reviewed drawing, upper keepout extended0.15mm. Current procurement suffix unconfirmed. Card model and power qualification pending.'))
for ref,net in [('R29','SD_DAT1'),('R30','SD_DAT2')]:
 assert not any(p['ref']==ref for p in d['parts'])
 d['parts'].append(dict(ref=ref,value='47k',section=3,footprint='Resistor_SMD:R_0402_1005Metric',pins=[dict(number='1',name='1',net='SD_V3',type='passive'),dict(number='2',name='2',net=net,type='passive')],note='Unused microSD DAT input pull-up to switched rail; verify selected card specification.'))
(P/'design.json').write_text(json.dumps(d,indent=2)+'\n')
review=dict(status='ELECTRICAL_DRAFT_NOT_RELEASED',removed=['U11'],added=['J4','R29','R30'],mcu_pin_assignment_changed=False,
 sources=['https://www.hirose.com/de/product/document?clcode=CL0609-0032-3-00&documentid=D49662_en&documenttype=Catalog&lang=de&productname=DM3CS-SF&series=DM3','https://www.sdcard.org/downloads/pls/'],
 open_items=['Actual card current peaks/standby and procurement','Local socket lands reviewed: see socket-land-verification.json; current orderable suffix/drawing revision still pending','Existing 4.7uF capacitor and supply switch/LDO must be requalified for card transients','Socket insertion/retention and no-copper zones','All SD lines must be tristated before switched rail off','Complete placement and 4-layer routing','No hot-swap support; card is enclosed during operation'])
(P/'electrical-change.json').write_text(json.dumps(review,indent=2)+'\n')
# Keep custom footprints available without changing original library.
lib=P.parent/'mini-rect-v12/Pendant.pretty'
if lib.exists():shutil.copytree(lib,P/'Pendant.pretty',dirs_exist_ok=True)
