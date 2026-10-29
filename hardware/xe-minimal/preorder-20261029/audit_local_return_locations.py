from pathlib import Path
import pcbnew as k,wx,json,math,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'local-return-centered.kicad_pcb';b=k.LoadBoard(str(p));zones={z.GetLayer():z.GetFilledPolysList(z.GetLayer()) for z in b.Zones() if z.GetNetname()=='/GND' and not z.GetIsRuleArea()};critical=set(json.loads((w/'pdm-tp6-preparation.json').read_text())['critical_nets_outer_only'])|{'/USB_DP','/USB_DM'};gnd=[t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.GetNetname()=='/GND'];rows=[]
for v in b.GetTracks():
 if not isinstance(v,k.PCB_VIA) or v.GetNetname() not in critical:continue
 q=v.GetPosition();near=[]
 for g in gnd:
  r=g.GetPosition();connected={b.GetLayerName(l):zones[l].Contains(r) for l in [k.In1_Cu,k.In2_Cu]}
  if all(connected.values()):near.append({'xy_mm':[k.ToMM(r.x),k.ToMM(r.y)],'distance_mm':k.ToMM((q-r).EuclideanNorm()),'both_planes_copper_at_center':True})
 near.sort(key=lambda r:r['distance_mm']);rows.append({'signal':str(v.GetNetname()),'via_xy_mm':[k.ToMM(q.x),k.ToMM(q.y)],'nearest_ground_vias':near[:3]})
gaps=json.loads((w/'chg-neck-gap-classification.json').read_text())['samples'];unexplained=[]
for s in gaps:
 if s['category']!='not_explained_by_0p15_clearance':continue
 q=k.VECTOR2I(k.FromMM(s['xy_mm'][0]),k.FromMM(s['xy_mm'][1]));own=[v for v in b.GetTracks() if isinstance(v,k.PCB_VIA) and v.GetNetname()==s['signal']];v=min(own,key=lambda v:(q-v.GetPosition()).EuclideanNorm());s=dict(s);s['nearest_own_via_xy_mm']=[k.ToMM(v.GetPosition().x),k.ToMM(v.GetPosition().y)];s['distance_to_via_center_mm']=k.ToMM((q-v.GetPosition()).EuclideanNorm());s['distance_beyond_nominal_antipad_mm']=s['distance_to_via_center_mm']-k.ToMM(v.GetWidth(k.F_Cu))/2-.15;unexplained.append(s)
r={'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'signal_vias':rows,'unexplained_samples':unexplained,'limits':['Distances are Euclidean, not copper-path length or return inductance','Copper at the via center on both planes confirms local fill, not the length/width of the path from the signal','No arbitrary distance threshold declared a release pass'],'release_allowed':False};(w/'local-return-via-locations.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'via_count':len(rows),'nearest_ground_distances_mm':[(r['signal'],r['via_xy_mm'],round(r['nearest_ground_vias'][0]['distance_mm'],3)) for r in rows],'unexplained_samples':unexplained},indent=2))
