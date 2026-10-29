"""Define provisional process-feature envelopes; no tool-sweep qualification."""
from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess,hashlib
app=wx.App(False);p=Path(__file__).resolve().parent/'electrical-panel-candidate-v3';target=p/'panel.kicad_pcb';backup=p/'pre-feature-courtyards.kicad_pcb';assert not backup.exists();shutil.copyfile(target,backup);b=k.LoadBoard(str(target));rows=[]
for f in b.GetFootprints():
 ref=f.GetReference()
 if not ref.startswith(('TOOL','PERF','FID')):continue
 pads=list(f.Pads());radius=1.5 if ref.startswith('FID') else 1.25 if ref.startswith('TOOL') else .35
 centers={(pad.GetPosition().x,pad.GetPosition().y) for pad in pads}
 layers=[k.F_CrtYd,k.B_CrtYd] if not ref.startswith('FID') else [k.B_CrtYd if ref.endswith('B') else k.F_CrtYd]
 for x,y in centers:
  for layer in layers:
   s=k.PCB_SHAPE(f);s.SetShape(k.SHAPE_T_CIRCLE);s.SetLayer(layer);s.SetWidth(50000);s.SetCenter(k.VECTOR2I(x,y));s.SetEnd(k.VECTOR2I(x+round(radius*1e6),y));f.AddNative(s);s.thisown=False
 rows.append({'ref':ref,'radius_mm':radius,'center_count':len(centers),'layers':[b.GetLayerName(v) for v in layers]})
k.SaveBoard(str(target),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(target),'--format','json','--severity-all','-o',str(p/'feature-courtyard-drc.json')],check=True)
r=json.loads((p/'feature-courtyard-drc.json').read_text());(p/'feature-courtyard-review.json').write_text(json.dumps({'status':'PROVISIONAL_FEATURE_ENVELOPES_NOT_PROCESS_QUALIFICATION','source_pcb_sha256':hashlib.sha256(backup.read_bytes()).hexdigest(),'panel_sha256':hashlib.sha256(target.read_bytes()).hexdigest(),'envelopes':rows,'violations':r['violations'],'unconnected_items':r['unconnected_items'],'limitations':['Fiducial radius 1.5 mm follows previous optical envelope proposal.','Tool hole radius 1.25 mm and perforation radius 0.35 mm are layout screening assumptions, not actual fixture or cutting-tool envelopes.','Courtyard checks do not establish fracture load, clamp clearance or burr tolerance.']},indent=2)+'\n');print('violations',len(r['violations']),'open',len(r['unconnected_items']))
