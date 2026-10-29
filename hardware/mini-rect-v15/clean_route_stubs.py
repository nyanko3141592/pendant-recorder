"""Remove DRC-identified dangling copper until convergence; preserve input trial."""
from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'xe-route-widths.kicad_pcb';out=P/'xe-route-clean.kicad_pcb';b=k.LoadBoard(str(src))
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
# The clearance offending CC2 fragment belongs to the obsolete connector branch.
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString()=='0a8b26fb-bf5b-43e3-ba37-b571ba1fd5dc':b.DeleteNative(t)
audit=[]
for iteration in range(100):
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
 report=out.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--format','json','--output',str(report),str(out)],check=True,stdout=subprocess.DEVNULL)
 d=json.loads(report.read_text());ids={i['uuid'] for v in d['violations'] if v['type'] in ['track_dangling','via_dangling'] for i in v['items']}
 ts=[t for t in b.GetTracks() if t.m_Uuid.AsString() in ids];audit.append([iteration,len(d['violations']),len(d['unconnected_items']),len(ts)])
 if not ts:break
 for t in ts:b.DeleteNative(t)
else:raise RuntimeError('Not converged')
(P/'route-stub-cleanup.json').write_text(json.dumps({'status':'UNFINISHED_ROUTING','columns':['pass','violations','unconnected','removed'],'passes':audit},indent=2)+'\n');print(audit)
