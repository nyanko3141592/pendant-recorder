"""Screen previously unmodeled insulation on exposed sensor lead segment."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'film-open-joint-pockets-lower-trial.step','separator':'film-roomier-joint-separator-trial.step','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
rows=[];assembly=cq.Assembly(name='sensor_lead_insulation_budget')
for k,q in s.items():assembly.add(q,name=k)
for x in [-.95,.95]:
 # Existing lead budget .7 wide, .5 high, starts Y22. Independent .08 tape wrap,
 # two side layers and three vertical layers with overlap seam upward.
 raw=cq.Workplane('XY').box(.7,1.2,.5,centered=(True,False,False)).translate((x,22,-2.32)).val()
 outer=cq.Workplane('XY').box(.86,1.2,.74,centered=(True,False,False)).translate((x,22,-2.40)).val()
 shell=pose(outer.cut(raw));assembly.add(shell,name='wrap_'+str(x))
 checks={k:{'overlap_mm3':shell.intersect(q).Volume(),'gap_mm':shell.distance(q)}for k,q in s.items()}
 rows.append({'lead_center_local_x_mm':x,'checks':checks})
assembly.export(str(O/'film-full-lead-insulation-study.step'))
r={'status':'FULL_LEAD_INSULATION_SCREEN_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/f).read_bytes()).hexdigest()for k,f in files.items()},'screened_local_y_mm':[22,23.2],'tape_nominal_assumption_mm':.08,'rows':rows,'limits':['Only previously uncovered lead-to-joint segment; joint wrap and transition at film edge remain unrealized.','Tape thickness and lead dimensions are provisional envelopes, not guaranteed material maxima.','Independent conductor insulation must extend to the film boundary without pinching or insulating the sensing contact region.','No adhesion, creepage, wear, solder heat or pull qualification.']}
(O/'film-full-lead-insulation-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
