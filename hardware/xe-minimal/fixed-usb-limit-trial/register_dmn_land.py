from pathlib import Path
import pcbnew as k,wx,json,re,subprocess,hashlib,shutil
app=wx.App(False);D=Path(__file__).resolve().parent/'dmn-land-trial';name='SOT23_DMN2056U_DS38480';lib=D/'DiodesTrial.pretty';lib.mkdir(exist_ok=True)
if not any(lib.glob('*.kicad_mod')):
 shutil.copyfile('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Package_TO_SOT_SMD.pretty/SOT-23.kicad_mod',lib/'SOT-23.kicad_mod')
b=k.LoadBoard(str(D/'pendant-xe-minimal.kicad_pcb'))
q7=next(f for f in b.GetFootprints() if f.GetReference()=='Q7')
f=k.FOOTPRINT(q7);f.SetPosition(k.VECTOR2I(0,0));f.SetReference('Q?');f.SetFPID(k.LIB_ID('DiodesTrial',name));k.FootprintSave(str(lib),f)
for f in b.GetFootprints():
 if f.GetReference() in ('Q6','Q7'):f.SetFPID(k.LIB_ID('DiodesTrial',name))
k.SaveBoard(str(D/'pendant-xe-minimal.kicad_pcb'),b)
t=D/'fp-lib-table';s=t.read_text()
if '(name "DiodesTrial")' not in s:s=s.rstrip()[:-1]+'(lib (name "DiodesTrial") (type "KiCad") (uri "${KIPRJMOD}/DiodesTrial.pretty") (options "") (descr "DMN2056U manufacturer land review candidate"))\n)\n'
t.write_text(s)
p=D/'pendant-xe-minimal.kicad_sch';s=p.read_text()
for ref in ('Q6','Q7'):
 pattern=r'(\(property "Reference" "'+ref+r'"[\s\S]{0,650}?\(property "Footprint" ")[^"]+(" )'
 s,n=re.subn(pattern,lambda m:m[1]+'DiodesTrial:'+name+m[2],s);assert n==1,(ref,n)
p.write_text(s)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(D/'pendant-xe-minimal.kicad_pcb'),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc-registered.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
d=json.loads((D/'drc-registered.json').read_text());r={'status':'REGISTERED_LAND_CANDIDATE_NOT_ADOPTED','board_sha256':hashlib.sha256((D/'pendant-xe-minimal.kicad_pcb').read_bytes()).hexdigest(),'checks':{x:len(d[x]) for x in ['violations','unconnected_items','schematic_parity']},'violations':d['violations'],'note':'Generic transistor value retained; electrical selection not approved. Existing silk/courtyard retained.'};(D/'registered-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r['checks']))
