"""Replace NRND NTC identity in a separate candidate; no geometry or net change."""
from pathlib import Path
import shutil,hashlib,json,subprocess,csv
O=Path(__file__).resolve().parent;S=O/'usb-margin-detour-trial';D=O/'ncu-sensor-trial';D.mkdir(exist_ok=True)
old='NCP18XH103F03RB 10k 1% B3380 candidate';new='NCU18XH103F60RB 10k 1% B3380 candidate';sources={}
for p in S.iterdir():
 if p.is_dir()and p.suffix=='.pretty':shutil.copytree(p,D/p.name,dirs_exist_ok=True)
 elif p.is_file()and(p.suffix in ['.kicad_pcb','.kicad_sch','.kicad_pro','.kicad_dru']or p.name=='fp-lib-table'):
  if p.suffix in ['.kicad_pcb','.kicad_sch']:
   text=p.read_text();assert text.count(old)==(2 if p.suffix=='.kicad_sch'else 1),(p,text.count(old));out=text.replace(old,new);assert out.replace(new,old)==text;(D/p.name).write_text(out);sources[p.name]=hashlib.sha256(p.read_bytes()).hexdigest()
  else:shutil.copyfile(p,D/p.name)
p=D/'pendant-xe-minimal.kicad_pcb';subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(p),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,stdout=subprocess.DEVNULL)
bom=O/'dmn-land-trial/candidate-mpn-review.csv'
with bom.open()as f:reader=csv.DictReader(f);fields=reader.fieldnames;rows=list(reader)
changed=0
for row in rows:
 if row['Reference']=='TH1':
  assert row['MPN_written_in_source']=='NCP18XH103F03RB';row['MPN_written_in_source']='NCU18XH103F60RB';row['Value']=new;row['Status']='ENGINEERING_REPLACEMENT_CANDIDATE_NOT_QUALIFIED';row['Source']='docs/procurement/xe-ncu-sensor-review.json';row['Remaining']='Full R-T tolerance, body/land/process and thermal-contact qualification; procurement not reserved';changed+=1
assert changed==1
with(D/'candidate-mpn-review.csv').open('w')as f:w=csv.DictWriter(f,fieldnames=fields);w.writeheader();w.writerows(rows)
d=json.loads((D/'drc.json').read_text());r={'status':'NCU_SENSOR_ENGINEERING_TRIAL_NOT_RELEASED','source_sha256':sources,'output_pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'change':'TH1 part identity only in PCB and schematic; inverse text substitution exactly reproduces source files','checks':{k:len(d[k])for k in ['violations','unconnected_items','schematic_parity']},'bom_references':len(rows),'bom_changed_references':['TH1'],'limits':['No physical charging or temperature qualification','Current3D model still uses generic resistor envelope forTH1','Previous manufacturing outputs belong to previous PCB; not silently relabeled']};(D/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
