import pcbnew as k,wx,json,shutil,subprocess,itertools
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pa15-ilim-square-escape-candidate';dst=O/'pa15-r45-near-u13-candidate';out=[]
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
for target,offset,angle in itertools.product([(11.75,3.2)],[(.6,0),(-.6,0),(0,.6),(0,-.6)],[0,90,180,270]):
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='R45')
 f.Flip(f.GetPosition(),False);p=next(p for p in f.Pads() if p.GetNumber()=='1');f.SetOrientationDegrees(angle);pos=k.VECTOR2I(round((target[0]+offset[0])*1e6),round((target[1]+offset[1])*1e6));f.Move(pos-p.GetPosition())
 t=k.PCB_TRACK(b);t.SetStart(pos);t.SetEnd(k.VECTOR2I(round(target[0]*1e6),round(target[1]*1e6)));t.SetLayer(k.B_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-r45-near-u13-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'pa15-r45-near-u13-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==24;out.append({'target':target,'offset':offset,'angle':angle,'accepted':ok,'violations':r['violations'],'unconnected':len(r['unconnected_items'])});print(len(out),target,offset,angle,ok,len(r['violations']),flush=True)
 if ok:break
(O/'pa15-r45-near-u13-review.json').write_text(json.dumps(out,indent=2)+'\n')
