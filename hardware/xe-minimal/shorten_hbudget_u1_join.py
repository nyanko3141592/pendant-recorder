import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'hbudget-current-u1-joined-candidate';dst=O/'hbudget-current-shortened-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile((O/'pendant-xe-minimal').with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));base=k.LoadBoard(str(O/'hbudget-current-r46-joined-candidate.kicad_pcb'));ids={t.m_Uuid.AsString() for t in base.GetTracks()}
def xy(p):return [k.ToMM(p.x),k.ToMM(p.y)]
removed=[]
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in ids or isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.In1_Cu:continue
 if max(t.GetStart().y,t.GetEnd().y)<k.FromMM(17):continue
 assert t.GetNetname()=='/USB_HIGH_BUDGET';removed.append([xy(t.GetStart()),xy(t.GetEnd())]);b.RemoveNative(t)
assert len(removed)==6,len(removed)
net=next(t.GetNet() for t in b.GetTracks() if t.GetNetname()=='/USB_HIGH_BUDGET');points=[(7.8,17.4),(7,18.2),(6.5,18.2)]
for a,c in zip(points,points[1:]):
 t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(round(a[0]*1e6),round(a[1]*1e6)));t.SetEnd(k.VECTOR2I(round(c[0]*1e6),round(c[1]*1e6)));t.SetWidth(k.FromMM(.1));t.SetLayer(k.In1_Cu);t.SetNet(net);b.AddNative(t);t.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'hbudget-current-shortened-drc.json')],check=True,stdout=subprocess.DEVNULL)
r=json.loads((O/'hbudget-current-shortened-drc.json').read_text());out={'accepted':not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==7,'violations':r['violations'],'parity':r['schematic_parity'],'unconnected_items':len(r['unconnected_items']),'removed_paths':removed,'replacement_points':points};(O/'hbudget-current-shortened-review.json').write_text(json.dumps(out,indent=2)+'\n');print(out)
