from pathlib import Path
import pcbnew as k,wx,json,hashlib,math
app=wx.App(False);O=Path(__file__).resolve().parent;paths=[O/x/'pendant-xe-minimal.kicad_pcb' for x in ['r44-capped-trial','usb-pair-far-extension-trial']];boards=[k.LoadBoard(str(p)) for p in paths]
def sig(t):
 v=isinstance(t,k.PCB_VIA)
 return {'net':t.GetNetname(),'start':[t.GetStart().x,t.GetStart().y],'end':[t.GetEnd().x,t.GetEnd().y],'layer':t.GetLayer(),'width':t.GetWidth(t.TopLayer()) if v else t.GetWidth(),'drill':t.GetDrillValue()if v else None,'fill':t.GetFillingMode()if v else None,'cap':t.GetCappingMode()if v else None}
maps=[{t.m_Uuid.AsString():sig(t)for t in b.GetTracks()}for b in boards];assert maps[0].keys()==maps[1].keys();changed={u:{'before':maps[0][u],'after':maps[1][u]}for u in maps[0]if maps[0][u]!=maps[1][u]};assert len(changed)==4
for pair in changed.values():
 for field in ['net','layer','width','drill','fill','cap']:assert pair['before'][field]==pair['after'][field]
 assert pair['after']['net']in ['/USB_DP','/USB_DM'] and pair['after']['layer']==k.In2_Cu
def xy(v):return [v.x,v.y]
def fp(f):return {'ref':f.GetReference(),'position':xy(f.GetPosition()),'rotation':f.GetOrientationDegrees(),'layer':f.GetLayer(),'pads':sorted((p.GetNumber(),p.GetNetname(),xy(p.GetPosition()),xy(p.GetSize()),p.GetShape(),p.GetOrientationDegrees())for p in f.Pads())}
assert {f.m_Uuid.AsString():fp(f)for f in boards[0].GetFootprints()}=={f.m_Uuid.AsString():fp(f)for f in boards[1].GetFootprints()}

rows=[]
for board,path in zip(boards,paths):
 polys={layer:[z.GetFilledPolysList(layer) for z in board.Zones()if z.GetNetname()=='/GND'and z.IsOnLayer(layer)]for layer in [k.In1_Cu,k.In3_Cu]}
 for t in board.GetTracks():
  if t.m_Uuid.AsString()not in changed:continue
  a,z=t.GetStart(),t.GetEnd();dx,dy=z.x-a.x,z.y-a.y;length=math.hypot(dx,dy);n=max(1,math.ceil(k.ToMM(length)/.025));missing=[];tested=0
  for j in range(n+1):
   for off in [0,-.16,.16]:
    p=k.VECTOR2I(round(a.x+dx*j/n-dy/length*k.FromMM(off)),round(a.y+dy*j/n+dx/length*k.FromMM(off)))
    for layer,pp in polys.items():
     tested+=1
     if not any(poly.Contains(p)for poly in pp):missing.append({'fraction':j/n,'offset_mm':off,'reference':board.GetLayerName(layer),'xy_mm':[k.ToMM(p.x),k.ToMM(p.y)]})
  rows.append({'board':path.parent.name,'uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'samples':tested,'missing':missing})
r={'status':'ROUTE_DELTA_AND_SAMPLED_REFERENCE_SCREEN_NOT_SI_APPROVAL','source_sha256':{p.parent.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in paths},'changed_tracks':changed,'unchanged_footprints':len(list(boards[0].GetFootprints())),'reference_samples':rows,'limits':['0.025mm sampling with offsets0/±0.16mm is not continuous copper coverage proof or field solution','Filled ground presence does not prove electrical connectivity of every island','Via transitions and all unchanged fanout geometry remain unqualified']};(paths[1].parent/'delta-plane-review.json').write_text(json.dumps(r,indent=2)+'\n');print([(x['board'],x['net'],x['uuid'],len(x['missing']))for x in rows])
