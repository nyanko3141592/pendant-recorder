"""Widen end-relief boundaries to cover provisional X/Z displacement."""
from pathlib import Path
import cadquery as cq,json,hashlib,itertools,argparse
parser=argparse.ArgumentParser();parser.add_argument("--margin",type=float,default=.25);args=parser.parse_args();margin=args.margin
assert .25<=margin<=.5
tag=f"{round(margin*1000):03d}um"
O=Path(__file__).resolve().parent
source=O/'film-lead-wrap-clearance-lower-trial.step';lower=cq.importers.importStep(str(source)).val()
pack=cq.importers.importStep(str(O/'offset-pack-assembly-trial.step')).val()
cuts=[cq.Workplane('XY').box(15.8,margin+.01,4.5,centered=False).translate((.75,y,-6.77)).val() for y in (-27-margin,-.01)]
s=lower.cut(*cuts).clean();assert s.isValid() and len(s.Solids())==1
b0=lower.BoundingBox();b1=s.BoundingBox();same=all(abs(getattr(b0,k)-getattr(b1,k))<1e-7 for k in ('xmin','xmax','ymin','ymax','zmin','zmax'));assert same
out=O/f'film-battery-end-wide-{tag}-lower-trial.step';cq.exporters.export(s,str(out))
cases=[]
for dx,dy,dz in itertools.product((-.1,0,.1),(-.25,0,.25),(-.1,0,.1)):
 v=pack.translate((dx,dy,dz)).intersect(s).Volume();cases.append({'offset_mm':[dx,dy,dz],'overlap_mm3':v})
r={'status':'WIDE_END_RELIEF_TRIAL_NOT_ADOPTED','margin_per_end_mm':margin,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'valid_single_solid':True,'same_outer_bbox':same,'removed_volume_mm3':lower.Volume()-s.Volume(),'nominal_battery_gap_mm':pack.distance(s),'displacement_cases':cases,'colliding_cases':sum(c['overlap_mm3']>1e-7 for c in cases),'limits':['Exploratory +/-0.1mm X/Z displacement, not measured printer precision.','Exact Y end travel includes contact; no clearance claim at limiting pose.','Retention, thermal contact, local wall thickness, assembly sweep, harness and slicing require review before adoption.']}
(O/('film-battery-end-wide-clearance-review.json' if margin==.25 else f'film-battery-end-wide-{tag}-clearance-review.json')).write_text(json.dumps(r,indent=2)+'\n')
print('valid single solid; unchanged bounds; collisions',r['colliding_cases'],'/27; nominal gap',r['nominal_battery_gap_mm'])
