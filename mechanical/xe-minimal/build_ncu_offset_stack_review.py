from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'offset-pack-lower-trial.step','upper':'thickness-clearance-upper-trial.step','board':'ncu-candidate-integrated-board.step','separator':'support-notched-separator-trial.step','battery':'offset-pack-assembly-trial.step'}
s={n:cq.importers.importStep(str(O/f)).val()for n,f in files.items()};rows=[]
for i,solid in enumerate(s['board'].Solids()):
 b=solid.BoundingBox();prism=cq.Workplane('XY').box(b.xlen,b.ylen,b.zlen+20,centered=(False,False,False)).translate((b.xmin,b.ymin,b.zmin)).val();v=prism.intersect(s['lower']).Volume()
 if v>1e-7:rows.append({'solid_index':i,'prism_overlap_mm3':v,'bbox_mm':[b.xmin,b.xmax,b.ymin,b.ymax,b.zmin,b.zmax]})
colors={'lower':'#a0aab8','upper':'#a0aab8','board':'#328866','separator':'#d8b84e','battery':'#6daed5'}
a=cq.Assembly(name='offset_stack_candidate');e=cq.Assembly(name='offset_stack_exploded_candidate')
for n,shape in s.items():
 a.add(shape,name=n,color=cq.Color(colors[n]));e.add(shape.translate((0,0,{'lower':-20,'battery':-12,'separator':-4,'board':5,'upper':15}[n])),name=n,color=cq.Color(colors[n]))
a.export(str(O/'ncu-offset-stack-candidate.step'));e.export(str(O/'ncu-offset-stack-exploded-candidate.step'))
r={'status':'ASSEMBLY_CANDIDATE_NOT_RELEASED','source_sha256':{n:hashlib.sha256((O/f).read_bytes()).hexdigest()for n,f in files.items()},'board_solids_screened':len(s['board'].Solids()),'board_continuous_enclosing_prism_flags':rows,'upper_intersections_mm3':{n:s['upper'].intersect(s[n]).Volume()for n in ['board','separator','battery','lower']},'limitations':['Per-solid bounding prisms enclose vertical20mm sweeps: zero overlap proves only nominal represented bodies clear; flags require exact shape review','Mating housing and original leads absent','Some component geometry is generic, no solder or manufacturing tolerance qualification','Adhesive, acoustic seal, thermal contact and strength unresolved','Candidate not adopted; no orders or print sent']}
(O/'ncu-offset-stack-candidate-review.json').write_text(json.dumps(r,indent=2));print(json.dumps(r,indent=2))
