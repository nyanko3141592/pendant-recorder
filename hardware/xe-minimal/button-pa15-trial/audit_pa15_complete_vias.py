import pcbnew as k,wx,json,math
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent
old=k.LoadBoard(str(O.parent/'pendant-xe-minimal.kicad_pcb'));b=k.LoadBoard(str(O/'pa15-button-complete-candidate.kicad_pcb'));ids={t.m_Uuid.AsString() for t in old.GetTracks()};out=[]
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) or t.m_Uuid.AsString() in ids:continue
 pos=t.GetPosition();radius=t.GetWidth(k.F_Cu)/2;hits=[]
 for f in b.GetFootprints():
  for p in f.Pads():
   bb=p.GetBoundingBox();d=math.hypot(max(bb.GetX()-pos.x,0,pos.x-bb.GetRight()),max(bb.GetY()-pos.y,0,pos.y-bb.GetBottom()))
   if d<radius+k.FromMM(.025):hits.append({'ref':f.GetReference(),'pad':p.GetNumber(),'net':p.GetNetname(),'bbox_copper_gap_mm':k.ToMM(round(d-radius))})
 out.append({'uuid':t.m_Uuid.AsString(),'xy_mm':[k.ToMM(pos.x),k.ToMM(pos.y)],'near_pad_bbox':hits})
(O/'pa15-complete-via-audit.json').write_text(json.dumps({'method':'Conservative axis-aligned pad bounding box vs via copper radius plus0.025mm; not solder-mask/manufacturing qualification','vias':out},indent=2)+'\n');print(json.dumps(out,indent=2))
