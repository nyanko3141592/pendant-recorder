"""Clearance-slot candidate only. Does not establish insulation or strength."""
from pathlib import Path
import cadquery as cq,json,hashlib
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import PolyCollection
O=Path(__file__).resolve().parent
p=O/'support-notched-separator-trial.step';old=cq.importers.importStep(str(p)).val()
# Straight-sided opening, .30mm lateral and .20mm end clearance to full envelope.
cut=cq.Workplane('XY').box(4.7,26.4,2,centered=(True,True,True)).translate((9,-13.5,-2.07)).val()
new=old.cut(cut);assert new.isValid() and len(new.Solids())==1
film=cq.Workplane('XY').box(4.1,26,.5,centered=(True,True,False)).translate((9,-13.5,-2.32)).val()
assert new.intersect(film).Volume()<1e-8
cq.exporters.export(new,str(O/'film-slot-separator-trial.step'))
a=cq.Assembly(name='film_slot_study');a.add(new,name='separator',color=cq.Color('#d8b84e'));a.add(film,name='film_envelope',color=cq.Color('#ee8866'));a.export(str(O/'film-slot-separator-study.step'))
b=new.BoundingBox();fb=film.BoundingBox()
fig,ax=plt.subplots(figsize=(7,8))
points,faces=new.tessellate(.03)
polys=[]
for face in faces:
 v=[points[i] for i in face]
 if max(x.z for x in v)-min(x.z for x in v)<1e-7 and abs(v[0].z-b.zmax)<1e-6:polys.append([(x.x,x.y) for x in v])
ax.add_collection(PolyCollection(polys,facecolors='#d8b84e',edgecolors='none'))
from matplotlib.patches import Rectangle
ax.add_patch(Rectangle((fb.xmin,fb.ymin),fb.xlen,fb.ylen,facecolor='#ee8866',alpha=.8,label='Sensor max envelope'))
ax.set(xlim=(-1,19),ylim=(-28.5,1.5),xlabel='X (mm)',ylabel='Y (mm)',title='Film sensor / separator clearance study\nNOT a released or printable assembly')
ax.set_aspect('equal');ax.grid(alpha=.2);ax.legend(loc='lower left');fig.tight_layout();fig.savefig(O/'film-slot-separator-review.png',dpi=150);plt.close(fig)
r={'status':'SLOT_CANDIDATE_NOT_ADOPTED','source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'slot_center_xy_mm':[9,-13.5],'slot_size_xy_mm':[4.7,26.4],'clearance_to_max_envelope_xy_mm':[.3,.2],'valid_solid_count':len(new.Solids()),'removed_volume_mm3':old.Volume()-new.Volume(),'sensor_overlap_mm3':new.intersect(film).Volume(),'minimum_nominal_end_web_mm':min(.2-(-.3),-26.7-(-27.2)),'limits':['End webs are only0.5mm wide and0.3mm thick; CAD connectivity does not establish printability or strength.','Opening removes physical insulation over this strip; sensor film does not cover exposed leads or joints. Separate insulation and strain relief must be designed.','No adhesive, wire, solder-joint or placement tolerance envelope.','No required cell contact pressure or sensor thermal lag established.','No case, PCB, BOM or print-manifest adoption.']}
(O/'film-slot-separator-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
