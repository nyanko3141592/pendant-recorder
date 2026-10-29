"""Assembly panel packing study only: no routed tabs or fabrication approval."""
from pathlib import Path
import json,hashlib
p=Path(__file__).resolve().parent;a=json.loads((p/'active-design.json').read_text());board=p/a['board']
placements=[{'unit':r*3+c+1,'x_mm':5+c*26,'y_mm':7+r*29,'rotation_degrees':0,'board_size_mm':[24,27]} for r in range(2) for c in range(3)]
w,h=86,70
for u in placements:assert u['x_mm']>=5 and u['x_mm']+24<=w-5 and u['y_mm']>=5 and u['y_mm']+27<=h-5
r={'status':'PACKING_STUDY_NOT_PANEL_MANUFACTURING_DATA','source_pcb_sha256':hashlib.sha256(board.read_bytes()).hexdigest(),'panel_size_mm':[w,h],'units_per_panel':6,'nominal_route_channel_mm':2,'placements':placements,'edge_rails_mm':{'left':5,'right':5,'top':7,'bottom':7},'finished_product_board_unchanged_mm':[24,27],'not_designed':['Breakaway tabs, router paths, residual edge tolerance and depanelization forces','Fiducials/tooling holes and placement-side conventions','Component body/courtyard protrusion and nozzle access','Panel stiffness, rail support and double-sided reflow constraints','Order quantity, partially populated panel handling and five-unit cost'],'assumptions':['Rectangular board packing only; board origin is top-left in this drawing.','6 positions do not imply only 6 boards must be purchased; supplier panel minimums require separate costing.']}
(p/'assembly-panel-layout-study.json').write_text(json.dumps(r,indent=2)+'\n')
s=['<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="900" viewBox="-7 -10 100 90">','<rect x="-7" y="-10" width="100" height="90" fill="white"/>','<text x="0" y="-5" font-size="2.5">6-up panel packing study: 86 x 70 mm — NOT FOR FABRICATION</text>',f'<rect width="{w}" height="{h}" fill="#e8edf2" stroke="#34495e" stroke-width=".25"/>']
for u in placements:
 x,y=u['x_mm'],u['y_mm'];s.extend([f'<rect x="{x}" y="{y}" width="24" height="27" fill="white" stroke="#006cc8" stroke-width=".25"/>',f'<text x="{x+12}" y="{y+13}" text-anchor="middle" font-size="2.4">Unit {u["unit"]}</text>',f'<text x="{x+12}" y="{y+17}" text-anchor="middle" font-size="1.8">24 x 27 mm</text>'])
s+=['<text x="0" y="75" font-size="1.8">Grey: provisional carrier material. 2 mm channels shown by spacing only.</text>','<text x="0" y="78" font-size="1.8">Tabs, routing, tooling, component clearance and handling remain unresolved.</text>','</svg>'];(p/'assembly-panel-layout-study.svg').write_text('\n'.join(s))
print('6 positions / 86 x 70 mm packing study generated')
