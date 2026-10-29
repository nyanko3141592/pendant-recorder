from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent
files={'separator':'support-notched-separator-trial.step','lower':'wider-right-support-lower-trial.step','board':'film-sensor-depopulated-board-study.step','battery':'offset-pack-assembly-trial.step','upper':'tab-clearance-upper-trial.step'}
s={k:cq.importers.importStep(str(O/v)).val() for k,v in files.items()}
# Remove only the projecting old ear, preserving the plate edge atX16.2.
ear_cut=cq.Workplane('XY').box(1.3,2.6,1,centered=(False,False,False)).translate((16.2,-8.3,-2.5)).val()
sep=s['separator'].cut(ear_cut)
ear=cq.Workplane('XY').box(1.6,2.4,.3,centered=(True,True,False)).translate((16.6,-15,-2.22)).val();sep=sep.fuse(ear)
slot=cq.Workplane('XY').box(4.7,26.4,2,centered=(True,False,False)).translate((0,-.2,-3)).val().rotate((0,0,0),(0,0,1),-28).translate((7.6,-25.5,0));sep=sep.cut(slot).clean()
floor=s['lower'].BoundingBox().zmin+.8
oldpost=cq.Workplane('XY').box(1,2,-2.22-floor+.001,centered=(False,False,False)).translate((16.6,-8,floor)).val()
newpost=cq.Workplane('XY').box(1,2,-2.22-floor+.1,centered=(False,False,False)).translate((16.6,-16,floor-.1)).val()
lower=s['lower'].cut(oldpost).fuse(newpost).clean()
checks={name:{k:q.intersect(v).Volume() for k,v in s.items() if k in ['board','battery','upper']} for name,q in [('separator',sep),('lower',lower)]}
checks['separator_lower_overlap_mm3']=sep.intersect(lower).Volume()
cq.exporters.export(sep,str(O/'diagonal-film-separator-trial.step'));cq.exporters.export(lower,str(O/'diagonal-film-lower-trial.step'))
a=cq.Assembly(name='diagonal_separator_support_trial');a.add(sep,name='separator',color=cq.Color('#ddbb55'));a.add(lower,name='lower',color=cq.Color('#aaaaaa'));a.export(str(O/'diagonal-film-support-study.step'))
r={'status':'DIAGONAL_SEPARATOR_SUPPORT_TRIAL_NOT_ADOPTED','sources_sha256':{k:hashlib.sha256((O/v).read_bytes()).hexdigest() for k,v in files.items()},'head_xy_mm':[7.6,-25.5],'angle_deg':28,'slot_width_mm':4.7,'support_center_y_old_new_mm':[-7,-15],'separator_valid':sep.isValid(),'separator_solid_count':len(sep.Solids()),'lower_valid':lower.isValid(),'lower_solid_count':len(lower.Solids()),'checks':checks,'limits':['No strengthened cross-ribs over diagonal slot yet; stiffness and printing unverified.','Slot is full width even at narrower leads, deliberately provisional.','Support contact area and insertion path not yet qualified.','Sensor holder and wire route absent; this is not complete assembly.']}
(O/'diagonal-film-support-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
