"""Export isolated latest-candidate review data; no release/upload/order."""
from pathlib import Path
import subprocess,json,hashlib,shutil,csv
O=Path(__file__).resolve().parent;S=O/'usb-margin-detour-trial';B=O/'dmn-land-trial';pcb=S/'pendant-xe-minimal.kicad_pcb';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
h=sha(pcb);assert h=='3f7962550e31d2a3133989344962d543977c8cea504f3f3c498273edb25d8127'
# Dedicated DMN footprints are synchronized to this candidate schematic.
D=S/('fabrication-review-'+h[:12]);D.mkdir(exist_ok=False);cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(pcb),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((D/'drc.json').read_text());assert all(not d[x]for x in ['violations','unconnected_items','schematic_parity'])
commands=[['pcb','export','gerbers','--layers','F.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,B.Cu,F.Paste,B.Paste,F.Mask,B.Mask,F.Silkscreen,B.Silkscreen,Edge.Cuts','--subtract-soldermask','--output',str(D/'gerbers'),str(pcb)],['pcb','export','drill','--format','excellon','--drill-origin','absolute','--excellon-units','mm','--excellon-separate-th','--generate-map','--map-format','pdf','--generate-report','--report-path',str(D/'drill-report.txt'),'--output',str(D/'drill'),str(pcb)],['pcb','export','pos','--format','csv','--units','mm','--side','both','--exclude-dnp','--output',str(D/'positions-raw.csv'),str(pcb)]]
for cmd in commands:subprocess.run([cli]+cmd,check=True,stdout=subprocess.DEVNULL)
for name in ['registered-review.json','candidate-mpn-review.csv','candidate-mpn-review.json']:shutil.copyfile(B/name,D/name)
# Keep source evidence and avoid presenting earlier registration as a new check.
shutil.move(str(D/'registered-review.json'),str(D/'historical-dmn-registration-review.json'))
for name in ['review.json','route-delta-review.json','usb-neighbor-margin-review.json','ground-connectivity-review.json']:
 shutil.copyfile(S/name,D/name)
# Use the explicit candidate mapping, not the older pre-replacement BOM.
assert sha(pcb)==h
r={'status':'UNADOPTED_CANDIDATE_ENGINEERING_REVIEW_DO_NOT_ORDER','source_pcb_sha256':h,'source_schematic_sha256':sha(S/'pendant-xe-minimal.kicad_sch'),'bom_source':str(B/'candidate-mpn-review.csv'),'commands':commands,'units':'mm','origin':'absolute board origin; bottom X not negated','copper_layers':6,'files_sha256':{str(p.relative_to(D)):sha(p)for p in sorted(D.rglob('*'))if p.is_file()},'unresolved':['Candidate not adopted; Omi size requirement unresolved','Original battery leads and plug fit unresolved','Runtime and thermal contact unmeasured','Candidate MPNs mapped for75parts; Q6/Q7 replacement unadopted, schematic values generic; no purchasing qualification','Raw placements include bare-board features until filtered','Via fill/cap process and CAM review pending; JLC06081H-2116 nominal material Dk updated; loss tangent remains a placeholder','USB local detours checked for clearance; transitions, full return path and impedance remain unqualified','Case retention and production tolerances unresolved'],'upload_or_order_performed':False}
(D/'REVIEW-ONLY.json').write_text(json.dumps(r,indent=2)+'\n');print(D)
