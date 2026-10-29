from pathlib import Path
import pcbnew as k,wx,shutil,subprocess,json
app=wx.App(False);p=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/electrical-panel-candidate-v3');d=p/'mask-isolation';d.mkdir(exist_ok=False)
for ext in ('.kicad_pro','.kicad_dru'):shutil.copyfile(p/('panel'+ext),d/('panel'+ext))
shutil.copyfile(p/'fp-lib-table',d/'fp-lib-table');shutil.copyfile(p/'panel.kicad_pcb',d/'panel.kicad_pcb');b=k.LoadBoard(str(d/'panel.kicad_pcb'))
for f in list(b.GetFootprints()):
 if f.GetReference().startswith('FID'):b.RemoveNative(f)
k.SaveBoard(str(d/'panel.kicad_pcb'),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(d/'panel.kicad_pcb'),'--format','json','--severity-all','-o',str(d/'drc.json')],check=True)
