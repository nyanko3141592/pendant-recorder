"""Provisional locating peg through related-model strain-relief hole."""
from pathlib import Path
import cadquery as cq,json,hashlib,math
O=Path(__file__).resolve().parent
files={'separator':'ntcaflex-trimmed-separator-trial.step','sensor':'ntcaflex-diagonal-positioned-reference.step','battery':'offset-pack-assembly-trial.step','board':'film-integration-integrated-board.step','lower':'ntcaflex-relocated-support-lower-trial.step'}
s={k:cq.importers.importStep(str(O/f)).val()for k,f in files.items()}
# Related model hole is source X=-8,Z=0; transformed at 120 degrees.
x=12.5-8*math.cos(math.radians(120));y=-5-8*math.sin(math.radians(120))
rows=[]
for diameter in (.5,.6):
 peg=cq.Workplane('XY').circle(diameter/2).extrude(.96).translate((x,y,-2.38)).val();a=s['separator'].fuse(peg).clean()
 checks={k:{'peg_overlap_mm3':peg.intersect(v).Volume(),'peg_gap_mm':peg.distance(v)}for k,v in s.items()if k!='separator'}
 row={'diameter_mm':diameter,'valid':a.isValid(),'solids':len(a.Solids()),'anchor_overlap_mm3':peg.intersect(s['separator']).Volume(),'checks':checks};rows.append(row)
 if diameter==.6:
  out=O/'ntcaflex-locator-separator-trial.step';cq.exporters.export(a,str(out));row['output_sha256']=hashlib.sha256(out.read_bytes()).hexdigest()
r={'status':'LOCATOR_TRIAL_NOT_RETENTION_APPROVAL','sources_sha256':{f:hashlib.sha256((O/f).read_bytes()).hexdigest()for f in files.values()},'peg_center_xy_mm':[x,y],'cases':rows,'limits':['Hole comes from related HH nominal model; GL hole diameter, position and tolerances not established.','Peg locates laterally only; axial pull-off and rotation are not restrained by a single uncapped circular peg.','0.5/0.6mm peg print strength and reproducibility unqualified.','Battery gap is nominal, excluding swelling and tolerance.','No thermal preload or complete sensor retention provided.']}
(O/'ntcaflex-locator-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
