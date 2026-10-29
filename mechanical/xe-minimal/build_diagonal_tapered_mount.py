"""Tapered tray pedestal to remove abrupt unsupported underside."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'lower':'diagonal-film-lower-trial.step','tray':'diagonal-joint-tray-trial.step','board':'film-sensor-depopulated-board-study.step','battery':'offset-pack-assembly-trial.step','separator':'diagonal-bridge-separator-trial.step','upper':'tab-clearance-upper-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
def pose(q):return q.rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0))
floor=s['lower'].BoundingBox().zmin+.8
stem=pose(cq.Workplane('XY').box(1.2,1.2,-5.4-floor+.1,centered=(True,True,False)).translate((0,24.5,floor-.1)).val())
taper=pose(cq.Workplane('XY',origin=(0,24.5,-5.42)).rect(1.2,1.2).workplane(offset=2.62).rect(3.7,3.8).loft(ruled=True).val())
mount=stem.fuse(taper).clean();lower=s['lower'].fuse(mount,s['tray']).clean()
checks={k:{'overlap_mm3':mount.intersect(s[k]).Volume(),'gap_mm':mount.distance(s[k])} for k in ['board','battery','separator','upper']}
cq.exporters.export(lower,str(O/'diagonal-tapered-tray-lower-trial.step'))
r={'status':'TAPERED_PEDESTAL_TRIAL_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'valid':lower.isValid(),'solid_count':len(lower.Solids()),'taper_height_mm':2.62,'bottom_xy_mm':[1.2,1.2],'top_xy_mm':[3.7,3.8],'maximum_side_expansion_per_vertical_mm':1.3/2.62,'checks':checks,'limits':['Nominal slope is not a print qualification.','Tray to existing lower geometry slit remains; slicer may merge close walls.','No cap/strain relief or physical load qualification.','Full harness clearance must be rechecked against changed mount.']}
(O/'diagonal-tapered-mount-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
