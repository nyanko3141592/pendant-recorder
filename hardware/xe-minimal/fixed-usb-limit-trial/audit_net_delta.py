from pathlib import Path
import pcbnew as k,json,hashlib,wx
app=wx.App(False)
D=Path(__file__).resolve().parent
files=[D.parent/'pendant-xe-minimal.kicad_pcb',D/'pendant-xe-minimal.kicad_pcb']
boards=[k.LoadBoard(str(p))for p in files]
def pads(b):return {(f.GetReference(),p.GetNumber()):p.GetNetname()for f in b.GetFootprints()for p in f.Pads()}
a,b=map(pads,boards)
removed=set(a)-set(b);changed=[{'ref':key[0],'pad':key[1],'before':a[key],'after':b[key]}for key in a.keys()&b.keys() if a[key]!=b[key]]
assert {key[0]for key in removed}=={'Q5','R45','R46'}
assert not (set(b)-set(a))
assert changed==[{'ref':'U1','pad':'42','before':'/USB_HIGH_BUDGET','after':'unconnected-(U1-PB6-Pad42)'}],changed
# SETI must now have exactly two connected pads: U13 and R44.
net=next(v for (ref,pin),v in b.items()if ref=='R44' and v!='/GND')
seti=[list(key)for key,val in b.items()if val==net]
assert sorted(ref for ref,pin in seti)==['R44','U13'],seti
assert not any(v in ('/USB_HIGH_BUDGET','/USB_HIGH_BUDGET_DRAIN')for v in b.values())
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
erc=json.loads((D/'erc.json').read_text());count=sum(len(s['violations'])for s in erc['sheets'])
assert count==0
out={'status':'PASS_EXPECTED_NET_AND_TRACK_DELTA_ONLY','source_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest()for p in files},'removed_pad_count':len(removed),'changed_retained_pads':changed,'SETI_pad_members':seti,'retained_track_or_via_attribute_changes':delta,'removed_track_or_via_count':len(x)-len(y),'erc_violations':count,'scope':'Net assignment and retained track geometry comparison, not transient simulation, pin-function qualification or mechanical validation.'}
(D/'net-delta-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
