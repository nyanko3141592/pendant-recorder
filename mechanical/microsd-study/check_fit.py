from pathlib import Path
import json,math,hashlib
R=Path(__file__).resolve().parents[2]; H=R/'hardware/mini-rect-v12'; P=Path(__file__).parent
parts=json.loads((H/'placement.json').read_text())
# Conservative rectangle enclosing connector plus inserted card. Not landpattern.
W,D,HEIGHT=11.95,15.8,1.55
radius=2.5
def inside(x,y):
 cx=min(max(x,radius),21-radius);cy=min(max(y,radius),23-radius)
 return (x-cx)**2+(y-cy)**2<=radius**2+1e-9

def overlap(a,b):
 return max(0,min(a[2],b[2])-max(a[0],b[0]))*max(0,min(a[3],b[3])-max(a[1],b[1]))
results=[]
for side in ['F','B']:
 best=None;fit=0;tested=0
 for angle in [0,90]:
  w,h=(W,D) if angle==0 else (D,W)
  for ix in range(85):
   for iy in range(93):
    x,y=ix*.25,iy*.25;rect=[x-w/2,y-h/2,x+w/2,y+h/2]
    if not all(inside(a,b) for a,b in [(rect[0],rect[1]),(rect[0],rect[3]),(rect[2],rect[1]),(rect[2],rect[3])]):continue
    tested+=1;hits=[];area=0
    for p in parts:
     if p['side']!=side or p['ref']=='U11':continue
     v=overlap(rect,[p['x']-p['w']/2-.1,p['y']-p['h']/2-.1,p['x']+p['w']/2+.1,p['y']+p['h']/2+.1])
     if v>0: hits.append(p['ref']);area+=v
    # Board z8.5, battery top7.4: lower-side headroom1.1mm.
    battery=side=='B' and HEIGHT>1.1 and overlap(rect,[3,2,18,19])>0
    if battery:hits.append('BATTERY');area+=overlap(rect,[3,2,18,19])
    if not hits:fit+=1
    candidate=dict(side=side,angle=angle,center_mm=[x,y],rect_mm=rect,collision_refs=hits,overlap_area_sum_mm2=area)
    if best is None or (len(hits),area)<(len(best['collision_refs']),best['overlap_area_sum_mm2']):best=candidate
 results.append(dict(side=side,tested=tested,collision_free=fit,best=best))
d=dict(scope='0.25mm grid,0/90degree, conservative XY envelopes; existing layout except removed U11. Not a proof against a full redesign.',socket='Hirose DM3D-SF',envelope_mm=[W,D,HEIGHT],source='https://www.hirose.com/product/document?clcode=CL0609-0033-6-00&documentid=D49662_en&documenttype=Catalog&lang=en&productname=DM3AT-SF-PEJ2M5&series=DM3',placement_sha256=hashlib.sha256((H/'placement.json').read_bytes()).hexdigest(),results=results,adopted=False,remaining=['Actual socket landpattern and no-copper areas','Full component rearrangement/routing','Card current peaks and standby','Card insertion/retention and qualified card procurement'])
(P/'fit-result.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(results,indent=2))
