import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'led-sdv3-branch-restored-candidate';dst=O/'led-branch-combined-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:
 shutil.copyfile((O/'pendant-xe-minimal').with_suffix(ext),src.with_suffix(ext));shutil.copyfile((O/'pendant-xe-minimal').with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));net=next(t.GetNet() for t in b.GetTracks() if t.GetNetname()=='/STATUS_LED');e=json.loads((O/'led-r32-escape-review.json').read_text())['accepted'];r=json.loads((O/'led-main-joined-review.json').read_text());assert r['accepted'];runs=[{'layer':e['layer'],'points':e['path_mm']}]+r['paths']
for run in runs:
 for a,z in zip(run['points'],run['points'][1:]):
  t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(round(a[0]*1e6),round(a[1]*1e6)));t.SetEnd(k.VECTOR2I(round(z[0]*1e6),round(z[1]*1e6)));t.SetLayer(run['layer']);t.SetWidth(k.FromMM(.1));t.SetNet(net);b.AddNative(t);t.thisown=False
x,y=e['path_mm'][-1];v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(round(x*1e6),round(y*1e6)));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(net);b.AddNative(v);v.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'led-branch-combined-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
d=json.loads((O/'led-branch-combined-drc.json').read_text());out={'accepted':not d['violations'] and not d['schematic_parity'] and len(d['unconnected_items'])==13,'violations':d['violations'],'unconnected_items':len(d['unconnected_items'])};(O/'led-branch-combined-review.json').write_text(json.dumps(out,indent=2)+'\n');print(out)
