"""Provisional panel alignment features; no supplier acceptance implied."""
from pathlib import Path
import json,hashlib,math
p=Path(__file__).resolve().parent;s=p/'supported-panel-topology-study.json';r=json.loads(s.read_text());corner_patches=[[0,0,6,6],[84,0,90,6],[0,71,6,77]];rails=r['rail_bounds_mm']+corner_patches
fids=[{'id':f'FID{i+1}','center_mm':v,'copper_diameter_mm':1.0,'mask_opening_diameter_mm':2.0,'clearance_envelope_diameter_mm':3.0,'sides':['F','B']} for i,v in enumerate([[3.85,3.85],[86.15,3.85],[3.85,73.15]])]
holes=[{'id':f'TOOL{i+1}','center_mm':v,'drill_diameter_mm':2.0} for i,v in enumerate([[10,2.5],[80,2.5],[10,74.5]])]
# Corners are unions of overlapping edge rails. Sample a disk's entire bounding box
# on grid, plus circle perimeter; each sample must lie within at least one rail.
def inrails(x,y):return any(a<=x<=c and b<=y<=d for a,b,c,d in rails)
features=[]
for f in fids:features.append((f['id'],f['center_mm'],1.5))
for h in holes:features.append((h['id'],h['center_mm'],1.0))
for ident,(x,y),radius in features:
 # Exact disk inclusion is obtained here by rectangle bounding-box inclusion
 # in either an individual rail or the top/bottom horizontal strip.
 assert any(a<=x-radius and x+radius<=c and b<=y-radius and y+radius<=d for a,b,c,d in rails),ident
pairs=[]
for i,(a,xy,ra) in enumerate(features):
 for b,uv,rb in features[i+1:]:
  gap=math.dist(xy,uv)-ra-rb;assert gap>0;pairs.append({'a':a,'b':b,'envelope_gap_mm':gap})
report={'status':'PROVISIONAL_TOOLING_GEOMETRY_NOT_ASSEMBLY_APPROVED','source_topology_sha256':hashlib.sha256(s.read_bytes()).hexdigest(),'source_url':'https://jlcpcb.com/capabilities/pcb-capabilities/','required_corner_material_patches_mm':corner_patches,'fiducials':fids,'tooling_holes':holes,'all_envelopes_inside_rails':True,'minimum_feature_envelope_gap_mm':min(v['envelope_gap_mm'] for v in pairs),'pair_clearances':pairs,'assumptions':['Public dimensions: fiducial copper diameter 1 mm, tooling hole diameter 2 mm, corner fiducial center inset 3.85 mm.','Mask opening 2 mm and exclusion envelope 3 mm are design proposals, not sourced process approvals.','Three fiducials form an asymmetric triangle; same physical locations on both sides, bottom view must be mirrored.','Tooling holes proposed on horizontal rails; assembler fixture compatibility remains unverified.'],'limitations':['Corner patches are required for 3 mm fiducial envelopes; original nominal carrier STEP lacks these patches. Not yet integrated into electrical panel PCB or Gerbers.','No clamp, conveyor, camera field-of-view or registration tolerance qualification.']}
(p/'panel-tooling-layout-study.json').write_text(json.dumps(report,indent=2)+'\n');print('3 fiducial sites / 3 holes; minimum envelope gap',report['minimum_feature_envelope_gap_mm'])
