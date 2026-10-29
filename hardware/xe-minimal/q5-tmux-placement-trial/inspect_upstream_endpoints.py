"""Obstacle-aware inner power route; KiCad DRC remains authoritative."""
import pcbnew as k,wx
app=wx.App(False)
import math,json,heapq,shutil,subprocess
from pathlib import Path
O=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');src=O/'vbus-offset';dst=O/'vbus-upstream';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));net=b.FindNet('/VBUS')
a,c=(8.199999,9.65),(10.5,3.2)
def xy(p):return k.ToMM(p.x),k.ToMM(p.y)

def dist(p,s,e):
 dx,dy=e[0]-s[0],e[1]-s[1];q=max(0,min(1,((p[0]-s[0])*dx+(p[1]-s[1])*dy)/(dx*dx+dy*dy))) if dx or dy else 0
 return math.hypot(p[0]-s[0]-q*dx,p[1]-s[1]-q*dy)
report=[]
for layer in [k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu]:
 for name,p in [('newvia',a),('source1',c),('source2',(12.5,3.8))]:
  hits=[]
  for t in b.GetTracks():
   if t.GetNetname()=='/VBUS':continue
   via=isinstance(t,k.PCB_VIA)
   if via or t.GetLayer()==layer:
    gap=dist(p,xy(t.GetStart()),xy(t.GetEnd()))-k.ToMM(t.GetWidth(layer) if via else t.GetWidth())/2
    if gap<.3:hits.append({'net':t.GetNetname(),'uuid':t.m_Uuid.AsString(),'center_to_copper_mm':gap})
  report.append({'layer':layer,'endpoint':name,'nearby':hits});print(report[-1],flush=True)
(O/'upstream-endpoint-review.json').write_text(json.dumps(report,indent=2)+'\n')
