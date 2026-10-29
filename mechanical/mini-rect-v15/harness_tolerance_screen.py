"""Independent lead-length and OD sensitivity; does not qualify the battery harness."""
from pathlib import Path
import itertools,json
from scipy.spatial import cKDTree
from harness_arc_screen import path
rows=[]
for lengths in itertools.product((12.,15.,18.),repeat=3):
 for phases in ((0,0,0),(0,.5,1),(1,.5,0)):
  wires=[path(l,x,f) for l,x,f in zip(lengths,(8.05,9.25,10.45),phases)]
  distance=min(float(cKDTree(wires[i]).query(wires[j])[0].min()) for i,j in ((0,1),(1,2),(0,2)))
  rows.append(dict(lengths_mm=lengths,phases=phases,min_sampled_centerline_distance_mm=distance,definite_collision_by_OD={str(od):distance<od for od in (.6,.7,.8)}))
r=dict(status='REJECTION_SCREEN_ONLY',case_count=len(rows),assumed_min_radius_mm=1.4,wire_OD_sensitivity_mm=[.6,.7,.8],OD_basis='0.70mm is an AWG30 example in Molex AS-78172-001; not verified as the XE pack wire.0.80 is engineering sensitivity only.',collision_case_counts={str(od):sum(x['definite_collision_by_OD'][str(od)] for x in rows) for od in (.6,.7,.8)},rows=rows,limitations=['Only 27 discrete length combinations; continuous12..18mm interval not proven.','Sample pairs below OD prove interference; a pass is not a continuous-clearance certificate.','Only three translated/phased arc arrangements screened; rejection does not exclude other layouts.','Endpoint positions, wire OD and bend radius unqualified; component and assembly sweep not screened.'])
Path(__file__).with_name('harness-tolerance-screen.json').write_text(json.dumps(r,indent=2)+'\n')
print('Independent-length cases:',r['case_count'],'collisions:',r['collision_case_counts'])
