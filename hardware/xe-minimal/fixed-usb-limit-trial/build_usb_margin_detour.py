"""Local USB fanout detours away from neighboring via antipads; review only."""
from pathlib import Path
import pcbnew as k,wx,shutil,json,hashlib,subprocess,math
app=wx.App(False);O=Path(__file__).resolve().parent;S=O/'usb-inner-neighbor-trial';D=O/'usb-margin-detour-trial';D.mkdir(exist_ok=True)
for p in S.iterdir():
 if p.is_dir()and p.suffix=='.pretty':shutil.copytree(p,D/p.name,dirs_exist_ok=True)
 elif p.is_file()and(p.suffix in ['.kicad_sch','.kicad_pro','.kicad_dru']or p.name=='fp-lib-table'):shutil.copy2(p,D/p.name)
f=S/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(f));changes=[]
for uid,vid,lo,hi,offset in [('338c66e3-7933-4afd-b2f4-01325a85229b','02c2326c-3b01-4e6c-b9de-fc24784970d4',.35,.65,.1),('1fd3a811-f21b-4177-b010-f981762dcccb','2a7ff8bf-961b-4c3b-a1fc-dad001d91a29',.70,.96,.055)]:
 t=next(t for t in b.GetTracks()if t.m_Uuid.AsString()==uid);v=next(t for t in b.GetTracks()if t.m_Uuid.AsString()==vid);a,z,q=t.GetStart(),t.GetEnd(),v.GetPosition();dx,dy=z.x-a.x,z.y-a.y;length=math.hypot(dx,dy);nx,ny=-dy/length,dx/length
 if (q.x-a.x)*nx+(q.y-a.y)*ny>0:nx,ny=-nx,-ny
 profile=[(lo,offset),(hi,offset)]
 if uid.startswith('338c'):profile += [(.78,0)]
 pts=[a]+[k.VECTOR2I(round(a.x+u*dx+k.FromMM(off)*nx),round(a.y+u*dy+k.FromMM(off)*ny))for u,off in profile]+[z];net=t.GetNetCode();width=t.GetWidth();layer=t.GetLayer();b.RemoveNative(t);newids=[]
 for x,y in zip(pts,pts[1:]):
  n=k.PCB_TRACK(b);n.SetNetCode(net);n.SetWidth(width);n.SetLayer(layer);n.SetStart(x);n.SetEnd(y);b.AddNative(n);n.thisown=False;newids.append(n.m_Uuid.AsString())
 changes.append({'removed_uuid':uid,'neighbor_via':vid,'added_uuids':newids,'points_mm':[[k.ToMM(p.x),k.ToMM(p.y)]for p in pts]})
k.ZONE_FILLER(b).Fill(b.Zones());out=D/f.name;k.SaveBoard(str(out),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((D/'drc.json').read_text());r={'status':'TRIAL_NOT_ADOPTED','changes':changes,'source_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'checks':{x:len(d[x])for x in ['violations','unconnected_items','schematic_parity']},'limits':['Fanout geometry changed; impedance and signal integrity unqualified','Offsets are geometric trials, not a fabrication tolerance specification']};(D/'review.json').write_text(json.dumps(r,indent=2));print(json.dumps(r,indent=2))
