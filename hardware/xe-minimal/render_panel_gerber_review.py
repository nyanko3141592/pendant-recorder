"""Render fabrication Gerbers independently of KiCad PCB renderer."""
from pathlib import Path
import hashlib,json
from importlib.metadata import version
from gerbonara import GerberFile
import cairosvg
from PIL import Image,ImageDraw
p=Path(__file__).resolve().parent/'electrical-panel-candidate-v3/fabrication-review-ac715808f9dc'
out=p/'gerber-render-review';out.mkdir(exist_ok=True)
rows=[]
for f in sorted((p/'gerbers').iterdir()):
 if f.suffix=='.gbrjob':continue
 g=GerberFile.open(f)
 svg=str(g.to_svg(force_bounds=((-1,-78),(91,1)),fg='#163b5c',bg='white'))
 dest=out/(f.stem+'.svg');dest.write_text(svg)
 png=dest.with_suffix('.png');cairosvg.svg2png(bytestring=svg.encode(),write_to=str(png),output_width=520,output_height=447,background_color="white")
 rows.append({'file':f.name,'sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'object_count':len(g.objects),'bounds_mm':g.bounding_box(),'png':png.name})
canvas=Image.new('RGB',(520*4,620*4),'#eeeeee');draw=ImageDraw.Draw(canvas)
for i,row in enumerate(rows):
 x=(i%4)*520;y=(i//4)*620
 canvas.paste(Image.open(out/row['png']),(x,y+30));draw.text((x+8,y+8),row['file'],fill='black')
canvas.save(out/'all-layers.png')
(out/'render-review.json').write_text(json.dumps({'status':'RENDERED_NOT_FULL_CAM_APPROVAL','renderer':{'gerbonara':version('gerbonara'),'cairosvg':version('cairosvg')},'common_bounds_mm':[[-1,-78],[91,1]],'layers':rows,'limitations':['Images use common top-view export coordinates; bottom layers are not mirrored for assembly.','Rendering is not an electrical connectivity, clearance, stencil or fabrication-process qualification.']},indent=2)+'\n')
print('Rendered',len(rows),'Gerber layers')
