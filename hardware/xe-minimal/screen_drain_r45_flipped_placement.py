import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;dst=O/'drain-r45-flipped-placement-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile((O/'pendant-xe-minimal').with_suffix(ext),dst.with_suffix(ext))
rows=[]
for dx,dy in [(.05,0),(.1,0),(.15,0),(0,-.05),(0,.05),(-.05,0),(.1,.1),(.1,-.1)]:
 b=k.LoadBoard(str(O/'pendant-xe-minimal.kicad_pcb'));f=next(f for f in b.GetFootprints() if f.GetReference()=='R45');p1=next(p for p in f.Pads() if p.GetNumber()=='1');old=p1.GetPosition();f.Rotate(old,k.EDA_ANGLE(180,k.DEGREES_T));f.Move(k.VECTOR2I(round(dx*1e6),round(dy*1e6)));p2=next(p for p in f.Pads() if p.GetNumber()=='2')
 t=k.PCB_TRACK(b);t.SetStart(old);t.SetEnd(p1.GetPosition());t.SetWidth(k.FromMM(.1));t.SetLayer(k.F_Cu);t.SetNet(p1.GetNet());b.AddNative(t);t.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drain-r45-flipped-placement-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'drain-r45-flipped-placement-drc.json').read_text());ok=not [x for x in r['violations'] if x['type']!='via_dangling'] and not r['schematic_parity'] and len(r['unconnected_items'])==1;rows.append({'dx':dx,'dy':dy,'accepted':ok,'violations':r['violations'],'unconnected':len(r['unconnected_items'])});print(dx,dy,ok,flush=True)
 if ok:break
(O/'drain-r45-flipped-placement-review.json').write_text(json.dumps(rows,indent=2)+'\n')
