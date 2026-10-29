"""Material-independent local fit coupons, not a final enclosure or G-code."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent/'home-fit-coupons';O.mkdir(exist_ok=True)
items=[];a=cq.Assembly(name='home_fit_coupons')
dummy=cq.Workplane('XY').box(24,27,.8264,centered=(False,False,False)).val()
for i,gap in enumerate([.25,.30,.40]):
 w,d=24+2*gap+1.6,27+2*gap+1.6
 outer=cq.Workplane('XY').box(w,d,4,centered=(False,False,False)).edges('|Z').fillet(1.5)
 inner=cq.Workplane('XY').box(24+2*gap,27+2*gap,4,centered=(False,False,False)).edges('|Z').fillet(.7).translate((.8,.8,1))
 tray=outer.cut(inner).val();assert tray.isValid()and len(tray.Solids())==1
 overlap=tray.intersect(dummy.translate((.8+gap,.8+gap,1))).Volume();assert overlap<1e-8
 name=f'tray-gap-{round(gap*100):02d}';offset=(i*32,0,0)
 for ext in ['stl','step']:cq.exporters.export(tray,str(O/f'{name}.{ext}'),tolerance=.01,angularTolerance=.05)
 a.add(tray,name=name,loc=cq.Location(cq.Vector(*offset)))
 items.append({'name':name,'inner_clearance_each_side_mm':gap,'outer_mm':[w,d,4],'floor_mm':1,'wall_mm':.8,'outer_radius_mm':1.5,'inner_radius_mm':.7,'nominal_square_dummy_overlap_mm3':overlap,'plate_offset_mm':offset})
for ext in ['stl','step']:cq.exporters.export(dummy,str(O/f'pcb-size-dummy.{ext}'),tolerance=.01,angularTolerance=.05)
a.add(dummy,name='pcb_size_dummy',loc=cq.Location(cq.Vector(96,0,0)));a.export(str(O/'coupon-layout.step'))
items.append({'name':'pcb-size-dummy','size_mm':[24,27,.8264],'plate_offset_mm':[96,0,0]})
r={'status':'HOME_PRINTER_FIT_EXPERIMENT_NOT_PRODUCTION','printer_reported_by_user':'Bambu Lab A1 mini','nozzle':'0.4mm (user 4mm interpreted)','filament':'PLA; brand unspecified','items':items,'units':'mm','print_orientation':'All exported parts have flat bottom at Z=0; tray openings upward','interpretation':['Printed dummy is a handling aid, not a calibrated PCB gauge','Measure real tray cavity and wall with calipers; record actual dimensions','Fit with actual PCB or a measured 24x27mm gauge is required to qualify clearance','Layer quantization affects dummy thickness; measure rather than assume0.8264mm','Coupon floor and wall geometry are simplified and omit connector, battery and acoustic duct'],'printer_command_sent':False,'files_sha256':{p.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in O.glob('*')if p.suffix in ['.step','.stl']}}
(O/'review.json').write_text(json.dumps(r,indent=2)+'\n')
(O/'使い方.txt').write_text('A1 mini用 寸法確認試験片（ケース完成品ではありません）\n\nSTLの単位はmmです。Bambu Studioで拡大縮小せず読み込み、トレーの開口を上にしてください。\nPLA・0.4mmノズルを前提に、積層0.16mmで試します。銘柄未指定のためGeneric PLAは仮設定です。\ntray-gap-25/30/40は、24×27mmの基板に対して片側0.25/0.30/0.40mmの隙間です。\n印刷後、内寸・壁厚・反りと使ったフィラメント/ノズル/積層ピッチを記録してください。\n同梱のpcb-size-dummyは形状確認用です。印刷誤差があるため、実基板の代わりに合格判定へ使わないでください。\n電池、コネクター、マイク筒、接着強度はこの試験片では確認できません。\n')
print(O)
