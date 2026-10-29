"""Conservative USB4505 reservation study; no PCB mutation or routing approval."""
from pathlib import Path
import hashlib,json,wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
src=P/'iset-50pf-candidate.kicad_pcb';b=k.LoadBoard(str(src))
parts=json.loads((P/'placement.json').read_text())
# Screening reservation, NOT a production Edge.Cuts profile: whole 6.5mm body
# depth inward from y=23 and 9.24mm drawing cutout width, plus0.2mm clearance.
rect=(10.5-9.24/2-.2,23-6.5-.2,10.5+9.24/2+.2,23.2)
def hits(a):return a[0]<rect[2] and a[2]>rect[0] and a[1]<rect[3] and a[3]>rect[1]
components=[]
for p in parts:
 if p['ref']=='J1':continue
 a=(p['x']-p['w']/2,p['y']-p['h']/2,p['x']+p['w']/2,p['y']+p['h']/2)
 if hits(a):components.append({'ref':p['ref'],'side':p['side'],'envelope_mm':a})
copper=[]
for t in b.GetTracks():
 q=t.GetBoundingBox();a=tuple(k.ToMM(v) for v in [q.GetX(),q.GetY(),q.GetRight(),q.GetBottom()])
 if hits(a):copper.append({'uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'layer':b.GetLayerName(t.GetLayer()),'kind':'via' if isinstance(t,k.PCB_VIA) else 'track'})
r={'status':'RESERVATION_SCREEN_ONLY','board_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'reservation_mm':rect,'component_envelope_hits':components,'track_via_bbox_hits':copper,'limitations':['Bounding-box overlaps may be false positives; not exact geometry intersections','Reservation is deliberately larger than final routed cutout','Pads and filled zones not counted; full footprint and six-layer DRC remain required','Anchor lands extend beyond cutout; neighboring Q3/Q4 require additional checks'],'conclusion':'Not a drop-in change: affected parts and copper must be repacked/rerouted before manufacturing.'}
(P/'midmount-reservation-screen.json').write_text(json.dumps(r,indent=2)+'\n')
print('Components:',','.join(x['ref'] for x in components));print('Track/via bbox hits:',len(copper));print('Nets:',sorted(set(x['net'] for x in copper)))
