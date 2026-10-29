from pathlib import Path
import json,shutil,subprocess,pcbnew as k,wx
app=wx.App(False);D=Path(__file__).resolve().parent/'tps22950-placement';base='pendant-xe-minimal';dst='scan'
for ext in ['kicad_sch','kicad_pro','kicad_dru']:shutil.copyfile(D/(base+'.'+ext),D/(dst+'.'+ext))
b=k.LoadBoard(str(D/(base+'.kicad_pcb')));f=next(f for f in b.GetFootprints()if f.GetReference()=='U13');f.Reference().SetTextSize(k.VECTOR2I(k.FromMM(.8),k.FromMM(.8)));rows=[];best=None
for x,y in [(12.8,.85),(13.3,.85),(13.8,.85),(14.3,.85),(14.8,.85),(13.3,1.3),(14.3,1.3),(13.3,2.6),(14.8,2.6)]:
 for angle in [0,90,180,270]:
  f.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));f.SetOrientationDegrees(angle);k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(D/(dst+'.kicad_pcb')),b)
  subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(D/(dst+'.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(D/'scan-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  q=json.loads((D/'scan-drc.json').read_text());hard=[v for v in q['violations']if v['type']not in ['track_dangling','via_dangling']];score=(len(hard),len(q['unconnected_items']),len(q['violations']));rows.append({'x':x,'y':y,'angle':angle,'score':score})
  if best is None or score<best['score']:
   best=rows[-1];shutil.copyfile(D/(dst+'.kicad_pcb'),D/'placement-best.kicad_pcb');shutil.copyfile(D/'scan-drc.json',D/'placement-best-drc.json');print(best,flush=True)
for ext in ['kicad_sch','kicad_pro','kicad_dru']:shutil.copyfile(D/(base+'.'+ext),D/('placement-best.'+ext))
(D/'placement-search.json').write_text(json.dumps({'best':best,'candidates':rows,'adopted':False},indent=2)+'\n')
