from pathlib import Path
import pcbnew as k,wx,json,math,hashlib
app=wx.App(False);O=Path(__file__).resolve().parent;names=['usb-pair-far-extension-trial','usb-reference-via-small-trial'];paths=[O/n/'pendant-xe-minimal.kicad_pcb'for n in names];boards=[k.LoadBoard(str(p))for p in paths]
def xy(p):return [p.x,p.y]
def sig(t):
 via=isinstance(t,k.PCB_VIA)
 return {'net':t.GetNetname(),'layer':t.GetLayer(),'a':xy(t.GetStart()),'b':xy(t.GetEnd()),'width':t.GetWidth(t.TopLayer())if via else t.GetWidth(),'via':via,'drill':t.GetDrillValue()if via else None,'fill':t.GetFillingMode()if via else None,'cap':t.GetCappingMode()if via else None}
maps=[{t.m_Uuid.AsString():sig(t)for t in b.GetTracks()}for b in boards];assert maps[0].keys()==maps[1].keys();changed={u:{'before':maps[0][u],'after':maps[1][u]}for u in maps[0]if maps[0][u]!=maps[1][u]}
assert all(x['after']['net']in ['/SD_EN','/PDM_DATA'] for x in changed.values())
for x in changed.values():
 for key in ['net','layer','width','via','drill','fill','cap']:assert x['before'][key]==x['after'][key]
def fp(f):return [f.GetReference(),xy(f.GetPosition()),f.GetOrientationDegrees(),f.GetLayer(),sorted((p.GetNumber(),p.GetNetname(),xy(p.GetPosition()),xy(p.GetSize()),p.GetShape(),p.GetOrientationDegrees())for p in f.Pads())]
assert {f.m_Uuid.AsString():fp(f)for f in boards[0].GetFootprints()}=={f.m_Uuid.AsString():fp(f)for f in boards[1].GetFootprints()}
rows=[]
refs={k.F_Cu:[k.In1_Cu],k.In2_Cu:[k.In1_Cu,k.In3_Cu],k.In4_Cu:[k.In3_Cu],k.B_Cu:[k.In3_Cu]}
for name,board in zip(names,boards):
 for t in board.GetTracks():
  if t.m_Uuid.AsString()not in changed or isinstance(t,k.PCB_VIA):continue
  a,z=t.GetStart(),t.GetEnd();dx,dy=z.x-a.x,z.y-a.y;length=math.hypot(dx,dy);half=t.GetWidth()/2;poly=k.SHAPE_POLY_SET();poly.NewOutline()
  for p,side in [(a,1),(z,1),(z,-1),(a,-1)]:poly.Append(round(p.x-dy/length*half*side),round(p.y+dx/length*half*side))
  for layer in refs.get(t.GetLayer(),[]):
   ground=k.SHAPE_POLY_SET()
   for q in board.Zones():
    if q.GetNetname()=='/GND'and q.IsOnLayer(layer):ground.BooleanAdd(q.GetFilledPolysList(layer))
   diff=k.SHAPE_POLY_SET();diff.BooleanSubtract(poly,ground)
   rows.append({'board':name,'uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'signal_layer':board.GetLayerName(t.GetLayer()),'reference':board.GetLayerName(layer),'length_mm':k.ToMM(length),'uncovered_area_mm2':diff.Area()/1e12})
r={'status':'ROUTE_DELTA_AND_REFERENCE_AREA_COMPARISON_NOT_SI_APPROVAL','source_sha256':{p.parent.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in paths},'changed':changed,'reference_rows':rows,'limits':['Rectangle excludes endpoint semicircles','B.Cu uses In3.Cu ground as screening reference with intervening In4.Cu; not a field model','Own signal via antipads legitimately appear in uncovered area; aggregate area is not acceptance criterion','Footprint pose and pad geometry checked, not all serialized properties']};(paths[1].parent/'route-delta-reference-review.json').write_text(json.dumps(r,indent=2)+'\n');print('changed',len(changed));print(json.dumps(rows,indent=2))
