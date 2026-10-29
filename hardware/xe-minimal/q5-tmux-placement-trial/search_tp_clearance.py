from pathlib import Path
import pcbnew as k,wx,json,subprocess,shutil,collections
app=wx.App(False);d=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');b=k.LoadBoard(str(d/'side-search.kicad_pcb'));fps={f.GetReference():f for f in b.GetFootprints()};base=d/'tp-clearance';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['kicad_pro','kicad_dru','kicad_sch']:shutil.copyfile(d/f'side-search.{ext}',base.with_suffix('.'+ext))
ledger=[]
def move(ref,x,y):
 f=fps[ref];old=f.GetPosition();new=k.VECTOR2I(k.FromMM(x),k.FromMM(y));delta=new-old
 if ref=='TP1':
  for t in b.GetTracks():
   if isinstance(t,k.PCB_VIA):continue
   if t.GetStart()==old:t.SetStart(new)
   if t.GetEnd()==old:t.SetEnd(new)
 f.SetPosition(new)
for ref,coords in [('TP1',[(10.2929,10.7071,'B'),(10.2929,10.3,'B'),(10.2929,10.1,'B'),(9.9,10.1,'B'),(9.5,10.1,'B'),(10.6,10.1,'B')])]:
 best=None
 for x,y,side in coords:
  f=fps[ref]
  if f.IsFlipped()!=(side=='B'):f.Flip(f.GetPosition(),k.FLIP_DIRECTION_LEFT_RIGHT)
  move(ref,x,y);k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(base.with_suffix('.kicad_pcb')),b)
  subprocess.run([cli,'pcb','drc',str(base.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(d/'tp-clearance-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  q=json.loads((d/'tp-clearance-drc.json').read_text());hard=[v for v in q['violations'] if v['type'] not in ['silk_overlap','silk_over_copper','track_dangling','via_dangling']];score=(len(hard),len(q['violations']));row={'ref':ref,'xy':[x,y], 'side':side,'score':score,'types':dict(collections.Counter(v['type']for v in q['violations']))};ledger.append(row);print(row,flush=True)
  if best is None or score<best[0]:best=(score,(x,y,side))
 x,y,side=best[1];f=fps[ref]
 if f.IsFlipped()!=(side=='B'):f.Flip(f.GetPosition(),k.FLIP_DIRECTION_LEFT_RIGHT)
 move(ref,x,y)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(base.with_suffix('.kicad_pcb')),b);(d/'tp-clearance-search.json').write_text(json.dumps(ledger,indent=2)+'\n')
subprocess.run([cli,'pcb','drc',str(base.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(d/'tp-clearance-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
