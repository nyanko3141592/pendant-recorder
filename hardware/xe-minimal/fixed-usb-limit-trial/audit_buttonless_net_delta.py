from pathlib import Path
import pcbnew as k,json,hashlib,wx
app=wx.App(False)
D=Path(__file__).resolve().parent
files=[D/'screw-hole-trial/hole-18.1.kicad_pcb',D/'buttonless-trial/pendant-xe-minimal.kicad_pcb']
boards=[k.LoadBoard(str(p))for p in files]
def pads(b):return {(f.GetReference(),p.GetNumber()):p.GetNetname()for f in b.GetFootprints()for p in f.Pads()}
a,b=map(pads,boards)
removed=set(a)-set(b);changed=[{'ref':key[0],'pad':key[1],'before':a[key],'after':b[key]}for key in a.keys()&b.keys() if a[key]!=b[key]]
assert {key[0]for key in removed}=={'SW1','R4'}
assert not (set(b)-set(a))
assert changed==[{'ref':'U1','pad':'38','before':'/BUTTON_N','after':'unconnected-(U1-PA15-Pad38)'}],changed
assert not any(v=='/BUTTON_N' for v in b.values())
# Compare geometry and attributes of every retained track/via.
def tracks(board):
 out={}
 for t in board.GetTracks():
  data=[t.GetNetname(),t.GetStart().x,t.GetStart().y,t.GetEnd().x,t.GetEnd().y,(t.GetWidth(t.TopLayer()) if isinstance(t,k.PCB_VIA) else t.GetWidth()),t.GetLayer()]
  if isinstance(t,k.PCB_VIA):data += [t.GetDrillValue(),t.TopLayer(),t.BottomLayer()]
  out[t.m_Uuid.AsString()]=data
 return out
x,y=map(tracks,boards);delta=[key for key in x.keys()&y.keys() if x[key]!=y[key]]
assert not delta and not (y.keys()-x.keys())
removed_ids=x.keys()-y.keys()
review=json.loads((D/'buttonless-trial/review.json').read_text())
assert set(review['removed_button_tracks'])==removed_ids
assert all(x[key][0] in ('/BUTTON_N','/GND','/V3V3') for key in removed_ids)
# Every surviving footprint retains its pose and pad geometry.
def geometry(board):
 out={}
 for f in board.GetFootprints():
  out[f.GetReference()]={'position':[f.GetPosition().x,f.GetPosition().y],'angle':f.GetOrientationDegrees(),'side':f.GetLayer(),'footprint':str(f.GetFPID().GetLibNickname())+":"+str(f.GetFPID().GetLibItemName()),'pads':sorted((p.GetNumber(),p.GetPosition().x,p.GetPosition().y,p.GetSize().x,p.GetSize().y,p.GetOrientationDegrees(),str(p.GetLayerSet().FmtHex())) for p in f.Pads())}
 return out
old,new=map(geometry,boards)
assert not(new.keys()-old.keys())
assert all(old[r]==new[r] for r in new), [r for r in new if old[r]!=new[r]]
from collections import Counter
out={'status':'PASS_EXPECTED_BUTTON_REMOVAL_DELTA_ONLY','source_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest()for p in files},'removed_refs':sorted(old.keys()-new.keys()),'changed_retained_pads':changed,'retained_footprint_geometry_count':len(new),'retained_track_or_via_attribute_changes':delta,'retained_track_or_via_count':len(y),'removed_track_or_via_count':len(removed_ids),'removed_routes_by_net':dict(Counter(x[key][0] for key in removed_ids)),'scope':'Pad nets, retained footprint/pad geometry and retained route attributes. Zone fills and electrical performance are outside this comparison; DRC is separate.'}
(D/'buttonless-trial/net-delta-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
