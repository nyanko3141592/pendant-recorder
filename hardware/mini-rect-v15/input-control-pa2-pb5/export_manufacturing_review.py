"""Local manufacturing review files, never upload or declare order release."""
from pathlib import Path
import subprocess,json,csv,hashlib,zipfile
P=Path(__file__).resolve().parent;board=P/'usb-reference-power.kicad_pcb';O=P/'manufacturing-review';G=O/'gerber';G.mkdir(parents=True,exist_ok=True)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
def run(*args):subprocess.run([cli,*map(str,args)],check=True,stdout=subprocess.DEVNULL)
run('pcb','drc','--format','json','-o',O/'drc.json',board)
d=json.loads((O/'drc.json').read_text());assert not d['violations'] and not d['unconnected_items']
a=json.loads(board.with_suffix('.parity.json').read_text());assert a['status']=='PASS' and a['board_sha256']==hashlib.sha256(board.read_bytes()).hexdigest()
run('sch','erc','--format','json','-o',O/'erc.json',P/'pendant-mini-rect-v15.kicad_sch');assert not any(x['violations'] for x in json.loads((O/'erc.json').read_text())['sheets'])
run('pcb','export','gerbers','-l','F.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,B.Cu,F.Mask,B.Mask,F.Paste,B.Paste,F.Silkscreen,B.Silkscreen,Edge.Cuts','--subtract-soldermask','-o',str(G)+'/',board)
run('pcb','export','drill','--excellon-units','mm','--excellon-separate-th','--excellon-oval-format','route','--generate-report','--report-path',O/'drill-report.txt','-o',str(G)+'/',board)
run('pcb','export','pos','--format','csv','--units','mm','--side','both','--exclude-dnp','-o',O/'kicad-positions.csv',board)
parts=json.loads((P/'design.json').read_text())['parts'];excluded=[p['ref'] for p in parts if p['ref'].startswith('TP') or p['ref']=='J3'];assembly={p['ref']:p for p in parts if p['ref'] not in excluded}
with (O/'BOM-ENGINEERING-REVIEW.csv').open('w') as f:
 w=csv.writer(f);w.writerow(['Reference','Design value','Footprint','Supplier part number','Qualification status'])
 for p in assembly.values():w.writerow([p['ref'],p['value'],p['footprint'],'','Exact orderable SKU and matching still required'])
seen=set()
with (O/'CPL-ENGINEERING-REVIEW.csv').open('w') as f:
 w=csv.writer(f);w.writerow(['Designator','Mid X','Mid Y','Layer','Rotation'])
 for r in csv.DictReader((O/'kicad-positions.csv').open()):
  if r['Ref'] not in assembly:continue
  assert r['Ref'] not in seen;seen.add(r['Ref']);w.writerow([r['Ref'],r['PosX'],r['PosY'],'Top' if r['Side']=='top' else 'Bottom',r['Rot']])
assert seen==set(assembly),(seen^set(assembly));assert len(assembly)==85
manifest={'order_ready':False,'purpose':'LOCAL_ENGINEERING_REVIEW_ONLY','board':str(board),'board_sha256':hashlib.sha256(board.read_bytes()).hexdigest(),'design_sha256':hashlib.sha256((P/'design.json').read_bytes()).hexdigest(),'assembly_references':85,'pcb_only_references':excluded,'placement_rows':len(seen),'drc_violations':0,'unconnected_items':0,'erc_violations':0,'pad_value_footprint_parity':a,'pending':['Exact supplier SKU/stock/matching and 5-unit landed cost','Vendor CPL rotation and DFM review','Manufacturer 6-layer stackup/copper/USB impedance acceptance','Power path and charge qualification','USB event firmware integration','Battery harness, mated housing and enclosure assembly qualification'],'files':{}}
for f in sorted(O.rglob('*')):
 if f.is_file() and f.name!='manifest.json':manifest['files'][str(f.relative_to(O))]=hashlib.sha256(f.read_bytes()).hexdigest()
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
with zipfile.ZipFile(P/'ENGINEERING-REVIEW-NOT-FOR-ORDER.zip','w',zipfile.ZIP_DEFLATED) as z:
 for f in sorted(O.rglob('*')):
  if f.is_file():z.write(f,str(f.relative_to(O)))
print('Exported local review: 85 assembly rows, 6 PCB-only references; NOT FOR ORDER')
