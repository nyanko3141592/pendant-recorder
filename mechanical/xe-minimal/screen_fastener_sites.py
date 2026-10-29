from pathlib import Path
import json, math, hashlib
import pcbnew as k, wx
app=wx.App(False)
root=Path(__file__).resolve().parents[2];p=root/'hardware/xe-minimal/fixed-usb-limit-trial/tps22950-19k1-candidate/pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p))
# A 3.8mm boss accounts for a 2.887mm nut corner envelope, clearance and wall.
# This is a conservative planar obstacle screen, not permission to drill.
r=1.9;clear=.2
obs=[]
for f in b.GetFootprints():
 for pad in f.Pads():
  q=pad.GetBoundingBox();obs.append((f.GetReference()+'.'+pad.GetNumber(),k.ToMM(q.GetX()),k.ToMM(q.GetY()),k.ToMM(q.GetRight()),k.ToMM(q.GetBottom())))
tracks=[]
for i,t in enumerate(b.GetTracks()):
 if isinstance(t,k.PCB_ARC):
  q=t.GetBoundingBox();obs.append(('arc:'+str(i),k.ToMM(q.GetX()),k.ToMM(q.GetY()),k.ToMM(q.GetRight()),k.ToMM(q.GetBottom())))
 else:
  a=t.GetStart();z=t.GetEnd();w=k.ToMM(t.GetWidth(t.TopLayer()) if isinstance(t,k.PCB_VIA) else t.GetWidth())
  tracks.append((str(t.m_Uuid.AsString()),k.ToMM(a.x),k.ToMM(a.y),k.ToMM(z.x),k.ToMM(z.y),w/2))
def distance(x,y,a,b,c,d):
 dx,dy=c-a,d-b;f=max(0,min(1,((x-a)*dx+(y-b)*dy)/(dx*dx+dy*dy))) if dx*dx+dy*dy else 0
 return math.hypot(x-a-f*dx,y-b-f*dy)
rows=[]
for ix in range(36,45):
 for iy in range(4,51):
  x,y=ix*.5,iy*.5
  hits=[n for n,x0,y0,x1,y1 in obs if math.hypot(max(x0-x,0,x-x1),max(y0-y,0,y-y1))<r+clear]
  hits += ['copper:'+n for n,a,b,c,d,w in tracks if distance(x,y,a,b,c,d)<r+clear+w]
  rows.append({'x_mm':x,'y_mm':y,'obstacle_count':len(hits),'obstacles':hits})
rows.sort(key=lambda a:a['obstacle_count'])
out=root/'mechanical/xe-minimal/fastener-site-screen.json'
report={'status':'PLANAR_BOSS_SCREEN_NOT_DRILL_APPROVAL','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'boss_diameter_mm':2*r,'clearance_mm':clear,'tested_sites':len(rows),'clear_sites':[v for v in rows if not v['obstacles']],'least_obstructed_sites':rows[:12],'limitations':['Pad/arc bounding boxes conservative; straight track/via distances exact in XY','Zones, body courtyards, battery leads and mechanical stack not included','Right-side strip only; no global impossibility claim','Any accepted site requires actual board cutout, zone refill and full DRC','Boss size is engineering assumption, not selected hardware drawing']}
out.write_text(json.dumps(report,indent=2)+'\n');print({'tested':len(rows),'clear':len(report['clear_sites']),'best':rows[0]})
