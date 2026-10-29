from pathlib import Path
import sys
from gerbonara import LayerStack
import json,math,hashlib
P=Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).resolve().parent/'fabrication-review';expected=json.loads((P/'expected-board-drills.json').read_text());actual=[]
for d in LayerStack.open(P/'gerber').drill_layers:
 attr=next(c for c in d.comments if 'TF.FileFunction' in c)
 assert ',Plated,' in attr or ',NonPlated,' in attr
 for o in d.objects:
  width=o.aperture.diameter
  if type(o).__name__=='Flash':center=[o.x,o.y];ends=None;length=width
  else:
   assert type(o).__name__=='Line'
   ends=[[o.x1,o.y1],[o.x2,o.y2]];center=[(o.x1+o.x2)/2,(o.y1+o.y2)/2];length=width+math.dist(*ends)
  actual.append({'plated':',Plated,' in attr,'center':center,'width':width,'length':length,'ends':ends})
used=set();matched=[];errors=[];tol=.001
for e in expected['rows']:
 candidates=[]
 for i,a in enumerate(actual):
  if i in used or a['plated']!=e['plated'] or bool(a['ends'])!=bool(e['ends']):continue
  err=max(math.dist(a['center'],e['center']),abs(a['width']-e['width']),abs(a['length']-e['length']))
  if e['ends']:err=max(err,min(max(math.dist(a['ends'][j],e['ends'][j]) for j in (0,1)),max(math.dist(a['ends'][j],e['ends'][1-j]) for j in (0,1))))
  if err<=tol:candidates.append((err,i))
 if not candidates:errors.append(e);continue
 err,i=min(candidates);used.add(i);matched.append({'source':e['source'],'max_error_mm':err})
out={'status':'PASS' if not errors and len(used)==len(actual) else 'FAIL','tolerance_mm':tol,'matched':len(matched),'expected':len(expected['rows']),'actual':len(actual),'max_error_mm':max(x['max_error_mm'] for x in matched),'unmatched_expected':errors,'unused_actual':sorted(set(range(len(actual)))-used),'board_sha256':expected['source_sha256'],'drill_sha256':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in (P/'gerber').glob('*.drl')},'scope':'One-to-one board-drill to Excellon center, diameter, slot ends/length and declared plating; does not test copper annular-ring or fab tolerances'}
(P/'drill-registration-review.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2));assert out['status']=='PASS'
