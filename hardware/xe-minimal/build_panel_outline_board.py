"""Mechanical outline transfer only, no electrical units or production release."""
from pathlib import Path
import json,hashlib,subprocess
import pcbnew as k,wx
app=wx.App(False);p=Path(__file__).resolve().parent;s=p/'panel-edge-geometry.json';r=json.loads(s.read_text());b=k.BOARD();b.GetDesignSettings().SetBoardThickness(826400)
def vec(v):return k.VECTOR2I(*(round(x*1e6) for x in v))
for item in r['edges']:
 e=k.PCB_SHAPE(b);e.SetLayer(k.Edge_Cuts);e.SetWidth(50000)
 if item['type']=='line':e.SetShape(k.SHAPE_T_SEGMENT);e.SetStart(vec(item['start_mm']));e.SetEnd(vec(item['end_mm']))
 else:e.SetShape(k.SHAPE_T_ARC);e.SetArcGeometry(vec(item['start_mm']),vec(item['mid_mm']),vec(item['end_mm']))
 b.AddNative(e);e.thisown=False
for i,hole in enumerate(r['tooling_holes']):
 f=k.FOOTPRINT(b);f.SetReference(f'TOOL{i+1}');f.Reference().SetVisible(False);f.Value().SetVisible(False);f.SetAttributes(k.FP_EXCLUDE_FROM_BOM|k.FP_EXCLUDE_FROM_POS_FILES)
 pad=k.PAD(f);pad.SetAttribute(k.PAD_ATTRIB_NPTH);pad.SetShape(k.PAD_SHAPE_CIRCLE);size=round(hole['diameter_mm']*1e6);pad.SetSize(k.VECTOR2I(size,size));pad.SetDrillSize(k.VECTOR2I(size,size));pad.SetLayerSet(k.LSET.AllCuMask());pad.SetPosition(vec(hole['center_mm']));f.AddNative(pad);pad.thisown=False;b.AddNative(f);f.thisown=False
out=p/'panel-outline-study';out.mkdir(exist_ok=True);target=out/'panel-outline-study.kicad_pcb';k.SaveBoard(str(target),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(target),'--format','json','--severity-all','-o',str(out/'drc.json')],check=True)
d=json.loads((out/'drc.json').read_text());assert not [v for v in d['violations'] if v['type']=='board_edge'],d['violations']
(out/'review.json').write_text(json.dumps({'status':'OUTLINE_ONLY_NOT_ELECTRICAL_PANEL','geometry_source_sha256':hashlib.sha256(s.read_bytes()).hexdigest(),'edge_primitives':len(r['edges']),'tooling_holes':len(r['tooling_holes']),'violations':d['violations'],'warning':'Default empty-board rules only. No units, copper, mask, fiducials, perforations or qualified stackup.'},indent=2)+'\n');print('violations',len(d['violations']))
