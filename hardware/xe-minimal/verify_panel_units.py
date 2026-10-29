"""Compare translated panel units against canonical electrical geometry."""
from pathlib import Path
from collections import Counter
import json,hashlib
import pcbnew as k,wx
app=wx.App(False);p=Path(__file__).resolve().parent;src=p/'pendant-xe-minimal.kicad_pcb';target=p/'electrical-panel-candidate-v3/panel.kicad_pcb';a=k.LoadBoard(str(src));b=k.LoadBoard(str(target));layout=json.loads((p/'supported-panel-topology-study.json').read_text());original={f.GetReference():f for f in a.GetFootprints()}
def point(v,dx,dy):return(v.x-dx,v.y-dy)
def pads(f,dx,dy,prefix):
 return Counter((v.GetNumber(),v.GetNetname().removeprefix(prefix),point(v.GetPosition(),dx,dy),v.GetSize().x,v.GetSize().y,v.GetDrillSize().x,v.GetDrillSize().y,v.GetShape(),v.GetAttribute(),round(v.GetOrientationDegrees(),6),v.GetLayerSet().FmtHex()) for v in f.Pads())
def track(t,dx,dy,prefix):
 common=(t.GetNetname().removeprefix(prefix),point(t.GetStart(),dx,dy),point(t.GetEnd(),dx,dy),(t.GetWidth(k.F_Cu) if isinstance(t,k.PCB_VIA) else t.GetWidth()),t.GetLayer())
 if isinstance(t,k.PCB_VIA):return('via',)+common+(t.GetDrillValue(),t.TopLayer(),t.BottomLayer())
 assert not isinstance(t,k.PCB_ARC),'Arc signature not implemented'
 return('track',)+common
source_tracks=Counter(track(t,0,0,'') for t in a.GetTracks());checks=[]
for u in layout['units']:
 n=u['unit'];dx,dy=[round(v*1e6) for v in u['bounds_mm'][:2]];prefix=f'P{n}';fps={f.GetReference().removeprefix(prefix+'_'):f for f in b.GetFootprints() if f.GetReference().startswith(prefix+'_')};assert set(fps)==set(original)
 for ref,f in fps.items():
  v=original[ref];assert f.GetValue()==v.GetValue() and f.GetLayer()==v.GetLayer() and f.GetOrientationDegrees()==v.GetOrientationDegrees()
  assert point(f.GetPosition(),dx,dy)==point(v.GetPosition(),0,0)
  assert pads(f,dx,dy,prefix)==pads(v,0,0,''),ref
 tt=[t for t in b.GetTracks() if t.GetNetname().startswith(prefix+'/') or t.GetNetname().startswith(prefix+'unconnected-')]
 assert Counter(track(t,dx,dy,prefix) for t in tt)==source_tracks,n
 checks.append({'unit':n,'footprints_matched':len(fps),'tracks_vias_matched':len(tt)})
r={'status':'UNIT_PLACEMENT_PAD_AND_TRACK_SIGNATURES_MATCH','source_pcb_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'panel_sha256':hashlib.sha256(target.read_bytes()).hexdigest(),'units':checks,'limitations':['Zone outlines/fills, 3D models and footprint graphics are not compared here.','No refill, DRC or production approval implied.']};target.with_name('unit-equivalence-review.json').write_text(json.dumps(r,indent=2)+'\n');print(checks)
