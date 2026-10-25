"""Create current BOM/CPL and Gerbers for quotation, never manufacturing release."""
from pathlib import Path
import json,csv,subprocess,hashlib,zipfile,copy
P=Path(__file__).resolve().parent;R=P.parents[1];O=P/'quotation';G=O/'gerber';G.mkdir(parents=True,exist_ok=True)
d=json.loads((P/'design.json').read_text());old={p['ref']:p for p in json.loads((R/'hardware/omi-fit-d1/sourcing-candidates.json').read_text())['parts']};delta={r:p for p in json.loads((P/'sourcing-delta.json').read_text())['parts'] for r in p['refs']}
rows=[]
for p in d['parts']:
 ref=p['ref'];e=old.get(ref)
 if ref=='J3' or ref.startswith('TP'):continue
 if ref=='J2':mpn,code,url='0781710003','C564183','https://www.lcsc.com/product-detail/C564183.html'
 elif ref in delta:e=delta[ref];mpn,code,url=e['mpn'],e['catalog'],e['source']
 else:
  assert e and e['design_value']==p['value'] and e['footprint']==p['footprint'],ref
  mpn,code,url=e['mpn_candidate'],e['catalog_code'],e['source']
 rows.append(dict(ref=ref,value=p['value'],footprint=p['footprint'],mpn_candidate=mpn,catalog_code=code,source=url,stock_confirmed=False,assembly_accepted=False))
assert len(rows)==80
(P/'sourcing-current.json').write_text(json.dumps(dict(status='QUOTE_CANDIDATES_NOT_APPROVED',date='2026-10-25',parts=rows),indent=2)+'\n')
groups={}
for p in rows:groups.setdefault((p['mpn_candidate'],p['footprint'],p['catalog_code']),[]).append(p['ref'])
with (O/'BOM-QUOTE-NOT-RELEASED.csv').open('w') as f:
 w=csv.writer(f,lineterminator='\n');w.writerow(['Comment','Designator','Footprint','LCSC Part #'])
 for (mpn,fp,code),refs in groups.items():w.writerow([mpn,','.join(refs),fp,code])
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';b=P/'pendant-charge-guard-v4.kicad_pcb'
assert hashlib.sha256(b.read_bytes()).hexdigest()==json.loads((P/'order-status.json').read_text())['pcb_sha256']
def run(*a):subprocess.run([cli,*map(str,a)],check=True)
run('pcb','export','gerbers','-l','F.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,B.Cu,F.Mask,B.Mask,F.Paste,B.Paste,F.Silkscreen,B.Silkscreen,Edge.Cuts','--subtract-soldermask','-o',str(G)+'/',b)
run('pcb','export','drill','--excellon-units','mm','--excellon-separate-th','--excellon-oval-format','route','-o',str(G)+'/',b)
run('pcb','export','pos','--format','csv','--units','mm','--side','both','--exclude-dnp','-o',O/'kicad-positions.csv',b)
pop={p['ref'] for p in rows};seen=set()
with (O/'CPL-QUOTE-NOT-RELEASED.csv').open('w') as f:
 w=csv.writer(f,lineterminator='\n');w.writerow(['Designator','Mid X','Mid Y','Layer','Rotation'])
 for p in csv.DictReader((O/'kicad-positions.csv').open()):
  if p['Ref'] not in pop:continue
  assert p['Ref'] not in seen;seen.add(p['Ref']);w.writerow([p['Ref'],p['PosX'],p['PosY'],'Top' if p['Side']=='top' else 'Bottom',p['Rot']])
assert seen==pop
with zipfile.ZipFile(O/'GERBER-QUOTE-NOT-FOR-ORDER.zip','w',zipfile.ZIP_DEFLATED) as z:
 for f in sorted(G.iterdir()):
  if f.is_file():z.write(f,f.name)
manifest=dict(purpose='QUOTE_ONLY_NOT_FOR_ORDER',pcb_sha256=hashlib.sha256(b.read_bytes()).hexdigest(),populated_refs=80,unique_skus=len(groups),quantity_scenarios=[5,10],pending=['NTC specifications','part availability and pricing','CPL orientation acceptance','DFM and stackup acceptance'],files={f.name:hashlib.sha256(f.read_bytes()).hexdigest() for f in O.iterdir() if f.is_file() and f.name!='manifest.json'})
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n');print('80 populated references;',len(groups),'SKUs; quote files complete')
