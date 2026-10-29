from pathlib import Path
import cadquery as cq,json,hashlib
p=Path(__file__).resolve().parent/'captive-nut-lowered-trial';f=p/'ASSEMBLY-NOT-RELEASED.step';s=cq.importers.importStep(str(f)).val().Solids()
outer=cq.Workplane('XY').box(23,25,14.81).edges('|Z').fillet(3.5).edges('#Z').fillet(2).val().translate((11.5,12.5,7.405));rows=[]
for x in [2.1,2.125,2.15,2.175,2.2,2.225,2.25,2.275,2.3]:
 a=s[83].translate((x-2.3,0,0));outside=a.distance(outer.Shells()[0]);nearest=min((a.distance(b),i+2) for i,b in enumerate(s[2:82]));rows.append(dict(x_mm=x,exterior_distance_mm=outside,component_distance_mm=nearest[0],component_index=nearest[1],minimum_margin_mm=min(outside,nearest[0])))
best=max(rows,key=lambda r:r['minimum_margin_mm']);r=dict(status='NOMINAL_POSITION_SCREEN_NOT_CASE_VALIDATION',step_sha256=hashlib.sha256(f.read_bytes()).hexdigest(),samples=rows,best_sample=best,limitations=['Left screw envelope only; carrier and lid not relocated','No production tolerance or structural qualification'])
(p/'screw-position-screen.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
