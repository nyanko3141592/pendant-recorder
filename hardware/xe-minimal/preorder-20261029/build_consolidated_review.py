from pathlib import Path
import shutil,json,hashlib,csv,subprocess
import pcbnew as k,wx
app=wx.App(False);w=Path(__file__).resolve().parent;root=w.parents[2];out=w/'release-review-20261029';out.mkdir(exist_ok=True);source=w/'c32-branch-clean-trial.kicad_pcb';design=out/'design';design.mkdir(exist_ok=True)
for ext in ['.kicad_pcb','.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copy2(source.with_suffix(ext),design/('pendant-review'+ext))
board=design/'pendant-review.kicad_pcb';b=k.LoadBoard(str(board));bom=list(csv.DictReader((root/'docs/procurement/xe-production-bom-2026-10-28.csv').open()));fps={f.GetReference():f for f in b.GetFootprints()};feature=set();external=set();assembly=[]
for row in bom:
 refs=row['references'].split(',')
 if row['route']=='PCB_FEATURE':feature.update(refs);continue
 if row['route']=='BUYER_FINAL_ASSEMBLY':external.update(refs);continue
 for ref in refs:
  assert ref in fps,ref
  assembly.append((ref,row))
assert len({r for r,_ in assembly})==len(assembly)
assert set(fps)==feature|{r for r,_ in assembly},(set(fps)-feature-{r for r,_ in assembly})
shutil.copy2(root/'docs/procurement/xe-production-bom-2026-10-28.csv',out/'sourcing-bom.csv')
with (out/'assembly-bom-review.csv').open('w') as f:
 wr=csv.writer(f);wr.writerow(['Comment','Designator','Footprint','LCSC Part #'])
 for ref,row in assembly:wr.writerow([row['mpn'],ref,str(fps[ref].GetFPID().GetLibItemName()),row['jlc_part']])
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';logs=out/'logs';logs.mkdir(exist_ok=True)
commands={
 'gerbers':['pcb','export','gerbers','--layers','F.Cu,In1.Cu,In2.Cu,B.Cu,F.Mask,B.Mask,F.Paste,B.Paste,F.Silkscreen,B.Silkscreen,Edge.Cuts','-o',str(out/'gerbers')+'/',str(board)],
 'drills':['pcb','export','drill','--excellon-separate-th','--generate-report','--report-path',str(out/'drill-report.txt'),'-o',str(out/'drills')+'/',str(board)],
 'positions':['pcb','export','pos','--format','csv','--units','mm','-o',str(out/'positions-raw.csv'),str(board)],
 'step':['pcb','export','step','--subst-models','-o',str(out/'current-native-pcba.step'),str(board)],
 'drc':['pcb','drc','--format','json','--schematic-parity','--all-track-errors','-o',str(out/'drc.json'),str(board)]}
for name,args in commands.items():
 r=subprocess.run([cli,*args],capture_output=True,text=True);(logs/(name+'.log')).write_text(r.stdout+r.stderr);assert r.returncode==0,(name,r.stderr[-500:])
with (out/'positions-raw.csv').open() as f:pos=list(csv.DictReader(f))
selected={r for r,_ in assembly};filtered=[r for r in pos if r['Ref'] in selected];assert {r['Ref'] for r in filtered}==selected
with (out/'cpl-review-unverified-rotation.csv').open('w') as f:
 wr=csv.writer(f);wr.writerow(['Designator','Mid X','Mid Y','Layer','Rotation'])
 for r in filtered:wr.writerow([r['Ref'],r['PosX'],r['PosY'],'Top' if r['Side']=='top' else 'Bottom',r['Rot']])
kit=root/'mechanical/xe-minimal/preorder-20261029/l3-ground-011-fit';shutil.copytree(kit,out/'fit-kit',dirs_exist_ok=True)
evidence=out/'evidence';evidence.mkdir(exist_ok=True)
for name in ['c32-branch-clean-review.json','c32-branch-clean-trial-contract.json','branch-clean-critical-comparison.json','c32-branch-clean-trial-signal-returns.json','charger-trace-resistance.json','battery-purchase-and-harness-review.json','jlc-key-parts-catalog-recheck.json']:
 shutil.copy2(w/name,evidence/name)
drc=json.loads((out/'drc.json').read_text());assert all(i['type']=='lib_footprint_issues' for i in drc['violations']);assert not drc['unconnected_items']
manifest={'status':'CONSOLIDATED_REVIEW_PACKAGE_DO_NOT_ORDER','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'packaged_pcb_sha256':hashlib.sha256(board.read_bytes()).hexdigest(),'footprints':len(fps),'assembly_placements':len(assembly),'pcb_features':sorted(feature),'external_assembly':sorted(external),'copper_layers':4,'assembly_rotation_verified':False,'kit_source_pcb_sha256':'d64e60a6290d90dc344157f867ef617c2f95d880290294fa0b9c7988d86a0c1d','kit_status':'Existing placement-matched kit retained; final current-source envelope rebuild pending','order_allowed':False,'upload_allowed':False,'files':{str(p.relative_to(out)):hashlib.sha256(p.read_bytes()).hexdigest() for p in out.rglob('*') if p.is_file() and p.name!='manifest.json'}}
(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n');print(json.dumps({key:v for key,v in manifest.items() if key!='files'}),flush=True)
