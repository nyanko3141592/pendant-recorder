from pathlib import Path
import json,hashlib
D=Path(__file__).resolve().parent;lib=D/'TPSLimitTrial.pretty';lib.mkdir(exist_ok=True)
name='TPS22950_YBH0006-C02_SMD_TI_4226594A'
lines=[f'(footprint "{name}" (version 20241229) (generator "pcbnew") (layer "F.Cu")', '(descr "TI 4226594/A 03/2021 preferred solder-mask-defined example; process qualification pending")','(attr smd)', '(property "Reference" "REF**" (at 0 -1.1) (layer "F.SilkS") (effects (font (size 0.6 0.6) (thickness 0.1))))','(property "Value" "TPS22950YBHR" (at 0 1.1) (layer "F.Fab") (effects (font (size 0.5 0.5) (thickness 0.1))))']
for row,y in zip('ABC',[-.4,0,.4]):
 for col,x in [(1,-.2),(2,.2)]:
  lines.append(f'(pad "{row}{col}" smd circle (at {x} {y}) (size 0.3 0.3) (layers "F.Cu" "F.Paste" "F.Mask") (solder_mask_margin -0.05) (solder_paste_margin -0.045))')
lines += ['(fp_rect (start -0.363 -0.563) (end 0.363 0.563) (stroke (width 0.05) (type default)) (layer "F.Fab"))','(fp_rect (start -0.62 -0.82) (end 0.62 0.82) (stroke (width 0.05) (type default)) (layer "F.CrtYd"))','(fp_circle (center -0.48 -0.68) (end -0.43 -0.68) (stroke (width 0.05) (type default)) (fill none) (layer "F.Fab"))',')']
p=lib/(name+'.kicad_mod');p.write_text('\n'.join(lines)+'\n')
review={'status':'FOOTPRINT_CANDIDATE_NOT_PROCESS_QUALIFIED','source':'evidence/TPS22950-SLVSFJ2B.pdf','drawing':'YBH0006-C02 4226594/A 03/2021 pp21-23','visual_review':'page22 manufacturer land pattern rendered and inspected','package_max_mm':[.726,1.126,.4],'pitch_mm':.4,'copper_diameter_mm':.3,'mask_opening_diameter_mm':.2,'paste_diameter_mm':.21,'paste_stencil_reference_mm':.075,'nominal_copper_gap_mm':.1,'nominal_mask_web_mm':.2,'courtyard':'engineering margin; not manufacturer dimension','fp_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'remaining':['Assembly acceptance for 0.4mm WCSP and SMD mask registration','Stencil compatibility with other components; 0.075mm reference may require process changes','Pad-pair clearance rule review before PCB placement','Layout escape and power pin widths','Package orientation and pinmap check against schematic after placement']}
(D/'tps22950-land-review.json').write_text(json.dumps(review,indent=2)+'\n');print(p)
