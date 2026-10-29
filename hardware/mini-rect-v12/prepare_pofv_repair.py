from pathlib import Path
import wx,json,shutil
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='pofv-local-repair';b=k.LoadBoard(str(P/'pofv-pad-only.kicad_pcb'))
d=json.loads((P/'pofv-pad-only-drc.json').read_text());ids={i['uuid'] for v in d['violations'] for i in v['items'] if '配線' in i['description']}
# Remove the colliding segments plus nearby same-net tiny fragments; never pads.
tracks=list(b.GetTracks());anchors=[(t.GetNetCode(),t.GetLayer(),k.VECTOR2I(t.GetStart())) for t in tracks if t.m_Uuid.AsString() in ids]
for t in tracks:
 if isinstance(t,k.PCB_VIA):continue
 if t.m_Uuid.AsString() in ids or any(t.GetNetCode()==a[0] and t.GetLayer()==a[1] and t.GetLength()<k.FromMM(.12) and (t.GetStart()-a[2]).EuclideanNorm()<k.FromMM(.25) for a in anchors):b.DeleteNative(t)
v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='7767d305-7d75-4c7a-8736-271b063e3579');old=v.GetPosition();new=old+k.VECTOR2I(0,k.FromMM(-.06))
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetNetCode()!=v.GetNetCode():continue
 if t.GetStart()==old:t.SetStart(new)
 if t.GetEnd()==old:t.SetEnd(new)
v.SetPosition(new)
for ext in ['kicad_pro','kicad_sch']:shutil.copy2(P/('pofv-pad-only.'+ext),P/(name+'.'+ext))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
