from pathlib import Path
import json,shutil,subprocess,pcbnew as k,wx
app=wx.App(False)
D=Path(__file__).resolve().parent;O=D/'tps22950-placement';O.mkdir(exist_ok=True);name='pendant-xe-minimal'
for n in ['PendantXE.pretty','PendantMinimal.pretty','TPSLimitTrial.pretty']:shutil.copytree(D/n,O/n,dirs_exist_ok=True)
for ext in ['kicad_pro','kicad_dru']:shutil.copyfile(D/(name+'.'+ext),O/(name+'.'+ext))
s=(D/'fp-lib-table').read_text().replace('${KIPRJMOD}/../../mini-rect-v15','${KIPRJMOD}/../../../mini-rect-v15');s=s.rstrip()[:-1]+'(lib (name "TPSLimitTrial") (type "KiCad") (uri "${KIPRJMOD}/TPSLimitTrial.pretty") (options "") (descr "TPS22950 trial"))\n)\n';(O/'fp-lib-table').write_text(s)
libname='TPS22950_YBH0006-C02_SMD_TI_4226594A'
spec=json.loads((D/'design.json').read_text());pinmap={'1':'B2','2':'C1','3':'C2','4':'A1','5':'B1','6':'A2'}
for part in spec['parts']:
 if part['ref']=='U13':
  part['value']='TPS22950YBHR';part['footprint']='TPSLimitTrial:'+libname
  for pin in part['pins']:pin['number']=pinmap[pin['number']]
  part['note']='Trial replacement; current limit and sequence qualification pending'
 if part['ref']=='R44':part['value']='19.2k 0.1%';part['note']='Candidate resistance only; MPN/TCR unselected'
spec['status']='TPS22950_PLACEMENT_UNROUTED_NOT_ADOPTED';(O/'design.json').write_text(json.dumps(spec,indent=2)+'\n')
subprocess.run(['python3',str(D.parent/'generate_schematic.py'),'xe-minimal',str(O)],check=True)
b=k.LoadBoard(str(D/(name+'.kicad_pcb')));old=next(f for f in b.GetFootprints()if f.GetReference()=='U13');nets={pinmap[p.GetNumber()]:p.GetNet()for p in old.Pads()};f=k.FootprintLoad(str(O/'TPSLimitTrial.pretty'),libname);f.SetReference('U13');f.SetValue('TPS22950YBHR');f.SetFPID(k.LIB_ID('TPSLimitTrial',libname));f.SetPath(old.GetPath());f.SetPosition(old.GetPosition());f.SetOrientationDegrees(180)
nc=k.NETINFO_ITEM(b,'unconnected-(U13-FLAG_N-PadA2)');b.Add(nc)
for p in f.Pads():p.SetNet(nc if p.GetNumber()=='A2' else nets[p.GetNumber()])
b.RemoveNative(old);b.AddNative(f);f.thisown=False
next(q for q in b.GetFootprints()if q.GetReference()=='R44').SetValue('19.2k 0.1%')
# TI's preferred SMD land has 0.1mm copper gap. Scope only these pad pairs.
with (O/(name+'.kicad_dru')).open('a')as h:h.write('\n(rule "U13 TPS pad pair candidate" (condition "A.Type == \'Pad\' && B.Type == \'Pad\' && A.memberOfFootprint(\'U13\') && B.memberOfFootprint(\'U13\')") (constraint clearance (min 0.1mm)))\n')
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(O/(name+'.kicad_pcb')),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';subprocess.run([cli,'pcb','drc',str(O/(name+'.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
x=json.loads((O/'drc.json').read_text());print({t:len(x[t])for t in ['violations','unconnected_items','schematic_parity']})
