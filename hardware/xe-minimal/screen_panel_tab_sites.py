"""Find courtyard-free edge intervals for provisional depanelization studies."""
from pathlib import Path
import hashlib,json,argparse
p=Path(__file__).resolve().parent
src=p/'assembly-panel-courtyard-screen.json'
d=json.loads(src.read_text())
assert hashlib.sha256((p/'pendant-xe-minimal.kicad_pcb').read_bytes()).hexdigest()==d['source_pcb_sha256']
assert not d['parts_without_courtyard']
parser=argparse.ArgumentParser()
parser.add_argument('--width-mm',type=float,default=3.0)
args=parser.parse_args()
width,depth,corner=args.width_mm,1.0,1.0
assert 0<width<=24
# Depth and corner exclusions remain hypotheses, even for source-based widths.
results={}
for edge,length in [('left',27),('right',27),('top',24),('bottom',24)]:
 blocked=[]
 for a in d['local_courtyards']:
  x,y,X,Y=a['bounds']
  hits={'left':x<=depth,'right':X>=24-depth,'top':y<=depth,'bottom':Y>=27-depth}[edge]
  if hits:
   lo,hi=(y,Y) if edge in ('left','right') else (x,X)
   blocked.append((max(0,lo),min(length,hi),a['ref']))
 merged=[]
 for lo,hi,ref in sorted(blocked):
  if merged and lo<=merged[-1][1]:merged[-1][1]=max(hi,merged[-1][1])
  else:merged.append([lo,hi])
 free=[];cursor=corner
 for lo,hi in merged:
  stop=min(lo,length-corner)
  if stop-cursor>=width:free.append([round(cursor,6),round(stop,6)])
  cursor=max(cursor,hi)
 if length-corner-cursor>=width:free.append([round(cursor,6),length-corner])
 results[edge]={'blocked_by_courtyards':[{'start_mm':lo,'end_mm':hi,'ref':r} for lo,hi,r in blocked],'free_intervals_mm':free,'possible_tab_center_intervals_mm':[[round(lo+width/2,6),round(hi-width/2,6)] for lo,hi in free]}
out={'status':'COURTYARD_ONLY_TAB_SITE_SCREEN_NOT_SELECTED_TAB_DESIGN','source_pcb_sha256':d['source_pcb_sha256'],'source_courtyard_report_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'hypothetical_tab_width_mm':width,'hypothetical_inboard_tool_depth_mm':depth,'hypothetical_corner_exclusion_mm':corner,'edges':results,'limitations':['Dimensions are screening hypotheses, not manufacturer requirements or an adopted tab design.','Copper, pads, vias, holes, zones and router geometry are not screened.','No board stress, tool sweep, component body or residual edge tolerance qualification.','Both component sides are excluded together. A free interval is necessary only for this hypothetical courtyard footprint, not proof of a safe cut.']}
(p/('assembly-panel-tab-site-screen.json' if width==3 else f'assembly-panel-tab-site-screen-{width:g}mm.json')).write_text(json.dumps(out,indent=2)+'\n')
for edge,r in results.items():print(edge,r['possible_tab_center_intervals_mm'])
