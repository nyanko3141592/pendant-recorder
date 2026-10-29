from pathlib import Path
import pcbnew as k, wx, hashlib,json,subprocess
app=wx.App(False)
w=Path(__file__).resolve().parent; root=w.parents[2]
src=root/'hardware/xe-minimal/preorder-20261029/usb-3313-width-trial.kicad_pcb'
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
rows=[]
for label,thickness in [('min',.7),('nominal',.8),('max',.9)]:
 b=k.LoadBoard(str(src));b.GetDesignSettings().SetBoardThickness(k.FromMM(thickness))
 pcb=w/f'board-thickness-{label}.kicad_pcb';k.SaveBoard(str(pcb),b)
 step=w/f'board-thickness-{label}.step'
 r=subprocess.run([cli,'pcb','export','step','--force','--board-only','--output',str(step),str(pcb)],text=True,capture_output=True)
 (w/f'board-thickness-{label}.log').write_text(r.stdout+r.stderr);assert r.returncode==0,r.stderr
 rows.append({'label':label,'finished_thickness_mm':thickness,'pcb':pcb.name,'step':step.name,'step_sha256':hashlib.sha256(step.read_bytes()).hexdigest()})
out={'status':'MECHANICAL_TOLERANCE_TRIAL_NOT_FABRICATION','source_pcb':str(src.relative_to(root)),'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'supplier_finished_thickness_mm':[.7,.8,.9],'trials':rows,'limitations':['General thickness changed only for mechanical exports; layer stackup remains nominal candidate','No components, solder or dimensional fabrication XY tolerance included','Existing enclosure U1 and U11 models not qualified; no assembly fit claim'],'release_allowed':False}
(w/'board-thickness-trials.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
