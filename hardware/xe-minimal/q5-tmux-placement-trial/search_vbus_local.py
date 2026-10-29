from pathlib import Path
import pcbnew as k,wx,json,subprocess,shutil,collections
app=wx.App(False);d=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');base=d/'vbus-local';b=k.LoadBoard(str(d/'cap-ground-route.kicad_pcb'))
for ext in ['kicad_pro','kicad_dru','kicad_sch']:shutil.copyfile(d/f'cap-ground-route.{ext}',base.with_suffix('.'+ext))
ledger=[]
for name,a,c,layer in [('cap',(6.954999,9.7675),(8.175,9.9975),k.B_Cu),('ic',(6.954999,9.7675),(8.175,9.017499),k.F_Cu)]:
 paths=[[a,c],[a,(a[0],c[1]),c],[a,(c[0],a[1]),c]]
 for delta in [.4,-.4,.8,-.8,1.2,-1.2]:
  y=(a[1]+c[1])/2+delta;x=(a[0]+c[0])/2+delta
  paths.extend([[a,(a[0],y),(c[0],y),c],[a,(x,a[1]),(x,c[1]),c]])
 for path in paths:
  added=[]
  for s,e in zip(path,path[1:]):
   t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(s[0]),k.FromMM(s[1])));t.SetEnd(k.VECTOR2I(k.FromMM(e[0]),k.FromMM(e[1])));t.SetWidth(k.FromMM(.15));t.SetLayer(layer);t.SetNet(b.FindNet('/VBUS'));b.AddNative(t);t.thisown=False;added.append(t)
  k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(base.with_suffix('.kicad_pcb')),b)
  subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(base.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(d/'vbus-local-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  q=json.loads((d/'vbus-local-drc.json').read_text());hard=[v for v in q['violations'] if v['type'] not in ['track_dangling','via_dangling']];ok=not hard;ledger.append({'job':name,'path':path,'accepted':ok,'types':dict(collections.Counter(v['type'] for v in q['violations']))});print(name,ok,len(hard),len(q['unconnected_items']),flush=True)
  if ok:break
  for t in added:b.RemoveNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(base.with_suffix('.kicad_pcb')),b);(d/'vbus-local-search.json').write_text(json.dumps(ledger,indent=2)+'\n')
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(base.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(d/'vbus-local-drc.json')],check=True)
