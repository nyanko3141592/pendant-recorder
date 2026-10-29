"""Find explicit copper/plane alternatives to the removed F.Cu ground segment."""
from pathlib import Path
import wx,pcbnew as k,json,hashlib,collections,math
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'usb-ground-plane-candidate.kicad_pcb';b=k.LoadBoard(str(src));b.BuildConnectivity();conn=b.GetConnectivity();objs={o.m_Uuid.AsString():o for o in list(b.GetTracks())+[p for f in b.GetFootprints() for p in f.Pads()]};seeds=['1bb54a7c-8e3b-4fb8-b92b-3bb151314c84','e7b094cc-8131-461f-9806-62f65b83f362'];zones=[z for z in b.Zones() if z.GetNetname()=='/GND' and z.GetLayer() in [k.F_Cu,k.In1_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu]]
def describe(o):
 d={'uuid':o.m_Uuid.AsString(),'kind':type(o).__name__,'xy_mm':[k.ToMM(o.GetPosition().x),k.ToMM(o.GetPosition().y)]}
 if isinstance(o,k.PAD):d.update(ref=o.GetParentFootprint().GetReference(),pad=o.GetNumber())
 return d
branches=[]
for seed in seeds:
 queue=collections.deque([seed]);prev={seed:None};vias=[];pads=[]
 while queue:
  uid=queue.popleft();o=objs[uid]
  if isinstance(o,k.PCB_VIA):vias.append(uid)
  if isinstance(o,k.PAD):pads.append(describe(o))
  for nxt in list(conn.GetConnectedTracks(o))+list(conn.GetConnectedPads(o)):
   v=nxt.m_Uuid.AsString()
   if v in prev or nxt.GetNetname()!='/GND':continue
   prev[v]=uid;queue.append(v)
 exits=[]
 for uid in vias:
  v=objs[uid];hits=[]
  for zone in zones:
   layer=zone.GetLayer();polys=zone.GetFilledPolysList(layer);radius=(k.ToMM(v.GetDrillValue())/2+k.ToMM(v.GetWidth(layer))/2)/2
   for idx in range(polys.OutlineCount()):
    count=0
    for i in range(16):
     q=k.VECTOR2I(v.GetPosition().x+k.FromMM(radius*math.cos(i*math.pi/8)),v.GetPosition().y+k.FromMM(radius*math.sin(i*math.pi/8)))
     count+=bool(polys.Contains(q,idx))
    if count:hits.append({'zone_uuid':zone.m_Uuid.AsString(),'layer':b.GetLayerName(layer),'polygon_index':idx,'annulus_hits':count})
  path=[uid]
  while prev[path[-1]] is not None:path.append(prev[path[-1]])
  exits.append({'contact':describe(v),'path':[describe(objs[x]) for x in reversed(path)],'plane_contacts':hits})
 # SMD ground pads can enter a surface pour directly without a via in this branch.
 for desc in pads:
  pad=objs[desc['uuid']];bb=pad.GetBoundingBox();hits=[]
  for zone in zones:
   layer=zone.GetLayer()
   if not pad.IsOnLayer(layer):continue
   polys=zone.GetFilledPolysList(layer)
   for poly in range(polys.OutlineCount()):
    count=0
    for ix in range(1,10):
     for iy in range(1,10):
      q=k.VECTOR2I(bb.GetX()+round(bb.GetWidth()*ix/10),bb.GetY()+round(bb.GetHeight()*iy/10))
      if pad.HitTest(q) and polys.Contains(q,poly):count+=1
    if count:hits.append({'zone_uuid':zone.m_Uuid.AsString(),'layer':b.GetLayerName(layer),'polygon_index':poly,'pad_area_hits':count})
  path=[desc['uuid']]
  while prev[path[-1]] is not None:path.append(prev[path[-1]])
  exits.append({'contact':desc,'contact_type':'pad','path':[describe(objs[x]) for x in reversed(path)],'plane_contacts':hits})
 branches.append({'seed':seed,'connected_items_without_explicit_zone_edges':len(prev),'pads':pads,'exits':exits,'other_seed_reached':seeds[1-seeds.index(seed)] in prev})
shared=[]
for a in branches[0]['exits']:
 for z in branches[1]['exits']:
  for x in a['plane_contacts']:
   for y in z['plane_contacts']:
    if (x['zone_uuid'],x['polygon_index'])==(y['zone_uuid'],y['polygon_index']):shared.append({'first_contact':a['contact']['uuid'],'second_contact':z['contact']['uuid'],'layer':x['layer'],'polygon_index':x['polygon_index']})
out={'status':'ALTERNATE_GROUND_CONNECTION_FOUND' if shared or branches[0]['other_seed_reached'] else 'NO_ALTERNATE_PATH_PROVEN','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'branches':branches,'shared_plane_paths':shared,'limitations':['KiCad connectivity plus sampled via-annulus and pad-area overlap; not resistance/current/EMI analysis','Connected plane polygon may have narrow necks; width/current review remains','No high-frequency return inductance claim']};(P/'removed-ground-path-review.json').write_text(json.dumps(out,indent=2)+'\n');print(out['status']);print([(x['connected_items_without_explicit_zone_edges'],len(x['exits']),x['other_seed_reached']) for x in branches]);print('shared',len(shared))
