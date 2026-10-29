"""Isolated ground stitch candidate; DRC success does not qualify signal integrity."""
from pathlib import Path
import pcbnew as k,wx,shutil,json,subprocess,hashlib
app=wx.App(False);D=Path(__file__).resolve().parent;O=D/'pdm-stitch-trial';O.mkdir(exist_ok=True)
src=D/'led-land-trial/pendant-xe-minimal';dst=O/'pendant-xe-minimal'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
for lib in src.parent.glob('*.pretty'):shutil.copytree(lib,O/lib.name,dirs_exist_ok=True)
shutil.copyfile(src.parent/'fp-lib-table',O/'fp-lib-table')
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(5.35),k.FromMM(13.3)));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet('/GND').GetNetCode());b.AddNative(v);v.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drc.json')],check=True,stdout=subprocess.DEVNULL)
r=json.loads((O/'drc.json').read_text());out={'status':'UNADOPTED_STITCH_EXPERIMENT','source_sha256':hashlib.sha256(src.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'via_mm':[5.35,13.3,.35,.15],'checks':{q:len(r[q]) for q in ['violations','unconnected_items','schematic_parity']},'limitations':['Ground plane connectivity and return current distribution not verified','No hardware signal-integrity test','Not adopted']};(O/'review.json').write_text(json.dumps(out,indent=2)+'\n');print(out);print([(x['type'],x['description'])for x in r['violations']])
