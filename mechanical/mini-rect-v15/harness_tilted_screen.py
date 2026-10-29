"""Screen independently tilted and mirrored lobes before moving the PCB connector.
No change to production CAD; geometric rejection evidence only.
"""
from pathlib import Path
import itertools,json
import numpy as np
from scipy.spatial import cKDTree
import harness_arc_screen as arc
arc.STEP=.02
xs=(8.05,9.25,10.45)
states=list(itertools.product((12.,15.,18.),(-1,1),(0.,.5,1.),(-20.,-10.,0.,10.,20.)))
paths={}
for wire,x in enumerate(xs):
 for state in states:
  length,sign,phase,angle=state
  p=arc.path(length,x,phase)
  lateral=sign*(p[:,0]-x)
  tilt=np.deg2rad(angle)
  p[:,0]=x+lateral*np.cos(tilt)
  p[:,2]+=lateral*np.sin(tilt)
  # The lobe is above the pack and below the bare PCB. Components excluded.
  lobe=np.abs(lateral)>1e-9
  if np.any(p[lobe,2]<6.1) or np.any(p[lobe,2]>8.2):continue
  if np.any(p[:,0]<1.6) or np.any(p[:,0]>28.4) or np.any(p[:,1]>30.4):continue
  assert np.linalg.norm(p[-1]-[x,22.02,7.3])<1e-8
  paths[wire,state]=p
pair_dist={}
for i,j in ((0,1),(1,2),(0,2)):
 for a in states:
  if (i,a) not in paths:continue
  tree=cKDTree(paths[i,a])
  for b in states:
   if (j,b) not in paths:continue
   pair_dist[i,j,a,b]=float(tree.query(paths[j,b])[0].min())
rows=[]
for lengths in itertools.product((12.,15.,18.),repeat=3):
 options=[[s for s in states if s[0]==length and (i,s) in paths] for i,length in enumerate(lengths)]
 best=None
 for config in itertools.product(*options):
  distance=min(pair_dist[i,j,config[i],config[j]] for i,j in ((0,1),(1,2),(0,2)))
  if best is None or distance>best[0]:best=(distance,config)
 distance,config=best
 points=np.concatenate([paths[i,s] for i,s in enumerate(config)])
 rows.append(dict(lengths_mm=lengths,mirrors=[s[1] for s in config],phases=[s[2] for s in config],tilt_degrees=[s[3] for s in config],best_sampled_center_distance_mm=distance,definite_collision_at_OD_0_8=distance<.8,bounds_min_mm=points.min(axis=0).tolist(),bounds_max_mm=points.max(axis=0).tolist()))
r=dict(status='TILTED_LOBE_REJECTION_SCREEN_NOT_FIT_APPROVAL',sampling_step_mm=.02,maximum_configurations_per_length_set=27000,kept_path_count=len(paths),lobe_center_Z_limits_mm=[6.1,8.2],length_sets=27,rows=rows,collision_length_sets_at_OD_0_8=sum(x['definite_collision_at_OD_0_8'] for x in rows),limitations=['Wire endpoints, 1.4 mm bend radius and 0.8 mm OD remain assumptions.','Only discrete length combinations; no continuous tolerance proof.','Samples above OD do not prove continuous clearance.','No self-contact, component, battery, case, connector or assembly sweep clearance tested.','Rigidly tilting each planar return lobe preserves its length and curvature; the initial U-turn is unchanged. This does not establish a manufacturable routing.', 'Z bounds only screen the lobe against assumed pack top 5.7 and bare PCB underside 8.6 with 0.4 radius; component clearance is not included.'])
Path(__file__).with_name('harness-tilted-screen.json').write_text(json.dumps(r,indent=2)+'\n')
print('Tilted candidate length sets with unavoidable sampled collision:',r['collision_length_sets_at_OD_0_8'],'of 27')
print('Worst best distance:',min(x['best_sampled_center_distance_mm'] for x in rows))
