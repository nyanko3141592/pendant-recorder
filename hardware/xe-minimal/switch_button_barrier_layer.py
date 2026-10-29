import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'button-r4-fine-escape-candidate';dst=O/'button-barrier-layer-candidate';out=[]
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
for layer in [k.In2_Cu,k.F_Cu,k.B_Cu]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));t=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='e8c153df-0961-4f9c-99ec-8f07b79d5cde');t.SetLayer(layer)
 v=k.PCB_VIA(b);v.SetPosition(t.GetStart());v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(t.GetNet());b.AddNative(v);v.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'button-barrier-layer-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'button-barrier-layer-drc.json').read_text());ok=[v['type'] for v in r['violations']]==['via_dangling','via_dangling'] and not r['schematic_parity'] and len(r['unconnected_items'])==27;out.append({'layer':layer,'accepted':ok,'violations':r['violations']});print(layer,ok,len(r['violations']),flush=True)
 if ok:break
(O/'button-barrier-layer-review.json').write_text(json.dumps(out,indent=2)+'\n')
