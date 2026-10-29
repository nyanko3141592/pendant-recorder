"""Screen filled/capped pad vias on unconnected pads; isolated candidates only."""
import pcbnew as k,wx,json,subprocess,shutil
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'pad-via-offset-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
targets=[('U13','4'),('U14','6'),('R11','2'),('R14','1'),('U1','19'),('U14','3'),('J3','2')];rows=[];passed=set()
for ref,num,dx,dy in [(ref,num,dx,dy) for ref,num in targets for dx,dy in [(0,.05),(0,-.05),(.05,0),(-.05,0),(0,.1),(0,-.1),(.1,0),(-.1,0),(0,.2),(0,-.2),(.2,0),(-.2,0)]]:
 if (ref,num) in passed:continue
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()==ref);p=next(p for p in f.Pads() if p.GetNumber()==num)
 v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(p.GetPosition().x+round(dx*1e6),p.GetPosition().y+round(dy*1e6)));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(p.GetNet());v.SetFillingMode(k.FILLING_MODE_FILLED);v.SetCappingMode(k.CAPPING_MODE_CAPPED);b.AddNative(v);v.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pad-via-offset-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 d=json.loads((O/'pad-via-offset-drc.json').read_text());physical=[x for x in d['violations'] if x['type']!='via_dangling'];ok=not physical and not d['schematic_parity'] and len(d['unconnected_items'])<=21
 rows.append({'ref':ref,'pad':num,'net':p.GetNetname(),'xy_mm':[k.ToMM(v.GetPosition().x),k.ToMM(v.GetPosition().y)],'offset_mm':[dx,dy],'geometry_screen_pass':ok,'violations':d['violations'],'unconnected':len(d['unconnected_items'])});print(ref,num,dx,dy,ok,len(physical),flush=True)
 if ok:
  passed.add((ref,num));shutil.copyfile(dst.with_suffix('.kicad_pcb'),O/f'pad-via-{ref}-{num}-candidate.kicad_pcb')
(O/'pad-via-offset-screen.json').write_text(json.dumps({'status':'SCREEN_ONLY_NO_ADOPTION','method':'Filled/capped .35/.15 through via at unconnected SMD pad center. Ignore only dangling warning; full physical/parity checks. Stencil/manufacturing qualification remains separate.','results':rows},indent=2)+'\n')
