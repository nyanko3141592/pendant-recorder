from pathlib import Path
import pcbnew as k,wx,json,hashlib,shutil,collections
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'usb-3313-width-trial.kicad_pcb';b=k.LoadBoard(str(src));removed=collections.Counter()
for t in list(b.GetTracks()):
 if t.GetNetname() not in ['/USB_DP','/USB_DM','/GND']:
  removed[str(t.GetNetname())]+=1;b.RemoveNative(t)
# Replace local corridor rules with full inner-layer track exclusion.
for z in list(b.Zones()):
 if z.GetIsRuleArea():b.RemoveNative(z)
for layer in [k.In1_Cu,k.In2_Cu]:
 z=k.ZONE(b);z.SetLayer(layer);z.SetIsRuleArea(True);z.SetDoNotAllowTracks(True);z.SetDoNotAllowVias(False);z.SetDoNotAllowZoneFills(False);z.SetDoNotAllowPads(False);z.SetDoNotAllowFootprints(False)
 z.Outline().NewOutline()
 for x,y in [(-1,-1),(29,-1),(29,29),(-1,29)]:z.Outline().Append(k.FromMM(x),k.FromMM(y))
 b.AddNative(z);z.thisown=False
out=w/'plane-first-unrouted.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
assert k.ExportSpecctraDSN(b,str(out.with_suffix('.dsn')))
r={'status':'ARCHITECTURAL_ROUTING_TRIAL_NOT_FABRICATION','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'removed_track_and_via_counts':dict(removed),'reserved_planes':['In1.Cu','In2.Cu'],'signal_routing_layers':['F.Cu','B.Cu'],'fixed_nets':['/USB_DP','/USB_DM','/GND'],'footprint_positions_changed':False,'release_allowed':False};(w/'plane-first-preparation.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
