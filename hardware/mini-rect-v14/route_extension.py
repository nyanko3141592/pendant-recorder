"""Route domestic-pack extension trial; preserve seed and prior V13."""
import wx,pcbnew as k,json,shutil,hashlib
from pathlib import Path
app=wx.App(False);P=Path(__file__).resolve().parent
src=P/'domestic-pack-placement-seed.kicad_pcb';out=P/'domestic-pack-routed-candidate.kicad_pcb';b=k.LoadBoard(str(src))
def v(p):return k.VECTOR2I(k.FromMM(p[0]),k.FromMM(p[1]))
def route(net,layer,width,pts):
 for a,c in zip(pts,pts[1:]):
  t=k.PCB_TRACK(b);t.SetStart(v(a));t.SetEnd(v(c));t.SetWidth(k.FromMM(width));t.SetLayer(layer);t.SetNet(b.FindNet('/'+net));b.Add(t)
def via(net,p):
 t=k.PCB_VIA(b);t.SetPosition(v(p));t.SetWidth(k.FromMM(.45));t.SetDrill(k.FromMM(.2));t.SetViaType(k.VIATYPE_THROUGH);t.SetLayerPair(k.F_Cu,k.B_Cu);t.SetNet(b.FindNet('/'+net));b.Add(t)
# Remove obsolete connector branches as chains, retaining shared net backbone.
ids=['c6cbc190-5f77-4ec4-b8d6-c471ef3850d3']+['eadb79de-0ef2-40b1-b383-657097915149']+['425d0d46-edba-428c-9734-3452a5fa1fd2']+['703c3257-bb02-4199-9b28-dea4aac8c603','71a19e89-95c4-409c-978f-74820b5601a6','8e6a4d73-7ed9-46bf-81dd-a6ff92a01bd0']
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in ids:b.DeleteNative(t)
via('BAT',(22,7.3652))
route('BAT',k.In4_Cu,.3,[(18.9402,7.3652),(22,7.3652)])
route('BAT',k.B_Cu,.3,[(22,7.3652),(22,31.25),(22.15,31.4),(22.15,32)])
via('BAT',(22.15,32))
route('BAT_TS',k.In2_Cu,.127,[(4.8051,19.515),(4.8051,23),(9.675,27.8699),(9.675,30.3)])
via('BAT_TS',(9.675,30.3));route('BAT_TS',k.F_Cu,.127,[(9.675,30.3),(9.675,31)])
# Separate connected GND extension, leaving the existing USB reference areas unchanged.
for layer in [k.F_Cu,k.In1_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu]:
 z=k.ZONE(b);z.SetLayer(layer);z.SetNet(b.FindNet('/GND'));z.SetLocalClearance(k.FromMM(.15));z.SetPadConnection(k.ZONE_CONNECTION_FULL);z.SetThermalReliefGap(k.FromMM(.2));z.SetThermalReliefSpokeWidth(k.FromMM(.25));z.SetMinThickness(k.FromMM(.1));z.SetAssignedPriority(1)
 o=z.Outline();o.NewOutline()
 for p in [(.3,22),(20.8,22),(20.8,.3),(29.7,.3),(29.7,39.7),(.3,39.7)]:o.Append(int(k.FromMM(p[0])),int(k.FromMM(p[1])))
 b.Add(z)
for p in [(11.325,30.3),(23,29.3),(28,24),(28,37),(3,37),(3,24)]:via('GND',p)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
print(out)
