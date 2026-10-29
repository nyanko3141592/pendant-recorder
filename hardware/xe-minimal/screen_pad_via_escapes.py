"""Screen filled/capped pad vias on unconnected pads; isolated candidates only."""
import pcbnew as k,wx,json,subprocess,shutil
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'pad-via-screen-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
r=json.loads((O/'current-drc.json').read_text());ids={i['uuid'] for v in r['unconnected_items'] for i in v['items']};b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));targets=[(f.GetReference(),p.GetNumber()) for f in b.GetFootprints() for p in f.Pads() if p.m_Uuid.AsString() in ids and p.GetAttribute()==k.PAD_ATTRIB_SMD];rows=[]
for ref,num in targets:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()==ref);p=next(p for p in f.Pads() if p.GetNumber()==num)
 v=k.PCB_VIA(b);v.SetPosition(p.GetPosition());v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(p.GetNet());v.SetFillingMode(k.FILLING_MODE_FILLED);v.SetCappingMode(k.CAPPING_MODE_CAPPED);b.AddNative(v);v.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pad-via-screen-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 d=json.loads((O/'pad-via-screen-drc.json').read_text());physical=[x for x in d['violations'] if x['type']!='via_dangling'];ok=not physical and not d['schematic_parity'] and len(d['unconnected_items'])<=21
 rows.append({'ref':ref,'pad':num,'net':p.GetNetname(),'xy_mm':[k.ToMM(p.GetPosition().x),k.ToMM(p.GetPosition().y)],'geometry_screen_pass':ok,'violations':d['violations'],'unconnected':len(d['unconnected_items'])});print(ref,num,ok,len(physical),flush=True)
(O/'pad-via-escape-screen.json').write_text(json.dumps({'status':'SCREEN_ONLY_NO_ADOPTION','method':'Filled/capped .35/.15 through via at unconnected SMD pad center. Ignore only dangling warning; full physical/parity checks. Stencil/manufacturing qualification remains separate.','results':rows},indent=2)+'\n')
