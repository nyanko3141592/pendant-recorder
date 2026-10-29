"""Native KiCad bottom-copper clearance to hypothetical solder rectangles."""
from pathlib import Path
import wx,pcbnew,json,hashlib
app=wx.App(False)
O=Path(__file__).resolve().parent;root=O.parents[1]
p=root/'hardware/xe-minimal/fixed-usb-limit-trial/ncu-sensor-trial/pendant-xe-minimal.kicad_pcb';b=pcbnew.LoadBoard(str(p));layer=pcbnew.B_Cu
pads=[(f.GetReference()+'.'+q.GetNumber(),q,q.GetEffectiveShape(layer)) for f in b.GetFootprints() for q in f.Pads() if q.IsOnLayer(layer)]
tracks=[('track:'+str(i),t,t.GetEffectiveShape(layer)) for i,t in enumerate(b.GetTracks()) if t.IsOnLayer(layer)]
zones=[('zone:'+str(i),z,z.GetFilledPolysList(layer)) for i,z in enumerate(b.Zones()) if z.IsOnLayer(layer)]
rows=[]
f=next(f for f in b.GetFootprints() if f.GetReference()=='TH1')
for q in f.Pads():
 pos=q.GetPosition();rect=pcbnew.SHAPE_RECT(pos.x-pcbnew.FromMM(.3),pos.y-pcbnew.FromMM(.375),pcbnew.FromMM(.6),pcbnew.FromMM(.75));near=[]
 for name,item,shape in pads+tracks+zones:
  if item.GetNetCode()==q.GetNetCode():continue
  if not rect.Collide(shape,pcbnew.FromMM(1.)):continue
  lo=0;hi=pcbnew.FromMM(1.)
  while hi-lo>100:
   mid=(hi+lo)//2
   if rect.Collide(shape,mid):hi=mid
   else:lo=mid
  near.append({'item':name,'net':item.GetNetname(),'clearance_bracket_mm':[pcbnew.ToMM(lo),pcbnew.ToMM(hi)],'overlaps':rect.Collide(shape,0)})
 rows.append({'pad':q.GetNumber(),'net':q.GetNetname(),'nearest_other_net_copper':sorted(near,key=lambda x:x['clearance_bracket_mm'][0])[:8]})
r={'status':'NOMINAL_BOTTOM_COPPER_SCREEN_NOT_SOLDER_PROCESS_APPROVAL','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'solder_rectangle_mm':[.6,.75],'item_counts':{'pads':len(pads),'tracks_vias':len(tracks),'filled_zones':len(zones)},'rows':rows,'limits':['Uses stored zone fill without refilling or changing PCB.','Includes masked copper conservatively; does not establish exposed solder-mask clearance.','No solder spread, positioning tolerance, insulation damage or manufacturing variation.']}
(O/'film-solder-copper-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
