from pathlib import Path
import json,subprocess,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
results=[]
for index,(x,y,rot,back) in enumerate([(14.6,.75,0,True),(14.6,1.0,0,True),(13.7,.75,0,True),(16.5,16.75,90,False),(16.5,19,90,False)]):
 b=k.LoadBoard(str(P/'route-repair.kicad_pcb'));f=next(f for f in b.GetFootprints() if f.GetReference()=='R2')
 if (f.GetLayer()==k.B_Cu)!=back:f.Flip(f.GetPosition(),False)
 f.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));f.SetOrientationDegrees(rot)
 stem=f'r2-search-{index}';shutil.copy2(P/'route-repair.kicad_pro',P/(stem+'.kicad_pro'))
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(stem+'.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(P/(stem+'.kicad_pcb')),'--format','json','-o',str(P/(stem+'.json'))],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True)
 d=json.loads((P/(stem+'.json')).read_text());r=dict(stem=stem,position=[x,y],rotation=rot,back=back,violations=len(d['violations']),types=[v['type'] for v in d['violations']],unconnected=len(d['unconnected_items']));results.append(r);print(r,flush=True)
(P/'r2-position-search.json').write_text(json.dumps(results,indent=2)+'\n')
