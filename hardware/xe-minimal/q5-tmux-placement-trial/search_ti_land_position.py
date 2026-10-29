from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess,collections
app=wx.App(False);d=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');base=d/'ti-move';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_sch','.kicad_dru']:shutil.copyfile((d/'ti-land').with_suffix(ext),base.with_suffix(ext))
orig=k.LoadBoard(str(d/'ground-island-join.kicad_pcb'));f0=next(f for f in orig.GetFootprints() if f.GetReference()=='U16');old={p.GetNumber():p.GetPosition() for p in f0.Pads()};ledger=[];best=None
for dx,dy in [(0,0),(.3,0),(.4,.1),(.3,.2),(.4,.2),(.5,.1),(.2,.1),(.4,-.1)]:
 b=k.LoadBoard(str(d/'ti-land.kicad_pcb'));f=next(f for f in b.GetFootprints() if f.GetReference()=='U16');f.Move(k.VECTOR2I(k.FromMM(dx),k.FromMM(dy)));new={p.GetNumber():p.GetPosition() for p in f.Pads()}
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.F_Cu:continue
  for attr in ['Start','End']:
   p=getattr(t,'Get'+attr)()
   for n,prev in old.items():
    if abs(p.x-prev.x)<10 and abs(p.y-prev.y)<10:getattr(t,'Set'+attr)(new[n]);break
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(base.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(base.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(d/'ti-move-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 q=json.loads((d/'ti-move-drc.json').read_text());hard=[v for v in q['violations'] if v['type'] not in ['lib_footprint_mismatch','track_dangling','via_dangling','silk_overlap','silk_over_copper']];score=(len(hard),len(q['unconnected_items']),len(q['violations']));row={'offset_mm':[dx,dy],'score':score,'types':dict(collections.Counter(v['type'] for v in q['violations']))};ledger.append(row);print(row,flush=True)
 if best is None or score<best[0]:
  best=(score,[dx,dy]);shutil.copyfile(base.with_suffix('.kicad_pcb'),d/'ti-move-best.kicad_pcb');shutil.copyfile(d/'ti-move-drc.json',d/'ti-move-best-drc.json')
(d/'ti-move-search.json').write_text(json.dumps({'trials':ledger,'best':best},indent=2)+'\n')
for ext in ['.kicad_pro','.kicad_sch','.kicad_dru']:shutil.copyfile(base.with_suffix(ext),(d/'ti-move-best').with_suffix(ext))
