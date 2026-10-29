"""Export isolated latest-candidate review data; no release/upload/order."""
from pathlib import Path
import subprocess,json,hashlib,shutil,csv
O=Path(__file__).resolve().parent;S=O/'pdm-stitch-trial';L=O/'led-land-trial';pcb=S/'pendant-xe-minimal.kicad_pcb';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
h=sha(pcb);assert h=='91ffd49059762cf529e7ce7c11ae1718a65bb684665b10a3a57aa4276ffb8afd'
assert sha(S/'pendant-xe-minimal.kicad_sch')==sha(L/'pendant-xe-minimal.kicad_sch')
D=S/('fabrication-review-'+h[:12]);D.mkdir(exist_ok=False);cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(pcb),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((D/'drc.json').read_text());assert all(not d[x]for x in ['violations','unconnected_items','schematic_parity'])
commands=[['pcb','export','gerbers','--layers','F.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,B.Cu,F.Paste,B.Paste,F.Mask,B.Mask,F.Silkscreen,B.Silkscreen,Edge.Cuts','--subtract-soldermask','--output',str(D/'gerbers'),str(pcb)],['pcb','export','drill','--format','excellon','--drill-origin','absolute','--excellon-units','mm','--excellon-separate-th','--generate-map','--map-format','pdf','--generate-report','--report-path',str(D/'drill-report.txt'),'--output',str(D/'drill'),str(pcb)],['pcb','export','pos','--format','csv','--units','mm','--side','both','--exclude-dnp','--output',str(D/'positions-raw.csv'),str(pcb)]]
for cmd in commands:subprocess.run([cli]+cmd,check=True,stdout=subprocess.DEVNULL)
for name in ['delta-review.json','connection-review.json']:shutil.copyfile(S/name,D/name)
shutil.copyfile(L/'bom.csv',D/'bom-engineering.csv')
assert sha(pcb)==h
r={'status':'UNADOPTED_CANDIDATE_ENGINEERING_REVIEW_DO_NOT_ORDER','source_pcb_sha256':h,'source_schematic_sha256':sha(S/'pendant-xe-minimal.kicad_sch'),'bom_source':str(L/'bom.csv'),'commands':commands,'units':'mm','origin':'absolute board origin; bottom X not negated','copper_layers':6,'files_sha256':{str(p.relative_to(D)):sha(p)for p in sorted(D.rglob('*'))if p.is_file()},'unresolved':['Candidate not adopted; Omi size requirement unresolved','Original battery leads and plug fit unresolved','Runtime and thermal contact unmeasured','BOM exact MPN coverage incomplete','Raw placements include bare-board features until filtered','Via process, stackup and CAM review pending','Case retention and production tolerances unresolved'],'upload_or_order_performed':False}
(D/'REVIEW-ONLY.json').write_text(json.dumps(r,indent=2)+'\n');print(D)
