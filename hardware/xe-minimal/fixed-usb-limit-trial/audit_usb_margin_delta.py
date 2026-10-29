"""Check intended route-only delta and conservative added-trace resistance scenario."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib,math
app=wx.App(False);O=Path(__file__).resolve().parent;paths=[O/x/'pendant-xe-minimal.kicad_pcb'for x in ['usb-inner-neighbor-trial','usb-margin-detour-trial']];bs=[k.LoadBoard(str(p))for p in paths]
def xy(p):return [p.x,p.y]
def desc(t):
 via=isinstance(t,k.PCB_VIA)
 return [t.GetNetname(),t.GetLayer(),xy(t.GetStart()),xy(t.GetEnd()),t.GetWidth(t.TopLayer())if via else t.GetWidth(),via,t.GetDrillValue()if via else None,t.GetFillingMode()if via else None,t.GetCappingMode()if via else None]
def fp(f):return [xy(f.GetPosition()),f.GetOrientationDegrees(),f.GetLayer(),str(f.GetValue()),str(f.GetFPID().GetLibNickname()),str(f.GetFPID().GetLibItemName()),sorted((str(p.GetNumber()),str(p.GetNetname()),xy(p.GetPosition()),xy(p.GetSize()),p.GetShape(),p.GetLayerSet().FmtBin())for p in f.Pads())]
fs=[{f.GetReference():fp(f)for f in b.GetFootprints()}for b in bs];assert fs[0]==fs[1]
ts=[{t.m_Uuid.AsString():desc(t)for t in b.GetTracks()}for b in bs]
common=ts[0].keys()&ts[1].keys();assert all(ts[0][u]==ts[1][u]for u in common)
removed={u:ts[0][u]for u in ts[0].keys()-ts[1].keys()};added={u:ts[1][u]for u in ts[1].keys()-ts[0].keys()}
assert len(removed)==2 and len(added)==7
assert all(not t[5] and t[0]in ['/USB_DP','/USB_DM'] and t[1]==k.In2_Cu and t[4]==k.FromMM(.1171)for t in list(removed.values())+list(added.values()))
assert len(bs[0].Zones())==len(bs[1].Zones())==3
lengths={}
for net in ['/USB_DP','/USB_DM']:
 old=sum(math.dist(t[2],t[3])/1e6 for t in removed.values()if t[0]==net)
 new=sum(math.dist(t[2],t[3])/1e6 for t in added.values()if t[0]==net)
 lengths[net]={'replaced_segment_length_mm':old,'new_path_length_mm':new,'increase_mm':new-old}
r={'status':'LOCAL_USB_DETOUR_DELTA_CHECK_NOT_RELEASE','source_sha256':{p.parent.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in paths},'unchanged_footprints':len(fs[0]),'unchanged_common_track_vias':len(common),'all_vias_unchanged':True,'removed':removed,'added':added,'lengths':lengths,'limits':['Filled zones change as a result of rerouting','Lengths only describe replacement paths, not end-to-end pair skew or impedance','No physical USB qualification']}
(paths[1].parent/'route-delta-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:r[k]for k in ['unchanged_footprints','unchanged_common_track_vias','lengths']},indent=2))
