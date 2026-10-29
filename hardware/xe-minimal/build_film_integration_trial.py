"""Synchronize candidate schematic/BOM with the provisional film sensor PCB."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib,shutil,subprocess,re,csv
app=wx.App(False);O=Path(__file__).resolve().parent;S=O/'fixed-usb-limit-trial/ncu-sensor-trial';P=O/'film-lap-pad-placement-study-1';D=O/'film-integration-trial';D.mkdir(exist_ok=True)
src=P/'pendant-xe-film-lap-anynet-footprint-trial.kicad_pcb';assert hashlib.sha256(src.read_bytes()).hexdigest()=='8a15e07c6cba4a34b63e1a68ecd6f066f9f7a6d26d3792a4326b84ecf423718b'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),D/('pendant-xe-minimal'+ext))
shutil.copyfile(P/'fp-lib-table',D/'fp-lib-table');shutil.copytree(P/'PendantWire.pretty',D/'PendantWire.pretty',dirs_exist_ok=True)
# Preserve local custom-library dependencies when regenerating this candidate.
for match in list(re.finditer(r'\(lib \(name "([^"]+)"\).*?\(uri "(\$\{KIPRJMOD\}/\.\./[^"]+)"\)', (D/'fp-lib-table').read_text())):
 name,uri=match.groups();origin=(D/uri.replace('${KIPRJMOD}/','')).resolve()
 destination=D/'libraries'/(name+'.pretty')
 if not origin.is_dir():raise RuntimeError(f'Missing custom library: {origin}')
 shutil.copytree(origin,destination,dirs_exist_ok=True)
 for source_file in origin.rglob('*'):
  if source_file.is_file():assert source_file.read_bytes()==(destination/source_file.relative_to(origin)).read_bytes()
 table=D/'fp-lib-table';table.write_text(table.read_text().replace(uri,'${KIPRJMOD}/libraries/'+name+'.pretty'))
changes={'R13':{'footprint':'Resistor_SMD:R_0201_0603Metric','value':'100k','mpn':'RC0201FR-07100KL'},'TH1':{'footprint':'PendantWire:External_NTC_WirePads_P1.75_0.8x1.8','value':'103JT-025 external 10k 1% B3435 candidate','mpn':'103JT-025'}}
sch=(S/'pendant-xe-minimal.kicad_sch').read_text()
def block_end(s,start):
 depth=0;quoted=False;escape=False
 for i in range(start,len(s)):
  c=s[i]
  if quoted:
   if escape:escape=False
   elif c=='\\':escape=True
   elif c=='"':quoted=False
  elif c=='"':quoted=True
  elif c=='(':depth+=1
  elif c==')':
   depth-=1
   if depth==0:return i+1
 raise ValueError('unbalanced')
for ref,ch in changes.items():
 for prefix in [f'(symbol "Pendant:Part_{ref}"',f'(symbol (lib_id "Pendant:Part_{ref}")']:
  start=sch.index(prefix);end=block_end(sch,start);block=sch[start:end]
  block,n=re.subn(r'(\(property "Footprint" ")[^"]*',lambda m:m[1]+ch['footprint'],block);assert n==(1 if '(lib_id' in prefix else 0),(ref,prefix,n)
  block,n=re.subn(r'(\(property "Value" ")[^"]*',lambda m:m[1]+ch['value'],block);assert n==1,(ref,prefix,n)
  if '(lib_id' in prefix:
   block=block[:-1]+f'(property "MPN" "{ch["mpn"]}" (at 0 0 0) (effects (font (size 1 1)) hide)))'
  sch=sch[:start]+block+sch[end:]
# Materialize the embedded definitions as project-local libraries.
start=sch.index('(lib_symbols');end=block_end(sch,start);library_block=sch[start:end];libs={}
for match in re.finditer(r'\(symbol "([^":]+):([^"]+)"',library_block):
 finish=block_end(library_block,match.start());definition=library_block[match.start():finish];lib,name=match.group(1),match.group(2)
 definition=definition.replace(f'(symbol "{lib}:{name}"',f'(symbol "{name}"',1);libs.setdefault(lib,[]).append(definition)
for lib,definitions in libs.items():(D/(lib+'.kicad_sym')).write_text('(kicad_symbol_lib (version 20241209) (generator kicad_symbol_editor)\n'+'\n'.join(definitions)+'\n)\n')
(D/'sym-lib-table').write_text('(sym_lib_table\n'+'\n'.join(f'(lib (name "{lib}") (type "KiCad") (uri "${{KIPRJMOD}}/{lib}.kicad_sym") (options "") (descr "Embedded candidate symbols"))'for lib in libs)+'\n)\n')
(D/'pendant-xe-minimal.kicad_sch').write_text(sch)
b=k.LoadBoard(str(src));old=k.LoadBoard(str(S/'pendant-xe-minimal.kicad_pcb'));oldrefs={f.GetReference():f for f in old.GetFootprints()}
for f in b.GetFootprints():
 if f.GetReference()in changes:
  ch=changes[f.GetReference()];f.SetValue(ch['value']);f.SetPath(oldrefs[f.GetReference()].GetPath());f.SetField('MPN',ch['mpn']);f.GetField('MPN').SetVisible(False)
  assert f.GetFPID().GetLibItemName() == ch['footprint'].split(':')[1]
out=D/'pendant-xe-minimal.kicad_pcb';k.SaveBoard(str(out),b)
with(S/'candidate-mpn-review.csv').open()as f:reader=csv.DictReader(f);fields=reader.fieldnames;rows=list(reader)
for row in rows:
 ref=row['Reference']
 if ref in changes:
  ch=changes[ref];row.update(Value=ch['value'],MPN_written_in_source=ch['mpn'],Candidate_footprint_override=ch['footprint'],Status='INTEGRATION_CANDIDATE_NOT_QUALIFIED')
  if ref=='TH1':row.update(Source='mechanical/xe-minimal/thermal-reference-documents/semitec-jt.pdf',Remaining='Seller installs external thermistor/wires; excluded from automated placement. R-T bounds, joining, thermal contact, strain relief and procurement remain unqualified.')
  else:row.update(Source='docs/procurement/xe-r13-0201-candidate.json',Remaining='100k 1%, 0.05W, 25V, 200ppm/C candidate; gate/leakage/transient and assembly/procurement qualification remain.')
with(D/'candidate-mpn-review.csv').open('w')as f:w=csv.DictWriter(f,fieldnames=fields);w.writeheader();w.writerows(rows)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,capture_output=True)
subprocess.run([cli,'sch','erc',str(D/'pendant-xe-minimal.kicad_sch'),'--format','json','--severity-all','-o',str(D/'erc.json')],check=True,capture_output=True)
d=json.loads((D/'drc.json').read_text());e=json.loads((D/'erc.json').read_text());r={'status':'FILM_INTEGRATION_CANDIDATE_NOT_RELEASE','source_pcb_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_pcb_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'changes':changes,'bom_references':len(rows),'checks':{key:len(d[key])for key in ['violations','unconnected_items','schematic_parity']},'erc_violations':sum(len(s.get('violations',[]))for s in e.get('sheets',[])),'limits':['Film sensor and R13 engineering selections are provisional; no supplier or physical qualification.','Circuit topology unchanged; TH1 represents seller-installed external sensor on dedicated wire pads, not an SMT thermistor.','BOM is a candidate identity table, not a released order/assembly BOM or complete wire/material cost.','Schematic/PCB consistency does not prove temperature protection, runtime or physical case fit.']};(D/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
