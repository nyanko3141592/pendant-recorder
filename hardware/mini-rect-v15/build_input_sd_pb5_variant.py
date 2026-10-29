"""Preserve prior PA2/PA3/PB1 candidate; try accessible PB5/PB6/PB7 pins."""
from pathlib import Path
import json,shutil,subprocess
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;S=P/'input-control-pa2-pb1';O=P/'input-control-pa2-pb5';O.mkdir(exist_ok=True)
out=O/'input-gpio-source.kicad_pcb';assert not out.exists(),'Preserve existing variant'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(S/('sd-pin-scan'+ext),out.with_suffix(ext))
b=k.LoadBoard(str(S/'sd-pin-scan.kicad_pcb'));f=next(f for f in b.GetFootprints() if f.GetReference()=='U1');pads={p.GetNumber():p for p in f.Pads() if p.GetNumber()}
d=json.loads((S/'design.json').read_text());u=next(p for p in d['parts'] if p['ref']=='U1');pins={p['number']:p for p in u['pins']}
for old,new,expected in [('18','41','PB5')]:
 assert pins[new]['name']==expected and pins[new]['net'] is None
 net=pins[old]['net'];assert net=='SD_EN';pins[new]['net']=net;pins[old]['net']=None;pads[new].SetNet(b.FindNet('/'+net));pads[old].SetNetCode(0)
d['revision']='mini-rect-v15 input-control PA2/PB6/PB1 with PB5 SD_EN candidate NOT RELEASED';(O/'design.json').write_text(json.dumps(d,indent=2)+'\n')
shutil.copytree(S/'Pendant_Input.pretty',O/'Pendant_Input.pretty',dirs_exist_ok=True);shutil.copyfile(S/'fp-lib-table',O/'fp-lib-table');shutil.copyfile(S/'pendant-mini-rect-v15.kicad_pro',O/'pendant-mini-rect-v15.kicad_pro')
subprocess.run(['python3',str(P/'generate_schematic.py'),'mini-rect-v15',str(O)],check=True)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
for name in ['check_board_parity.py','check_usb_preserved.py']:shutil.copyfile(S/name,O/name)
print('PA2 variant created; firmware unchanged pending route acceptance')
