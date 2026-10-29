from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);P=Path(__file__).resolve().parent;D=P/'film-single-carrier-trial';src=D/'panel.kicad_pcb';b=k.LoadBoard(str(src));geometry=P/'single-carrier-rounded-edge-geometry.json';r=json.loads(geometry.read_text())
for o in list(b.GetDrawings()):
 if o.GetLayer()==k.Edge_Cuts:b.RemoveNative(o)
def vec(v):return k.VECTOR2I(*(round(x*1e6) for x in v))
for item in r['edges']:
 e=k.PCB_SHAPE(b);e.SetLayer(k.Edge_Cuts);e.SetWidth(50000)
 if item['type']=='line':e.SetShape(k.SHAPE_T_SEGMENT);e.SetStart(vec(item['start_mm']));e.SetEnd(vec(item['end_mm']))
 else:e.SetShape(k.SHAPE_T_ARC);e.SetArcGeometry(vec(item['start_mm']),vec(item['mid_mm']),vec(item['end_mm']))
 b.AddNative(e);e.thisown=False
out=D/'panel-rounded.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:(D/('panel-rounded'+ext)).write_bytes((D/('panel'+ext)).read_bytes())
(D/'rounded-outline-review.json').write_text(json.dumps({'status':'ROUNDED_OUTLINE_SAVED_FILL_CANDIDATE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'geometry_sha256':hashlib.sha256(geometry.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'edge_primitives':len(r['edges']),'limits':['No supplier tool confirmation, cutting tolerance or fixture qualification.','Existing unit zone fills preserved; refill comparison and DRC pending.']},indent=2)+'\n')
