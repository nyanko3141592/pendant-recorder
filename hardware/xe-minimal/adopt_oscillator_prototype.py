from pathlib import Path
import json,hashlib,shutil,csv,subprocess
O=Path(__file__).resolve().parent;sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest();r=json.loads((O/'oscillator-prototype-review.json').read_text());a=json.loads((O/'active-design.json').read_text());board=O/'pendant-xe-minimal.kicad_pcb';assert sha(board)==r['source_sha256']==a['sha256'][board.name];assert not r['violations'] and not r['parity'] and r['unconnected_items']==20
assert not any(s['violations'] for s in json.loads((O/'oscillator-prototype-sch-check.json').read_text())['sheets'])
backup=O/'pre-oscillator-prototype';backup.mkdir(exist_ok=True)
for name in [board.name,'pendant-xe-minimal.kicad_sch','design.json','bom.csv','connections.csv','active-design.json','current-drc.json','exact-via-pad-overlap-audit.json']:shutil.copyfile(O/name,backup/name)
for ext in ['.kicad_pcb','.kicad_sch']:shutil.copyfile((O/'oscillator-prototype-candidate').with_suffix(ext),(O/'pendant-xe-minimal').with_suffix(ext))
values=r['parts'];foot='PendantMinimal:Crystal_ABS06_2012_RecommendedLand';notes={'Y1':'Prototype selected ABS06-32.768KHZ-7-T; recommended land; LSE drive/startup/accuracy qualification pending.','C11':'Prototype GRM1555C1H5R6CA01D;5.6pF C0G50V +/-0.25pF. Assumes PCB stray1.2pF plus internal3pF typical; tune on prototype.','C12':'Prototype GRM1555C1H5R6CA01D;5.6pF C0G50V +/-0.25pF. Assumes PCB stray1.2pF plus internal3pF typical; tune on prototype.'}
f=O/'design.json';d=json.loads(f.read_text())
for p in d['parts']:
 if p['ref'] in values:
  p['value']=values[p['ref']];p['note']=notes[p['ref']]
  if p['ref']=='Y1':p['footprint']=foot
f.write_text(json.dumps(d,indent=2)+'\n')
for name,column in [('bom.csv','Part/value'),('connections.csv','Part')]:
 f=O/name
 with f.open(newline='') as h:reader=csv.DictReader(h);fields=reader.fieldnames;rows=list(reader)
 for row in rows:
  ref=row['Reference']
  if ref in values:
   row[column]=values[ref]
   if name=='bom.csv':
    row['Design note']=notes[ref]
    if ref=='Y1':row['Footprint']=foot
 with f.open('w',newline='') as h:w=csv.DictWriter(h,fieldnames=fields);w.writeheader();w.writerows(rows)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for kind,ext,out in [('pcb','.kicad_pcb','current-drc.json'),('sch','.kicad_sch','current-erc.json')]:
 subprocess.run([cli,kind,'drc' if kind=='pcb' else 'erc',str((O/'pendant-xe-minimal').with_suffix(ext)),*(['--schematic-parity'] if kind=='pcb' else []),'--format','json','--severity-all','-o',str(O/out)],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
d=json.loads((O/'current-drc.json').read_text());assert not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==20;assert not any(s['violations'] for s in json.loads((O/'current-erc.json').read_text())['sheets'])
for name in a['sha256']:a['sha256'][name]=sha(O/name)
a['latest_candidate_review']='oscillator-prototype-review.json';a['oscillator_status']='PROTOTYPE_PARTS_SELECTED_NOT_MEASURED';(O/'active-design.json').write_text(json.dumps(a,indent=2)+'\n');r['adopted']=True;r['status']='PROTOTYPE_PARTS_ADOPTED_NOT_HARDWARE_QUALIFIED';(O/'oscillator-prototype-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Adopted oscillator prototype;ERC0 DRC0 parity0 unconnected20')
