from pathlib import Path
import json,shutil,subprocess,pcbnew as k,wx
app=wx.App(False);D=Path(__file__).resolve().parent/'tps22950-placement';src='out-routed';dst='resistor-scan'
for ext in ['kicad_sch','kicad_pro','kicad_dru']:shutil.copyfile(D/(src+'.'+ext),D/(dst+'.'+ext))
b=k.LoadBoard(str(D/(src+'.kicad_pcb')))
# Remove only the newly added U13 ground route; retain original ground network.
a=k.LoadBoard(str(D/'input-routed.kicad_pcb'));before={t.m_Uuid.AsString()for t in a.GetTracks()}
for t in list(b.GetTracks()):
 if t.GetNetname()=='/USB_ILIM_SET' or (t.GetNetname()=='/GND' and t.m_Uuid.AsString() not in before):b.RemoveNative(t)
f=next(f for f in b.GetFootprints()if f.GetReference()=='R44');rows=[];best=None
for x,y in [(16.1,.85),(16.4,.85),(15.8,2.7),(16.3,2.7),(15.8,3.4),(16.5,3.3),(13,2.8),(12.6,2.5),(15.7,1.8)]:
 for angle in [0,90,180,270]:
  f.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));f.SetOrientationDegrees(angle);k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(D/(dst+'.kicad_pcb')),b)
  subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(D/(dst+'.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(D/(dst+'-drc.json'))],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  q=json.loads((D/(dst+'-drc.json')).read_text());hard=[v for v in q['violations']if v['type']not in ['track_dangling','via_dangling']];row={'x':x,'y':y,'angle':angle,'hard':len(hard)};rows.append(row)
  if best is None or row['hard']<best['hard']:
   best=row;shutil.copyfile(D/(dst+'.kicad_pcb'),D/'resistor-best.kicad_pcb');shutil.copyfile(D/(dst+'-drc.json'),D/'resistor-best-drc.json');print(best,flush=True)
for ext in ['kicad_sch','kicad_pro','kicad_dru']:shutil.copyfile(D/(src+'.'+ext),D/('resistor-best.'+ext))
(D/'resistor-search.json').write_text(json.dumps({'best':best,'candidates':rows},indent=2)+'\n')
