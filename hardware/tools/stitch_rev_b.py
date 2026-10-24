#!/usr/bin/env python3
"""Add conservative candidate GND stitching; require subsequent DRC, no exclusions."""
import json,math
from pathlib import Path
import pcbnew as p
out=Path(__file__).resolve().parents[1]/'rev-b';b=p.LoadBoard(str(out/'pendant-rev-b.kicad_pcb'));g=b.FindNet('GND').GetNetCode()
def xy(v):return (p.ToMM(v.x),p.ToMM(v.y))
def dist(x,y,a,c):
 dx,dy=c[0]-a[0],c[1]-a[1];u=max(0,min(1,((x-a[0])*dx+(y-a[1])*dy)/(dx*dx+dy*dy))) if dx*dx+dy*dy else 0
 return math.hypot(x-a[0]-u*dx,y-a[1]-u*dy)
pads=list(b.GetPads());tracks=list(b.GetTracks());added=[]
for x in [100.8+i*.8 for i in range(26)]:
 for y in [105.2+i*.8 for i in range(47)]:
  bad=False
  for pad in pads:
   bb=pad.GetBoundingBox();x0,y0,w,h=[p.ToMM(v) for v in [bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight()]]
   if x0-.5<x<x0+w+.5 and y0-.5<y<y0+h+.5:bad=True;break
  if bad:continue
  for t in tracks:
   if t.GetClass()=='PCB_VIA':
    if math.dist((x,y),xy(t.GetPosition()))<.8:bad=True;break
   elif t.GetNetCode()!=g and dist(x,y,xy(t.GetStart()),xy(t.GetEnd()))<.5+p.ToMM(t.GetWidth())/2:bad=True;break
  if bad:continue
  if any(math.dist((x,y),(q['x'],q['y']))<2.4 for q in added):continue
  v=p.PCB_VIA(b);v.SetPosition(p.VECTOR2I(p.FromMM(x),p.FromMM(y)));v.SetWidth(p.FromMM(.6));v.SetDrill(p.FromMM(.3));v.SetViaType(p.VIATYPE_THROUGH);v.SetLayerPair(p.F_Cu,p.B_Cu);v.SetNetCode(g);b.Add(v)
  added.append({'x':x,'y':y,'uuid':str(v.m_Uuid)})
p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(out/'pendant-rev-b.kicad_pcb'),b);(out/'routing/stitch-candidates.json').write_text(json.dumps(added,indent=2));print('Candidate GND vias:',len(added))
