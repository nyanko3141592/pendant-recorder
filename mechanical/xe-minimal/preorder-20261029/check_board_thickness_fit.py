from pathlib import Path
import cadquery as cq,json,hashlib
w=Path(__file__).resolve().parent
case=w.parent/'prototype-v1/fixed-board-compact-v1'
parts={n:cq.importers.importStep(str(case/f'case-compact-v1-{n}.step')).val() for n in ['lower','upper']}
rows=[]
for label,t in [('min',.7),('nominal',.8),('max',.9)]:
 p=w/f'board-thickness-{label}.step';s=cq.importers.importStep(str(p)).val();bb=s.BoundingBox()
 exported_thickness=bb.zlen
 # Board-only dielectric STEP ignores general thickness; derive an explicit envelope gauge.
 m=cq.Matrix([[1,0,0,0],[0,1,0,0],[0,0,t/bb.zlen,-bb.zmin*t/bb.zlen],[0,0,0,1]])
 s=s.transformGeometry(m); bb=s.BoundingBox()
 assert abs(bb.zlen-t)<1e-5
 cq.exporters.export(s,str(w/f'board-envelope-{label}.step'))
 row={'kicad_export_dielectric_thickness_mm':exported_thickness,'label':label,'bbox_mm':[bb.xmin,bb.xmax,bb.ymin,bb.ymax,bb.zmin,bb.zmax],'actual_thickness_mm':bb.zlen,'requested_mm':t,'valid':s.isValid(),'solids':len(s.Solids()),'case_overlap_mm3':{n:s.intersect(v).Volume() for n,v in parts.items()},'case_distance_mm':{n:s.distance(v) for n,v in parts.items()}}
 rows.append(row)
 cq.exporters.export(s,str(w/f'board-envelope-{label}.stl'),tolerance=.01,angularTolerance=.1)
out={'rows':rows,'case_hashes':{n:hashlib.sha256((case/f'case-compact-v1-{n}.step').read_bytes()).hexdigest() for n in parts},'limitations':['Board-only check; components, retention, battery and harness not evaluated','Same KiCad export datum used; no automatic Z recentering','Not an approved printing kit','Explicit Z-scaled board envelope from native outline; not a native KiCad populated PCB export'],'release_allowed':False}
(w/'board-thickness-fit.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
