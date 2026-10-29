import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;dst=O/'drain-r45-pivot-candidate';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile((O/'pendant-xe-minimal').with_suffix(ext),dst.with_suffix(ext))
rows=[]
for angle in [90,-90,180,45,-45,135,-135]:
 b=k.LoadBoard(str(O/'pendant-xe-minimal.kicad_pcb'));f=next(f for f in b.GetFootprints() if f.GetReference()=='R45');p1=next(p for p in f.Pads() if p.GetNumber()=='1');old=p1.GetPosition();f.Rotate(old,k.EDA_ANGLE(angle,k.DEGREES_T));p2=next(p for p in f.Pads() if p.GetNumber()=='2')
 v=k.PCB_VIA(b);v.SetPosition(p2.GetPosition());v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(p2.GetNet());v.SetFillingMode(k.FILLING_MODE_FILLED);v.SetCappingMode(k.CAPPING_MODE_CAPPED);b.AddNative(v);v.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drain-r45-pivot-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'drain-r45-pivot-drc.json').read_text());ok=not [x for x in r['violations'] if x['type']!='via_dangling'] and not r['schematic_parity'] and len(r['unconnected_items'])==1;rows.append({'angle':angle,'accepted':ok,'violations':r['violations'],'unconnected':len(r['unconnected_items'])});print(angle,ok,flush=True)
 if ok:break
(O/'drain-r45-pivot-review.json').write_text(json.dumps(rows,indent=2)+'\n')
