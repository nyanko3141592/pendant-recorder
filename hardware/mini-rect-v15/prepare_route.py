"""Remove conflicting obsolete copper, retaining the source and explicit airwires."""
from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'xe-usb-placement.kicad_pcb';out=P/'xe-route-source.kicad_pcb';b=k.LoadBoard(str(src))
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';audit=[]
for iteration in range(15):
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
 drc=out.with_suffix('.drc.json');subprocess.run([cli,'pcb','drc','--format','json','--output',str(drc),str(out)],check=True,stdout=subprocess.DEVNULL)
 d=json.loads(drc.read_text());types={'shorting_items','clearance','hole_clearance','solder_mask_bridge','track_dangling','via_dangling'}
 if iteration>0:types-= {'track_dangling','via_dangling'}
 ids={i['uuid'] for v in d['violations'] if v['type'] in types for i in v['items']}
 removals=[t for t in b.GetTracks() if t.m_Uuid.AsString() in ids]
 audit.append({'iteration':iteration,'drc':len(d['violations']),'unconnected':len(d['unconnected_items']),'deleted_track_vias':len(removals)})
 if not removals:break
 for t in removals:b.DeleteNative(t)
else:raise RuntimeError('Cleanup not converged')
# Preserve the six-layer stackup. Reserve In1/In3 as ground-reference planes.
n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetTrackWidth(k.FromMM(.127));n.SetClearance(k.FromMM(.1));n.SetViaDiameter(k.FromMM(.45));n.SetViaDrill(k.FromMM(.2))
k.SaveBoard(str(out),b);dsn=P/'xe-route.dsn';assert k.ExportSpecctraDSN(b,str(dsn))
s=dsn.read_text().replace('(circuit\n','(circuit\n        (use_layer F.Cu In2.Cu In4.Cu B.Cu)\n');dsn.write_text(s)
(P/'route-preparation.json').write_text(json.dumps({'status':'UNROUTED_TRIAL_NOT_RELEASED','cleanup_passes':audit,'reserved_planes':['In1.Cu','In3.Cu'],'limitations':['USB pair and power widths require separate review after routing','No design rules weakened; DRC conflicts converted to explicit unrouted connections']},indent=2)+'\n');print(json.dumps(audit))
