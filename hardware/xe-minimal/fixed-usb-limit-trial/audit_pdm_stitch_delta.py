from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);D=Path(__file__).resolve().parent;paths=[D/x/'pendant-xe-minimal.kicad_pcb'for x in ['led-land-trial','pdm-stitch-trial']];a,b=[k.LoadBoard(str(p))for p in paths]
def xy(p):return [p.x,p.y]
def track(t):
 via=isinstance(t,k.PCB_VIA)
 return {'net':t.GetNetname(),'start':xy(t.GetStart()),'end':xy(t.GetEnd()),'layer':t.GetLayer(),'width':t.GetWidth(t.TopLayer())if via else t.GetWidth(),'drill':t.GetDrillValue()if via else None,'layers':[t.TopLayer(),t.BottomLayer()]if via else None}
def fp(f):return {'ref':f.GetReference(),'position':xy(f.GetPosition()),'rotation':f.GetOrientationDegrees(),'layer':f.GetLayer(),'pads':sorted((p.GetNumber(),p.GetNetname(),xy(p.GetPosition()),xy(p.GetSize()),p.GetShape(),p.GetOrientationDegrees())for p in f.Pads())}
aT={t.m_Uuid.AsString():track(t)for t in a.GetTracks()};bT={t.m_Uuid.AsString():track(t)for t in b.GetTracks()}
assert aT.keys()<=bT.keys();assert all(bT[u]==v for u,v in aT.items())
assert {f.GetReference():fp(f)for f in a.GetFootprints()}=={f.GetReference():fp(f)for f in b.GetFootprints()}
added={u:v for u,v in bT.items()if u not in aT};assert len(added)==1;assert next(iter(added.values()))['net']=='/GND'
r={'status':'RETAINED_ROUTE_AND_PAD_GEOMETRY_UNCHANGED','source_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest()for p in paths},'unchanged_tracks_and_vias':len(aT),'unchanged_footprints':len(list(a.GetFootprints())),'added':added,'limits':['Zone refill geometry is not covered by this delta check','No SI or manufacturing qualification']};(D/'pdm-stitch-trial/delta-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r['status'],r['unchanged_tracks_and_vias'],r['unchanged_footprints'])
