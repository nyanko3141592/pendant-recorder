from pathlib import Path
import cadquery as cq,json
O=Path(__file__).resolve().parent
base=cq.importers.importStep(str(O/'vendor/ntcaflex/NTCAFLEX05103HH.STEP')).val().rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),120)
obs={k:cq.importers.importStep(str(O/f)).val()for k,f in {'lower':'ntcaflex-expanded-right-lower-trial.step','upper':'ntcaflex-expanded-right-upper-trial.step','battery':'offset-pack-assembly-trial.step','board':'film-integration-integrated-board.step'}.items()}
rows=[]
for y in (-5.15,-5.25,-5.4):
 s=base.translate((12.9,y,-2.32));r={'head_xy_mm':[12.9,y],'checks':{k:{'overlap_mm3':s.intersect(v).Volume(),'distance_mm':s.distance(v)}for k,v in obs.items()}};rows.append(r);print(r,flush=True)
(O/'ntcaflex-expanded-y-search.json').write_text(json.dumps({'status':'PLACEMENT_SEARCH_NOT_ADOPTED','cases':rows,'limitations':['Related HH nominal model only.','Separator, locating peg, thermal interface and original harness not included.']},indent=2)+'\n')
