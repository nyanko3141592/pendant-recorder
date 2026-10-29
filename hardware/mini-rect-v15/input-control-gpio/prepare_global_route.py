"""Separate non-USB reroute trial, preserving last DRC0/3-unconnected board."""
from pathlib import Path
import json,shutil,hashlib
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'input-boot-underpass.kicad_pcb';out=P/'global-route-source.kicad_pcb'
assert not out.exists(),'Preserve previous global trial'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
b=k.LoadBoard(str(src));removed=0;kept={}
for t in list(b.GetTracks()):
 name=t.GetNetname()
 if name in ['/USB_DP','/USB_DM'] or (name=='/GND' and isinstance(t,k.PCB_VIA)):
  t.SetLocked(True);kept[name]=kept.get(name,0)+1
 else:b.DeleteNative(t);removed+=1
n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetTrackWidth(k.FromMM(.127));n.SetClearance(k.FromMM(.1));n.SetViaDiameter(k.FromMM(.45));n.SetViaDrill(k.FromMM(.2))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);dsn=P/'global-route.dsn';assert k.ExportSpecctraDSN(b,str(dsn));s=dsn.read_text().replace('(circuit\n','(circuit\n        (use_layer F.Cu In2.Cu In4.Cu B.Cu)\n');dsn.write_text(s)
r={'status':'UNROUTED_ALTERNATE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'removed_non_USB_tracks_vias':removed,'retained':kept,'reserved_ground_layers':['In1.Cu','In3.Cu'],'source_board':str(src),'trial':str(out),'release_allowed':False};(P/'global-route-preparation.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
