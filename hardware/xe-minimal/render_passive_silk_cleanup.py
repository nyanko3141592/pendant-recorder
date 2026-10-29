"""Visual proposal only; original production Gerbers remain untouched."""
from pathlib import Path
import json,csv,hashlib
from gerbonara import GerberFile
import cairosvg
p=Path(__file__).resolve().parent;d=p/'electrical-panel-candidate-v3/fabrication-review-ac715808f9dc';out=d/'silk-cleanup-proposal';out.mkdir(exist_ok=True)
with (p/'bom.csv').open() as f:rows=list(csv.DictReader(f))
allowed={'Resistor_SMD:R_0402_1005Metric','Resistor_SMD:R_0603_1608Metric','Capacitor_SMD:C_0402_1005Metric','Capacitor_SMD:C_0603_1608Metric'}
refs={f'P{n}_{r["Reference"]}' for n in range(1,7) for r in rows if r['Footprint'] in allowed and r['Reference'].startswith(('R','C'))}
results=[]
for name in ['panel-F_Silkscreen.gto','panel-B_Silkscreen.gbo']:
 src=d/'gerbers'/name;g=GerberFile.open(src);before=len(g.objects);removed=[v for v in g.objects if (v.attrs if isinstance(v.attrs,dict) else {}).get('.C',('',))[0] in refs];g.objects=[v for v in g.objects if (v.attrs if isinstance(v.attrs,dict) else {}).get('.C',('',))[0] not in refs]
 svg=str(g.to_svg(force_bounds=((-1,-78),(91,1)),fg='#163b5c',bg='white'));dest=out/(Path(name).stem+'.svg');dest.write_text(svg);cairosvg.svg2png(bytestring=svg.encode(),write_to=str(dest.with_suffix('.png')),output_width=1104,output_height=948,background_color='white')
 results.append({'source':name,'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'original_objects':before,'removed_passive_objects':len(removed),'retained_objects':len(g.objects)})
(out/'review.json').write_text(json.dumps({'status':'VISUAL_CLEANUP_PROPOSAL_NOT_APPLIED_TO_PCB_OR_GERBERS','eligible_refs':sorted(refs),'layers':results,'limitations':['Only library-identified unpolarized rectangular resistor/capacitor outlines suppressed in preview.','No Gerber output is generated or substituted; production source unchanged.','Other thin shapes, clipped fragments and pin-1/polarity marking adequacy remain unresolved.']},indent=2)+'\n');print(results)
