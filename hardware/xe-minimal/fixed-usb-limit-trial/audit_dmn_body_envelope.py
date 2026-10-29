"""Conservative planar package envelope vs existing courtyard, not case fit."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);D=Path(__file__).resolve().parent/'dmn-land-trial';p=D/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p));rows=[]
for f in b.GetFootprints():
 if f.GetReference() not in ['Q6','Q7']:continue
 assert f.GetOrientationDegrees()==0
 x,y=f.GetPosition().x,f.GetPosition().y
 # Package axes rotated to footprint: body E1(max)=1.4 across X, D(max)=3 along Y.
 # Lead rectangles conservatively extend from centerline to E(max)/2.
 # Split leads can lie at e(max) +/- b(max)/2; use individual lead pitch range .89..1.03.
 rects=[[-.7,-1.5,.7,1.5],[-1.275,-1.285,0,-.635],[-1.275,.635,0,1.285],[0,-.255,1.275,.255]]
 envelope=k.SHAPE_POLY_SET()
 for x0,y0,x1,y1 in rects:
  q=k.SHAPE_POLY_SET();q.NewOutline()
  for u,v in [(x0,y0),(x1,y0),(x1,y1),(x0,y1)]:q.Append(x+k.FromMM(u),y+k.FromMM(v))
  envelope.BooleanAdd(q)
 f.BuildCourtyardCaches();layer=k.B_CrtYd if f.GetLayer()==k.B_Cu else k.F_CrtYd;c=f.GetCourtyard(layer)
 assert c.OutlineCount()>0
 diff=k.SHAPE_POLY_SET();diff.BooleanSubtract(envelope,c)
 rows.append({'ref':f.GetReference(),'courtyard_layer':b.GetLayerName(layer),'outside_area_mm2':diff.Area()/1e12,'contained':diff.IsEmpty(),'envelope_rectangles_local_mm':rects})
 assert diff.IsEmpty(),rows[-1]
r={'status':'MAXIMUM_PLANAR_PACKAGE_ENVELOPE_CONTAINED_IN_EXISTING_COURTYARD','source':'docs/procurement/evidence/DMN2056U-DS38480-rev2-2.pdf page7','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'maximum_height_mm':1.15,'rows':rows,'limitations':['Footprint courtyard is layout clearance, not proof of solder quality or placement capability','Package placement tolerance and body-to-lead eccentricity not separately added','Height1.15mm must be used for updated whole-device case check; generic STEP not qualified','Pin function orientation and electrical temperature behavior require separate confirmation']};(D/'body-envelope-review.json').write_text(json.dumps(r,indent=2)+'\n');print('Both maximum planar envelopes contained; 1.15 mm maximum height recorded for case integration.')
