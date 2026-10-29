"""Reproducible local manufacturing-review package, never a production release."""
from pathlib import Path
import csv,json,hashlib,subprocess,shutil,zipfile,collections
P=Path(__file__).parent;ROOT=P.parent.parent;OUT=P/'manufacturing-review-storage-r6';src=P/'storage-4gb-4u7-candidate.kicad_pcb';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
if OUT.exists():raise SystemExit('Refusing to overwrite existing review bundle')
checks=json.loads((P/'storage-4gb-4u7-drc.json').read_text())
assert not checks['violations'] and not checks['unconnected_items'] and not checks.get('schematic_parity',[])
# Reject stale validation records before exporting any manufacturing files.
proof=json.loads((P/'storage-cap-candidate-change.json').read_text())
for name,digest in proof['sha256'].items():
 assert hashlib.sha256((P/name).read_bytes()).hexdigest()==digest,('stale validation',name)
erc=json.loads((P/'storage-4gb-4u7-erc.json').read_text())
assert not any(sheet['violations'] for sheet in erc['sheets'])
OUT.mkdir();gerber=OUT/'gerber';gerber.mkdir();source=OUT/'source';source.mkdir()
for ext in ['kicad_pcb','kicad_sch','kicad_pro']:shutil.copy2(P/('storage-4gb-4u7-candidate.'+ext),source/('pendant-v12-review.'+ext))
for name in ['storage-4gb-4u7-drc.json','storage-4gb-4u7-erc.json','storage-cap-candidate-change.json','storage-4gb-candidate-change.json','storage-inrush-screen.json','storage-power-bench-plan.json']:shutil.copy2(P/name,OUT/name)
def run(args):subprocess.run([cli]+args,check=True)
run(['pcb','export','gerbers',str(src),'-o',str(gerber)+'/', '--layers','F.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,B.Cu,F.Mask,B.Mask,F.Paste,B.Paste,F.Silkscreen,B.Silkscreen,Edge.Cuts','--subtract-soldermask','--check-zones'])
run(['pcb','export','drill',str(src),'-o',str(gerber)+'/', '--excellon-separate-th','--generate-report','--report-path',str(OUT/'drill-report.txt')])
run(['pcb','export','pos',str(src),'-o',str(OUT/'positions-kicad.csv'),'--format','csv','--units','mm','--side','both'])
parts=json.loads((P/'design-storage-4gb-4u7-candidate.json').read_text())['parts'];oldparts={p['ref']:p for p in json.loads((P.parent/'rounded-fit-v7/design.json').read_text())['parts']}
oldmap={}
for row in csv.DictReader((P.parent/'rounded-fit-v7/quotation/BOM-JLC-QUOTE.csv').open()):
 for ref in row['Designator'].split(','):
  if ref in oldparts:
   o=oldparts[ref];oldmap[(o['value'],o['footprint'])]=(row['Comment'],row['LCSC Part #'])
physical=[p for p in parts if p['ref']!='J3' and not p['ref'].startswith('TP')];refs={p['ref'] for p in physical};assert len(refs)==66
overrides=json.loads((P/'sourcing-storage-4gb-4u7-candidate.json').read_text());shutil.copy2(P/'sourcing-storage-4gb-4u7-candidate.json',OUT/'sourcing-storage-4gb-4u7-candidate.json')
mapping=[];groups=collections.defaultdict(list)
for p in physical:
 candidate=oldmap.get((p['value'],p['footprint']))
 if p['ref']=='U11':candidate=('CSNP16GCR01-AOW','C7527488')
 if p['ref'] in overrides:candidate=(overrides[p['ref']]['mpn'],overrides[p['ref']]['lcsc'])
 comment,code=candidate or (p['value'],'')
 mapping.append(dict(ref=p['ref'],design_value=p['value'],comment=comment,lcsc=code,footprint=p['footprint'],status='UNVERIFIED_CANDIDATE' if code else 'UNMATCHED',basis='Prior value+footprint exact match; stock/specification require fresh review' if code and p['ref']!='U11' else 'Storage candidate from current order-status' if code else 'No exact prior match'))
 if p['ref'] in overrides:mapping[-1]['basis']=overrides[p['ref']]['source'];mapping[-1]['qualification_note']=overrides[p['ref']]['note']
 groups[(comment,p['footprint'],code)].append(p['ref'])
with (OUT/'BOM-JLC-CANDIDATE-NOT-RELEASED.csv').open('w',newline='') as f:
 w=csv.writer(f);w.writerow(['Comment','Designator','Footprint','LCSC Part #'])
 for (comment,fp,code),rr in groups.items():w.writerow([comment,','.join(rr),fp,code])
rows=list(csv.DictReader((OUT/'positions-kicad.csv').open()));print('Position headers',rows[0].keys());positions=[r for r in rows if r['Ref'] in refs];assert {r['Ref'] for r in positions}==refs
with (OUT/'CPL-JLC-CANDIDATE-NOT-RELEASED.csv').open('w',newline='') as f:
 w=csv.writer(f);w.writerow(['Designator','Mid X','Mid Y','Layer','Rotation'])
 for r in positions:w.writerow([r['Ref'],r['PosX']+'mm',r['PosY']+'mm','Top' if r['Side']=='top' else 'Bottom',r['Rot']])
(OUT/'part-match-candidates.json').write_text(json.dumps(mapping,indent=2)+'\n')
(OUT/'NOT_FOR_PRODUCTION.txt').write_text('MANUFACTURING REVIEW ONLY — NOT FOR PRODUCTION\nNo order/payment.\nSource: storage-4gb-4u7-candidate. U11=CSNP32GCR01-BOW/C5440134; C27=CL10A475KP8NNNC/C1705.\n66 assembly refs; J3/testpoint copper excluded. All part matches require qualification, including bottom-side rotation.\n6layer0.8mm filled/capped vias and USB impedance still require JLC confirmation.\nBattery NTC/harness/pulse current, storage auxiliary land/paste/startup, capacitor effectiveC/droop remain open.\nERC/DRC/parity passing does not prove physical operation. Current online JLC R5 quote is a DIFFERENT revision.\nSee accompanying current change and bench-plan files. Existing R5 package unchanged.\n')
manifest={'released':False,'board_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'assembly_count':66,'candidate_code_refs':sum(bool(r['lcsc']) for r in mapping),'unmatched_refs':[r['ref'] for r in mapping if not r['lcsc']],'files':{str(f.relative_to(OUT)):hashlib.sha256(f.read_bytes()).hexdigest() for f in OUT.rglob('*') if f.is_file()}}
(OUT/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
with zipfile.ZipFile(P/(OUT.name+'-NOT-RELEASED.zip'),'w',zipfile.ZIP_DEFLATED) as z:
 for f in OUT.rglob('*'):
  if f.is_file():z.write(f,str(f.relative_to(P)))
print(json.dumps({k:v for k,v in manifest.items() if k!='files'},indent=2))
