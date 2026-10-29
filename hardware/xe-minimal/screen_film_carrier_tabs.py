"""Current film board edge courtyards; candidate sites only, no cut approval."""
from pathlib import Path
import json,hashlib
import pcbnew as k,wx
app=wx.App(False);P=Path(__file__).resolve().parent
src=P/'film-integration-trial/pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(src));parts=[];missing=[]
for f in b.GetFootprints():
 ref=f.GetReference()
 if ref=='J3' or ref.startswith('TP'):continue
 items=[s for s in f.GraphicalItems() if s.GetLayer() in (k.F_CrtYd,k.B_CrtYd)]
 if not items:missing.append(ref);continue
 boxes=[s.GetBoundingBox() for s in items]
 parts.append({'ref':ref,'bounds':[min(k.ToMM(v.GetX()) for v in boxes),min(k.ToMM(v.GetY()) for v in boxes),max(k.ToMM(v.GetRight()) for v in boxes),max(k.ToMM(v.GetBottom()) for v in boxes)]})
results=[]
for width in [3.,4.,5.]:
 for edge,length in [('left',27),('right',27),('top',24),('bottom',24)]:
  blocked=[]
  for p in parts:
   x,y,X,Y=p['bounds'];hits={'left':x<=1,'right':X>=23,'top':y<=1,'bottom':Y>=26}[edge]
   if hits:
    lo,hi=(y,Y) if edge in ('left','right') else (x,X);blocked.append((max(0,lo),min(length,hi),p['ref']))
  merged=[]
  for lo,hi,_ in sorted(blocked):
   if merged and lo<=merged[-1][1]:merged[-1][1]=max(hi,merged[-1][1])
   else:merged.append([lo,hi])
  free=[];cursor=1.
  for lo,hi in merged:
   stop=min(lo,length-1)
   if stop-cursor>=width:free.append([cursor,stop])
   cursor=max(cursor,hi)
  if length-1-cursor>=width:free.append([cursor,length-1])
  results.append({'tab_width_mm':width,'edge':edge,'center_intervals_mm':[[round(lo+width/2,6),round(hi-width/2,6)] for lo,hi in free]})
r={'status':'COURTYARD_SCREEN_NOT_COPPER_OR_CUT_QUALIFICATION','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'source':str(src),'local_courtyards':parts,'missing_courtyards':missing,'assumed_inboard_tool_depth_mm':1,'assumed_corner_exclusion_mm':1,'results':results,'limits':['Dimensions are study assumptions, not vendor-approved cutting envelope','No copper, holes, vias, residual edge, stress or nozzle/cutter sweep checked','Do not cut populated boards based on these intervals']}
(P/'film-carrier-tab-screen.json').write_text(json.dumps(r,indent=2)+'\n');print('missing',missing)
for row in results:print(row)
