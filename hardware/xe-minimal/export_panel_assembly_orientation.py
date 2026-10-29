"""Export terminal positions in explicit board coordinates for assembly review."""
from pathlib import Path
import json,hashlib,csv
import pcbnew as k,wx
app=wx.App(False)
p=Path(__file__).resolve().parent/'electrical-panel-candidate-v3';board=p/'panel.kicad_pcb';out=p/('fabrication-review-'+hashlib.sha256(board.read_bytes()).hexdigest()[:12]);b=k.LoadBoard(str(board));rows=[]
for f in b.GetFootprints():
 ref=f.GetReference()
 if not ref.startswith(tuple(f'P{n}_' for n in range(1,7))):continue
 local_ref=ref.split('_',1)[1]
 if local_ref=='J3' or local_ref.startswith('TP'):continue
 center=f.GetPosition();pins=[]
 for pad in f.Pads():
  number=pad.GetNumber()
  if not number:continue
  pos=pad.GetPosition();pins.append({'number':number,'net':pad.GetNetname(),'x_mm':k.ToMM(pos.x),'y_board_mm':k.ToMM(pos.y),'y_position_csv_mm':-k.ToMM(pos.y)})
 rows.append({'reference':ref,'value':f.GetValue(),'side':'bottom' if f.IsFlipped() else 'top','x_mm':k.ToMM(center.x),'y_board_mm':k.ToMM(center.y),'y_position_csv_mm':-k.ToMM(center.y),'kicad_orientation_degrees':f.GetOrientationDegrees(),'terminals':pins,'orientation_anchor':next((v for v in pins if v['number'] in ('1','A1')),None)})
rows.sort(key=lambda r:r['reference'])
with (out/'positions-assembly-review.csv').open() as f:positions={r['Ref']:r for r in csv.DictReader(f)}
assert set(positions)=={r['reference'] for r in rows}
for r in rows:
 v=positions[r['reference']];assert abs(float(v['PosX'])-r['x_mm'])<.000001 and abs(float(v['PosY'])-r['y_position_csv_mm'])<.000001 and v['Side']==r['side']
 assert abs((float(v['Rot'])-r['kicad_orientation_degrees']+180)%360-180)<.000001
result={'status':'TERMINAL_COORDINATE_REVIEW_NOT_ASSEMBLER_ROTATION_APPROVAL','source_pcb_sha256':hashlib.sha256(board.read_bytes()).hexdigest(),'component_count':len(rows),'coordinate_convention':'Board X right, board Y down, viewed from top; both sides use same XY frame. Position CSV Y is negated. No bottom mirroring applied.','placement_csv_center_side_rotation_match':True,'components':rows,'limitations':['Pin numbers reflect design footprint; supplier tape orientation and physical pin-1 marking require independent comparison.','Diode/LED/FET polarity cannot be inferred from pad number 1 alone.','Do not use top-view bottom coordinates as a bottom-view assembly drawing without mirroring.']}
(out/'assembly-terminal-orientation.json').write_text(json.dumps(result,indent=2)+'\n');print(len(rows),'positions and rotations matched')
