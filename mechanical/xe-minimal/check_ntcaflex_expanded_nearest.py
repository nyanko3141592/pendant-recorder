from pathlib import Path
import cadquery as cq,json
from OCP.BRepExtrema import BRepExtrema_DistShapeShape
O=Path(__file__).resolve().parent
s=cq.importers.importStep(str(O/'vendor/ntcaflex/NTCAFLEX05103HH.STEP')).val().rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),120).translate((12.9,-5,-2.32))
l=cq.importers.importStep(str(O/'ntcaflex-expanded-right-lower-trial.step')).val()
d=BRepExtrema_DistShapeShape(s.wrapped,l.wrapped);d.Perform()
def xyz(p):return [p.X(),p.Y(),p.Z()]
r={'distance_mm':d.Value(),'points':[{'sensor':xyz(d.PointOnShape1(i)),'lower':xyz(d.PointOnShape2(i))}for i in range(1,d.NbSolution()+1)],'status':'NOMINAL_REFERENCE_ONLY'}
(O/'ntcaflex-expanded-nearest.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
