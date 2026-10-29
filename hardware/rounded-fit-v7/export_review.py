"""Generate a DFM review package. Never declares manufacturing release."""
from pathlib import Path
import subprocess,json,csv,hashlib,zipfile,shutil
P=Path(__file__).resolve().parent;O=P/'manufacturing-review';G=O/'gerber';G.mkdir(parents=True,exist_ok=True)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';board=P/'pendant-compact-100-v5.kicad_pcb'
def run(*args):subprocess.run([cli,*map(str,args)],check=True)
run('pcb','drc','--format','json','--schematic-parity','-o',P/'drc.json',board)
d=json.load(open(P/'drc.json'));assert not d['violations'] and not d['unconnected_items'] and not d.get('schematic_parity',[])
run('sch','erc','--format','json','-o',P/'erc.json',P/'pendant-compact-100-v5.kicad_sch')
assert all(not sheet['violations'] for sheet in json.load(open(P/'erc.json'))['sheets'])
assert json.load(open(P/'order-status.json'))['pcb_sha256']==hashlib.sha256(board.read_bytes()).hexdigest(), 'Run verify.py against current board first'
for src,dst in [('order-status.json','source-order-status.json'),('drc.json','drc.json'),('erc.json','erc.json')]:shutil.copyfile(P/src,O/dst)
run('pcb','export','gerbers','-l','F.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,B.Cu,F.Mask,B.Mask,F.Paste,B.Paste,F.Silkscreen,B.Silkscreen,Edge.Cuts','--subtract-soldermask','-o',str(G)+'/',board)
run('pcb','export','drill','--excellon-units','mm','--excellon-separate-th','--excellon-oval-format','route','--generate-report','--report-path',O/'drill-report.txt','-o',str(G)+'/',board)
run('pcb','export','pos','--format','csv','--units','mm','--side','both','--exclude-dnp','-o',O/'kicad-positions.csv',board)
parts=json.load(open(P/'sourcing-current.json'))['parts'];population={x['ref']:x for x in parts if x['catalog_code']}
assert len(population)==80
groups={}
for x in population.values():groups.setdefault((x['mpn_candidate'],x['footprint'],x['catalog_code']),[]).append(x['ref'])
with (O/'BOM-CANDIDATE-NOT-RELEASED.csv').open('w') as f:
 w=csv.writer(f,lineterminator="\n");w.writerow(['Comment','Designator','Footprint','LCSC Part #'])
 for (mpn,fp,code),refs in groups.items():w.writerow([mpn,','.join(refs),fp,code])
rows=list(csv.DictReader(open(O/'kicad-positions.csv')));seen=set()
with (O/'CPL-CANDIDATE-NOT-RELEASED.csv').open('w') as f:
 w=csv.writer(f,lineterminator="\n");w.writerow(['Designator','Mid X','Mid Y','Layer','Rotation'])
 for r in rows:
  ref=r['Ref']
  if ref not in population:continue
  assert ref not in seen;seen.add(ref)
  w.writerow([ref,r['PosX'],r['PosY'],'Top' if r['Side']=='top' else 'Bottom',r['Rot']])
assert seen==set(population),(seen^set(population))
manifest={'order_ready':False,'purpose':'SUPPLIER_DFM_REVIEW_ONLY','pcb_sha256':hashlib.sha256(board.read_bytes()).hexdigest(),'populated_references':80,'catalog_candidates':80,'placement_rows':len(seen),'drc_violations':0,'unconnected_items':0,'schematic_parity':0,'stackup':'6-layer 0.8mm; exact manufacturer stackup NOT accepted','vias_mm':{'diameter':.35,'drill':.15},'pending':['Supplier DFM/stackup/panelization acceptance','BOM sourcing and electrical qualification','CPL component rotation validation in vendor viewer','USB ground-land adjustment acceptance','Completed protected battery/harness and charging profile','Enclosure tolerances, body heights and solderless assembly materials'],'files':{}}
for f in sorted(O.rglob('*')):
 if f.is_file() and f.name!='manifest.json':manifest['files'][str(f.relative_to(O))]=hashlib.sha256(f.read_bytes()).hexdigest()
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
with zipfile.ZipFile(P/'DFM-REVIEW-NOT-FOR-ORDER.zip','w',zipfile.ZIP_DEFLATED) as z:
 for f in sorted(O.rglob('*')):
  if f.is_file():z.write(f,str(f.relative_to(O)))
print('DFM-only package generated; 80 matched BOM/CPL refs, not released')
