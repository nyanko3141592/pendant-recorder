"""Remove DRC-identified dangling copper until convergence; preserve input trial."""
from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'usb-pair-trial.kicad_pcb';out=P/'usb-corridor-source.kicad_pcb';b=k.LoadBoard(str(src))
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
report=json.loads((P/'usb-pair-trial.drc.json').read_text())
ids={i['uuid'] for v in report['violations'] for i in v['items']}
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in ids and t.GetNetname() not in ['/USB_DP','/USB_DM']:b.DeleteNative(t)
# Shorten the moved DM escape corner to clear the adjacent DP via.
old=k.VECTOR2I(k.FromMM(10.4011),k.FromMM(22.4329));new=k.VECTOR2I(old.x,old.y-k.FromMM(.1))
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetNetname()!='/USB_DM' or t.GetLayer()!=k.B_Cu:continue
 if t.GetStart()==old:t.SetStart(new)
 if t.GetEnd()==old:t.SetEnd(new)
audit=[]
for iteration in range(100):
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
 report=out.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--format','json','--output',str(report),str(out)],check=True,stdout=subprocess.DEVNULL)
 d=json.loads(report.read_text());ids={i['uuid'] for v in d['violations'] if v['type'] in ['track_dangling','via_dangling'] for i in v['items']}
 ts=[t for t in b.GetTracks() if t.m_Uuid.AsString() in ids];audit.append([iteration,len(d['violations']),len(d['unconnected_items']),len(ts)])
 if not ts:break
 for t in ts:b.DeleteNative(t)
else:raise RuntimeError('Not converged')
(P/'usb-corridor-cleanup.json').write_text(json.dumps({'status':'UNFINISHED_ROUTING','columns':['pass','violations','unconnected','removed'],'passes':audit},indent=2)+'\n');print(audit)
