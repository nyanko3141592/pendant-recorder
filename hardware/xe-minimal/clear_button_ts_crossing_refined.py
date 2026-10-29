"""Screen local dogleg on guard gate to free NRST escape; full DRC mandatory."""
import pcbnew as k,wx
app=wx.App(False)
import json,math,shutil,subprocess
from pathlib import Path
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'button-ts-clearance-candidate'
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
t=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='460a10b4-3910-4850-a69d-06009218597e')
s,e=t.GetStart(),t.GetEnd();net=t.GetNet();layer=t.GetLayer();width=t.GetWidth();b.RemoveNative(t)
S=(k.ToMM(s.x),k.ToMM(s.y));E=(k.ToMM(e.x),k.ToMM(e.y));L=math.dist(S,E);u=((E[0]-S[0])/L,(E[1]-S[1])/L);n=(-u[1],u[0]);v=(18.7,3.6);d=(v[0]-S[0])*u[0]+(v[1]-S[1])*u[1];c=(S[0]+d*u[0],S[1]+d*u[1]);out=[]
for span,off in [(22.4,5.6),(22.45,5.6),(22.5,5.6),(22.45,5.3),(22.5,5.3)]:
 pts=[S,(span,off),E];items=[]
 for a,z in zip(pts,pts[1:]):
  q=k.PCB_TRACK(b);q.SetStart(k.VECTOR2I(round(a[0]*1e6),round(a[1]*1e6)));q.SetEnd(k.VECTOR2I(round(z[0]*1e6),round(z[1]*1e6)));q.SetLayer(layer);q.SetWidth(width);q.SetNet(net);b.AddNative(q);q.thisown=False;items.append(q)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'button-ts-clearance-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'button-ts-clearance-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==27
 out.append({'span':span,'offset':off,'accepted':ok,'violations':r['violations'],'old_length_mm':L,'new_length_mm':sum(math.dist(a,z) for a,z in zip(pts,pts[1:])),'width_mm':k.ToMM(width)});print(span,off,ok,len(r['violations']),flush=True)
 if ok:break
 for q in items:b.RemoveNative(q)
(O/'button-ts-clearance-review.json').write_text(json.dumps(out,indent=2)+'\n')
