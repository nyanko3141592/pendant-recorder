from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'l3-ground-011-trial.kicad_pcb';b=k.LoadBoard(str(p));zones={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()};rows=[]
for v in b.GetTracks():
 if not isinstance(v,k.PCB_VIA) or v.GetNetname()=='/GND':continue
 for layer,poly in zones.items():
  low=0;high=k.FromMM(2)
  if not poly.Collide(v.GetPosition(),high):continue
  while high-low>100:
   mid=(low+high)//2
   if poly.Collide(v.GetPosition(),mid):high=mid
   else:low=mid
  rows.append({'net':str(v.GetNetname()),'layer':b.GetLayerName(layer),'via_xy_mm':[k.ToMM(v.GetPosition().x),k.ToMM(v.GetPosition().y)],'hole_edge_to_ground_mm_lower_bound':k.ToMM(low-v.GetDrillValue()/2)})
r={'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'minimum_mm_lower_bound':min(x['hole_edge_to_ground_mm_lower_bound'] for x in rows),'rows_below_0p2': [x for x in rows if x['hole_edge_to_ground_mm_lower_bound']<.1999],'checked_via_layer_pairs':len(rows),'method':'Binary search circle collision with actual filled GND polygon, 0.0001mm bound','release_allowed':False};(w/'inner-hole-ground-clearance-011.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
