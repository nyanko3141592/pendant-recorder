"""Read actual film candidate PCB pads before generating resistance stimuli."""
from pathlib import Path
import pcbnew,json,hashlib,itertools,wx
app=wx.App(False)
R=Path(__file__).resolve().parents[2];p=R/'hardware/xe-minimal/film-integration-trial/pendant-xe-minimal.kicad_pcb'
b=pcbnew.LoadBoard(str(p));fp={x.GetReference():x for x in b.GetFootprints()}
expected={'R37':{'1':'/V3V3','2':'/BAT_TS'},'TH1':{'1':'/BAT_TS','2':'/GND'},'R38':{'1':'/V3V3','2':'/TS_COLD_REF'},'R39':{'1':'/TS_COLD_REF','2':'/GND'},'R40':{'1':'/V3V3','2':'/TS_HOT_REF'},'R41':{'1':'/TS_HOT_REF','2':'/GND'}}
actual={}
for ref,nets in expected.items():
 actual[ref]={'value':fp[ref].GetValue(),'pads':{pad.GetNumber():pad.GetNetname() for pad in fp[ref].Pads()}}
 assert actual[ref]['pads']==nets,(ref,actual[ref])
for ref,value in [('R37','100k 1%'),('R38','100k 1%'),('R39','20k 1%'),('R40','100k 1%'),('R41','7.5k 1%')]:assert actual[ref]['value']==value,(ref,actual[ref])
rows=[]
for label,bottom in [('cold',20000),('hot',7500)]:
 corners=[100000*a*bottom*c/(100000*d) for a,c,d in itertools.product((.99,1.01),repeat=3)]
 rows.append({'boundary':label,'ideal_sensor_resistance_ohm':bottom,'resistor_only_corner_range_ohm':[min(corners),max(corners)],'ideal_reference_V_at_assumed3p3V':3.3*bottom/(100000+bottom)})
r={'status':'FILM_PCB_RESISTIVE_STIMULUS_PLAN_NOT_THERMAL_QUALIFICATION','pcb_path':str(p.relative_to(R)),'pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'verified_divider_nets':actual,'boundaries':rows,'test_sequence':['Use battery emulator and current-limited bench supply before any real battery.','Start with 10kohm at TH1; sweep upward through cold boundary and back.','Return to 10kohm; sweep downward through hot boundary and back.','Check sensor open/short and startup/brownout separately; record charge current and guard gate.'],'limits':['Boundary ranges include only three independent 1% divider resistor errors.','Comparator offset, hysteresis, common-mode dependence, leakage and rail variation excluded.','These are sweep starting points, not acceptance temperatures or guaranteed switching resistances.','No measured data; sensor thermal coupling and cell protection unqualified.','Alternative NTCAFLEX is not adopted by this output.']}
(R/'docs/validation/xe-film-temperature-resistance-stimuli.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(actual,indent=2))
