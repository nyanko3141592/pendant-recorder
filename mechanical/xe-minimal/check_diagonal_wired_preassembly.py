"""Screen insertion of the sensor's preformed wires from below a loose separator."""
from pathlib import Path
import cadquery as cq,json,hashlib,argparse
parser=argparse.ArgumentParser();parser.add_argument("--notched",action="store_true");args=parser.parse_args()
from wire_geometry import rounded
O=Path(__file__).resolve().parent
source=O/('diagonal-entry-notched-separator-trial.step' if args.notched else 'diagonal-integral-retainer-separator-trial.step');sep=cq.importers.importStep(str(source)).val()
rp=O/'diagonal-wire-offset-overpass-review.json';r=json.loads(rp.read_text());row=r['rows'][r['selected_row']]
wires=[rounded(p,rad)[0]for p,rad in zip(row['paths_mm'],row['radii_mm'])]
results=[]
for i,w in enumerate(wires):
 samples=[]
 for dz in [-8,-4,-2,-1,-.5,-.25,0]:
  q=w.translate((0,0,dz));samples.append({'translation_z_mm':dz,'overlap_mm3':q.intersect(sep).Volume(),'gap_mm':q.distance(sep)})
 collisions=[s for s in samples if s['overlap_mm3']>1e-8]
 certified=[];unresolved=[];evaluations=0
 if not collisions:
  pending=[(-8.,0.)]
  while pending:
   lo,hi=pending.pop();mid=(lo+hi)/2;d=w.translate((0,0,mid)).distance(sep);evaluations+=1;bound=d-(hi-lo)/2
   if bound>1e-5:certified.append({'translation_z_range_mm':[lo,hi],'lower_bound_mm':bound})
   elif hi-lo<=.002 or evaluations>=400:unresolved.append({'translation_z_range_mm':[lo,hi],'midpoint_gap_mm':d})
   else:pending.extend([(lo,mid),(mid,hi)])
 result={'wire':i,'samples':samples,'sample_collision':bool(collisions),'certified_intervals':certified,'unresolved_intervals':unresolved,'distance_evaluations':evaluations,'fully_bounded_clear':not collisions and not unresolved};results.append(result);print('wire',i,'collision',bool(collisions),'bounded',result['fully_bounded_clear'],flush=True)
r={'status':'PRECONNECTED_WIRE_INSERTION_SCREEN_NOT_ASSEMBLY_QUALIFICATION','separator_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'route_sha256':hashlib.sha256(rp.read_bytes()).hexdigest(),'results':results,'limits':['Board and case absent: PCB ends are loose and not soldered during insertion.','Only nominal preformed wire geometry; bare sensor and provisional joints have a separate exact box-sweep check.','No allowance for real joint insulation, strain relief, shape retention, fixture or handling.','Positive-distance bound assumes CAD numerical errors below 0.00001 mm; not a certified kernel guarantee.','PCB attachment and soldering access after insertion remain unresolved.']}
(O/('diagonal-notched-wired-preassembly-review.json' if args.notched else 'diagonal-wired-preassembly-review.json')).write_text(json.dumps(r,indent=2)+'\n')
