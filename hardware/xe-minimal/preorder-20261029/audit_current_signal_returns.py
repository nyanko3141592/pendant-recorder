from pathlib import Path
import pcbnew as k,wx,ast,json,math,hashlib,collections
app=wx.App(False);w=Path(__file__).resolve().parent
module=ast.parse((w.parent/'audit_hw_v1_4_route_quality.py').read_text());node=next(n for n in module.body if isinstance(n,ast.FunctionDef) and n.name=='reference');exec(compile(ast.Module(body=[node],type_ignores=[]),'<sampler>','exec'))
import sys
p=w/(sys.argv[1] if len(sys.argv)>1 else 'usb-3313-width-trial.kicad_pcb');b=k.LoadBoard(str(p));old=k.LoadBoard(str(w.parent/'costdown/HW-V1.4-EVT-4LAYER-27P5/route/hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb'))
names=['/USB_DP','/USB_DM','/PDM_CLK','/PDM_CLK_MCU','/PDM_DATA','/SD_CLK_MCU','/SD_CLK','/SD_MOSI','/SD_MISO','/SD_CS_N']
rows={}
for n in names:
 lengths=collections.defaultdict(float)
 for t in b.GetTracks():
  if t.GetNetname()==n and not isinstance(t,k.PCB_VIA):lengths[b.GetLayerName(t.GetLayer())]+=k.ToMM(t.GetLength())
 rows[n]=dict(lengths)
out={'source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'before':reference(old,names),'current':reference(b,names),'route_length_by_layer_mm':rows,'limitations':['Outer centerline samples only; copper presence is not connected return proof','Inner signal routes require separate review','Via antipads can explain localized missing reference; not all missing samples are equal'],'release_allowed':False}
for item in out['current'].values():
 if item['outer_route_mm']==0:
  item['continuous_reference_pass']=False;item['coverage_status']='NO_OUTER_ROUTE_CANNOT_CERTIFY'
(w/(p.stem+'-signal-returns.json')).write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({n:{'before_missing_mm':out['before'][n]['missing_centerline_reference_mm'],'current_missing_mm':out['current'][n]['missing_centerline_reference_mm'],'layer_lengths_mm':rows[n]} for n in names},indent=2))
