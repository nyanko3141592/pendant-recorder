from pathlib import Path
import wx,pcbnew as k,json,hashlib,shutil,subprocess,collections
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'usb-3313-width-trial.kicad_pcb';b=k.LoadBoard(str(src));rows=[]
for z in b.Zones():
 if z.GetIsRuleArea() or z.GetNetname()!='/GND':continue
 old=z.Outline().Format();z.Outline().RemoveAllContours();z.Outline().NewOutline()
 for x,y in [(.3,-.2),(27.2,-.2),(27.2,26.7),(.3,26.7)]:z.Outline().Append(k.FromMM(x),k.FromMM(y))
 rows.append({'layer':b.GetLayerName(z.GetLayer()),'old_polygon':old,'new_bounds_mm':[.3,27.2,-.2,26.7]})
out=w/'expanded-ground-trial.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--refill-zones','--save-board','--schematic-parity','--severity-all','--format','json','-o',str(w/'expanded-ground-trial-drc.json'),str(out)],check=True)
d=json.loads((w/'expanded-ground-trial-drc.json').read_text());types=collections.Counter(v['type'] for v in d['violations']);r={'zones':rows,'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'types':dict(types),'unconnected':len(d['unconnected_items']),'parity':len(d['schematic_parity']),'release_allowed':False};(w/'expanded-ground-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
