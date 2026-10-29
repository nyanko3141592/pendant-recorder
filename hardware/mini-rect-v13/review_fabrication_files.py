"""Independent parser screen, not fabricator DFM approval. Requires gerbonara."""
from pathlib import Path
import sys
from gerbonara import LayerStack
import json,hashlib,warnings,importlib.metadata
P=Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).resolve().parent/'fabrication-review'
with warnings.catch_warnings(record=True) as caught:
 warnings.simplefilter('always');s=LayerStack.open(P/'gerber')
 polygons=list(s.outline_polygons());assert len(polygons)==1
 lines=polygons[0];xs=[v for o in lines for v in (o.x1,o.x2)];ys=[v for o in lines for v in (o.y1,o.y2)]
 assert abs(max(xs)-min(xs)-21)<1e-6 and abs(max(ys)-min(ys)-23)<1e-6
 copper=[key for key in s.graphic_layers if key[1]=='copper'];assert len(copper)==6
 drills=[]
 for d in s.drill_layers:
  function=next(c for c in d.comments if 'TF.FileFunction' in c)
  drills.append({'file':d.original_path.name,'objects':len(d.objects),'file_function_header':function,'parser_plating':d.is_plated_tristate})
 assert sorted(d['objects'] for d in drills)==[6,114]
 for side in ['top','bottom']:(P/f'{side}-gerber-preview.svg').write_text(str(s.to_pretty_svg(side=side,margin=1)))
r={'status':'INDEPENDENT_PARSE_AND_DIMENSION_SCREEN_PASS_NOT_DFM_APPROVAL','parser_version':importlib.metadata.version('gerbonara'),'outline_loops':len(polygons),'outline_segments':len(lines),'centerline_extent_mm':[21,23],'copper_layers':copper,'drills':drills,'warnings':list(dict.fromkeys(str(w.message) for w in caught)),'inputs':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in (P/'gerber').iterdir() if p.is_file()},'limitations':['Drill plating parser returns unknown; explicit KiCad file-function header recorded separately','Rounded aperture macro warns about unused parameters; rendered output still requires fabricator verification','No pad-to-drill registration metric, connectivity, impedance or paste inspection claim','Preview files generated only; this script does not perform visual inspection']}
(P/'independent-parse-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r['status'])
