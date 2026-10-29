"""Remove unintended thin roofs over enlarged joint pockets; keep pocket floors."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'film-roomier-joint-lower-trial.step','separator':'film-roomier-joint-separator-trial.step','board':'film-integration-integrated-board.step','battery':'offset-pack-assembly-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
cuts=[pose(cq.Workplane('XY').box(1.3,3,3.57,centered=(True,False,False)).translate((x,23.1,-2.57)).val())for x in [-.9,.9]]
new=s['lower'].cut(*cuts).clean();assert new.isValid() and len(new.Solids())==1
p=O/'film-open-joint-pockets-lower-trial.step';cq.exporters.export(new,str(p))
r={'status':'OPEN_JOINT_POCKETS_TRIAL_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/f).read_bytes()).hexdigest()for k,f in files.items()},'output_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'valid':new.isValid(),'solid_count':len(new.Solids()),'removed_volume_mm3':s['lower'].Volume()-new.Volume(),'checks':{k:{'overlap_mm3':new.intersect(q).Volume(),'gap_mm':new.distance(q)}for k,q in s.items()if k!='lower'},'limits':['Removed upper thin roof, not pocket floor.','Separator support area, local printed mating and strength require recheck.','No physical assembly or load qualification.']}
(O/'film-open-joint-pockets-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
