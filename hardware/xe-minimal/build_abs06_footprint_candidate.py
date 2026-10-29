from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess
app=wx.App(False);O=Path(__file__).resolve().parent;name='Crystal_ABS06_2012_RecommendedLand';lib=O/'PendantMinimal.pretty';system='/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Crystal.pretty'
f=k.FootprintLoad(system,'Crystal_SMD_2012-2Pin_2.0x1.2mm');f.SetFPID(k.LIB_ID('PendantMinimal',name));f.SetValue('ABS06-32.768KHZ-7-T')
for p in f.Pads():
 sign=1 if p.GetPosition().x>0 else -1;p.SetSize(k.VECTOR2I(750000,1400000));p.SetPosition(k.VECTOR2I(sign*725000,0))
k.FootprintSave(str(lib),f);assert (lib/(name+'.kicad_mod')).exists()
src=O/'y1-abs06-shift-candidate';dst=O/'y1-abs06-library-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
s=dst.with_suffix('.kicad_sch').read_text().replace('32.768kHz CL=7pF TBD','ABS06-32.768KHZ-7-T').replace('Crystal:Crystal_SMD_2012-2Pin_2.0x1.2mm','PendantMinimal:'+name);dst.with_suffix('.kicad_sch').write_text(s)
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='Y1');f.SetFPID(k.LIB_ID('PendantMinimal',name));f.SetValue('ABS06-32.768KHZ-7-T');k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'y1-abs06-library-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'y1-abs06-library-drc.json').read_text());(O/'y1-abs06-library-review.json').write_text(json.dumps({'status':'LAYOUT_CANDIDATE_NOT_ADOPTED','violations':r['violations'],'parity':r['schematic_parity'],'unconnected_items':len(r['unconnected_items']),'part_qualification':'mechanical/xe-minimal/y1-abs06-candidate-review.json','adopted':False},indent=2)+'\n');print(len(r['violations']),len(r['schematic_parity']),len(r['unconnected_items']))
