from pathlib import Path
import pcbnew as k,wx,shutil,json,subprocess
app=wx.App(False);d=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');src=d/'ti-pdm-reroute';dst=d/'ti-registered';name='TMUX1101_DCK0005A_TI_4214834G';lib=d/'TMUXTrial.pretty';lib.mkdir(exist_ok=True)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='U16');f.SetFPID(k.LIB_ID('TMUXTrial',name));f.SetLibDescription('TI DCK0005A 4214834/G 11/2024 board land example; pads 0.95x0.4, centers 2.2, pitch 0.65, R0.05; courtyard engineering margin.')
shutil.copyfile('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Package_TO_SOT_SMD.pretty/SOT-353_SC-70-5.kicad_mod',lib/'library-seed.kicad_mod');k.FootprintSave(str(lib),f);(lib/'library-seed.kicad_mod').unlink();k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
p=dst.with_suffix('.kicad_sch');s=p.read_text();assert s.count('Package_TO_SOT_SMD:SOT-353_SC-70-5')==1;p.write_text(s.replace('Package_TO_SOT_SMD:SOT-353_SC-70-5','TMUXTrial:'+name))
p=d/'fp-lib-table';s=p.read_text();entry='(lib (name "TMUXTrial") (type "KiCad") (uri "${KIPRJMOD}/TMUXTrial.pretty") (options "") (descr "TI TMUX trial land pattern"))\n'
if '(name "TMUXTrial")' not in s:p.write_text(s.rstrip()[:-1]+entry+')\n')
spec=json.loads((d/'design.json').read_text())
def update(x):
 if isinstance(x,dict):
  if x.get('ref')=='U16':x['footprint']='TMUXTrial:'+name
  for v in x.values():update(v)
 elif isinstance(x,list):
  for v in x:update(v)
update(spec);(d/'ti-registered-design.json').write_text(json.dumps(spec,indent=2)+'\n')
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(d/'ti-registered-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
q=json.loads((d/'ti-registered-drc.json').read_text());print({x:len(q[x]) for x in ['violations','unconnected_items','schematic_parity']});print(q['violations'])
