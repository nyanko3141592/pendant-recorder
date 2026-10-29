"""Candidate placement envelope handoff, explicitly not production geometry."""
from pathlib import Path
import json,hashlib,sys,wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
src=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else P/'charger-packing-candidate.kicad_pcb'
b=k.LoadBoard(str(src));old={p['ref']:p for p in json.loads((P.parent/'mini-rect-v12/placement.json').read_text())}
rows=[]
for f in b.GetFootprints():
 ref=f.GetReference();q=f.GetBoundingBox(False,False)
 # For the two acoustic neighbours, exclude courtyard/annotation from solids.
 # Retain Fab stroke bounds AND all pad bounds, with the old conservative height.
 if ref in ['R13','Q3']:
  boxes=[g.GetBoundingBox() for g in f.GraphicalItems() if g.GetLayerName() in ['F.Fab','B.Fab'] and isinstance(g,k.PCB_SHAPE)] + [p.GetBoundingBox() for p in f.Pads()]
  q=boxes[0]
  for bb in boxes[1:]:q.Merge(bb)
 if ref=='J4':height=1.68;basis='DM3D-SF catalogue max 1.55+0.13; solder/card qualification pending'
 elif ref in ['R29','R30']:height=.6;basis='Provisional resistor envelope matching retained passives'
 else:height=old[ref]['height'];basis='Retained V12 conservative envelope, not manufacturer maximum qualification'
 rows.append(dict(ref=ref,x_mm=k.ToMM(q.GetX()+q.GetWidth()/2),y_mm=k.ToMM(q.GetY()+q.GetHeight()/2),origin_x_mm=k.ToMM(f.GetPosition().x),origin_y_mm=k.ToMM(f.GetPosition().y),w_mm=k.ToMM(q.GetWidth()),d_mm=k.ToMM(q.GetHeight()),height_mm=height,side='B' if f.IsFlipped() else 'F',rotation_deg=f.GetOrientationDegrees(),height_basis=basis,xy_basis='Fab shapes plus pad bounding union; excludes courtyard/text; solder spread unqualified' if ref in ['R13','Q3'] else 'Full library bounding rectangle including courtyard'))
ports=[]
for f in b.GetFootprints():
 if f.GetReference()!='U8':continue
 for pad in f.Pads():
  if pad.GetAttribute()==k.PAD_ATTRIB_NPTH:
   ports.append(dict(ref='U8',x_mm=k.ToMM(pad.GetPosition().x),y_mm=k.ToMM(pad.GetPosition().y),drill_x_mm=k.ToMM(pad.GetDrillSize().x),drill_y_mm=k.ToMM(pad.GetDrillSize().y),purpose='PCB microphone acoustic opening; case bore/gasket still to design'))
front=max(x['height_mm'] for x in rows if x['side']=='F');back=max(x['height_mm'] for x in rows if x['side']=='B')
# Preserve comparison stack assumptions; do not infer a finished enclosure.
board_bottom=1.4+6+.5+back
board_thickness=k.ToMM(b.GetDesignSettings().GetBoardThickness())
minimum=board_bottom+board_thickness+front+.2+.8
result=dict(status='CANDIDATE_ENVELOPES_NOT_PRINT_OR_ORDER_RELEASE',source_board=str(src),source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),board_mm=[21,23,board_thickness],acoustic_ports=ports,parts=sorted(rows,key=lambda x:x['ref']),stack=dict(front_height_mm=front,back_height_mm=back,board_bottom_z_mm=round(board_bottom,3),planar_case_height_mm=round(minimum,3),margin_to_15_mm=round(15-minimum,3)),limitations=['XY rectangles include pad/library artwork; not exact body solids','Stack is planar conservative envelope arithmetic, not 3D interference validation','No qualified harness, battery swelling, solder height, latch, gasket or printing tolerances','Previous V12 case/PCB dummy is not compatible evidence for this placement','Mic bore must be exported from this PCB and aligned before case release'])
src.with_suffix('.mechanical-handoff.json').write_text(json.dumps(result,indent=2)+'\n')
print('Parts',len(rows),'stack',result['stack'])
