"""Export terminal positions in explicit board coordinates for assembly review."""
from pathlib import Path
import json,hashlib,csv
import pcbnew as k,wx
app=wx.App(False)
p=Path(__file__).resolve().parent;a=json.loads((p/'active-design.json').read_text());board=p/a['board'];out=p/('fabrication-review-'+hashlib.sha256(board.read_bytes()).hexdigest()[:12]);b=k.LoadBoard(str(board));rows=[]
assert out.is_dir()
bom=p.parents[1]/'docs/procurement/xe-production-bom-2026-10-28.csv'
with bom.open(newline='') as stream:
 assembled={ref.strip() for item in csv.DictReader(stream) if item['route'].startswith('JLC_') for ref in item['references'].split(',') if ref.strip()}
assert len(assembled)==68
for f in b.GetFootprints():
 ref=f.GetReference()
 if ref not in assembled:continue
 center=f.GetPosition();pins=[]
 for pad in f.Pads():
  number=pad.GetNumber()
  if not number:continue
  pos=pad.GetPosition();pins.append({'number':number,'net':pad.GetNetname(),'x_mm':k.ToMM(pos.x),'y_board_mm':k.ToMM(pos.y),'y_position_csv_mm':-k.ToMM(pos.y)})
 rows.append({'reference':ref,'value':f.GetValue(),'side':'bottom' if f.IsFlipped() else 'top','x_mm':k.ToMM(center.x),'y_board_mm':k.ToMM(center.y),'y_position_csv_mm':-k.ToMM(center.y),'kicad_orientation_degrees':f.GetOrientationDegrees(),'terminals':pins,'orientation_anchor':next((v for v in pins if v['number'] in ('1','A1')),None)})
rows.sort(key=lambda r:r['reference'])
assert {r['reference'] for r in rows}==assembled
with (out/'positions-assembly-review.csv').open() as f:positions={r['Ref']:r for r in csv.DictReader(f)}
assert set(positions)=={r['reference'] for r in rows}
for r in rows:
 v=positions[r['reference']];assert abs(float(v['PosX'])-r['x_mm'])<.000001 and abs(float(v['PosY'])-r['y_position_csv_mm'])<.000001 and v['Side']==r['side']
 assert abs((float(v['Rot'])-r['kicad_orientation_degrees']+180)%360-180)<.000001
result={'status':'TERMINAL_COORDINATE_REVIEW_NOT_ASSEMBLER_ROTATION_APPROVAL','source_pcb_sha256':hashlib.sha256(board.read_bytes()).hexdigest(),'component_count':len(rows),'reference_source':'Production BOM references whose route starts with JLC_','excluded_non_jlc_features':['J3 programming pads','test pads','battery/case/cord final assembly'],'external_sensor_positions':0,'battery_temperature_sensor':'DTP401525-XE pack NTC through J2; no TH1','coordinate_convention':'Board X right, board Y down, viewed from top; both sides use same XY frame. Position CSV Y is negated. No bottom mirroring applied.','placement_csv_center_side_rotation_match':True,'components':rows,'limitations':['Pin numbers reflect design footprint; supplier tape orientation and physical pin-1 marking require independent comparison.','Diode/LED/FET polarity cannot be inferred from pad number 1 alone.','Do not use top-view bottom coordinates as a bottom-view assembly drawing without mirroring.']}
(out/'assembly-terminal-orientation.json').write_text(json.dumps(result,indent=2)+'\n');print(len(rows),'positions and rotations matched')
