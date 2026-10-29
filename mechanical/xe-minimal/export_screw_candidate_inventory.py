"""Read current KiCad geometry for case work; do not infer body height from courtyard."""
import pcbnew as k, wx, json, hashlib
from pathlib import Path
app=wx.App(False)
O=Path(__file__).resolve().parent
root=O.parents[1]
p=root/'hardware/xe-minimal/fixed-usb-limit-trial/screw-hole-trial/hole-18.1.kicad_pcb'
b=k.LoadBoard(str(p))
def xy(v):return [k.ToMM(v.x),k.ToMM(v.y)]
def box(r):return {'min_mm':[k.ToMM(r.GetX()),k.ToMM(r.GetY())],'max_mm':[k.ToMM(r.GetRight()),k.ToMM(r.GetBottom())]}
parts=[]
for f in sorted(b.GetFootprints(),key=lambda f:f.GetReference()):
 courtyard=[]
 for g in f.GraphicalItems():
  if g.GetLayer() in [k.F_CrtYd,k.B_CrtYd]:courtyard.append({'start_mm':xy(g.GetStart()),'end_mm':xy(g.GetEnd()),'shape':str(g.GetShape())})
 parts.append({'ref':f.GetReference(),'value':f.GetValue(),'footprint':str(f.GetFPID().GetLibItemName()),'position_mm':xy(f.GetPosition()),'rotation_deg':f.GetOrientationDegrees(),'side':'B' if f.IsFlipped() else 'F','courtyard_geometry':courtyard,'pads':[{'number':p.GetNumber(),'position_mm':xy(p.GetPosition()),'size_mm':xy(p.GetSize()),'net':p.GetNetname()} for p in f.Pads()],'models':[str(m.m_Filename) for m in f.Models()],'body_height_mm':None})
report={'status':'CURRENT_PCB_GEOMETRY_NOT_CASE_FIT','board_path':str(p.relative_to(root)),'pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'board_bbox_including_edge_stroke':box(b.GetBoardEdgesBoundingBox()),'board_thickness_mm':k.ToMM(b.GetDesignSettings().GetBoardThickness()),'outline_edges':[{'start_mm':xy(g.GetStart()),'end_mm':xy(g.GetEnd()),'shape':str(g.GetShape()),'stroke_width_mm':k.ToMM(g.GetWidth())} for g in b.GetDrawings() if g.GetLayer()==k.Edge_Cuts],'footprint_count':len(parts),'parts':parts,'limitations':['Courtyard is a placement boundary, not an exact component body.','Body heights, connector mating and original lead bending still require source-backed models.','This export does not prove assembled dimensions or collision-free assembly.']}
(O/'screw-candidate-board-inventory.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({k:report[k] for k in ['pcb_sha256','board_bbox_including_edge_stroke','board_thickness_mm','footprint_count']}))
