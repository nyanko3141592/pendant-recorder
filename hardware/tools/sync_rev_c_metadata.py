#!/usr/bin/env python3
"""Match schematic net names and footprint BOM attributes, without altering connectivity."""
import subprocess,tempfile,xml.etree.ElementTree as E
from pathlib import Path
import pcbnew as p
O=Path(__file__).resolve().parents[1]/'rev-c';b=p.LoadBoard(str(O/'pendant-rev-c.kicad_pcb'))
with tempfile.TemporaryDirectory() as t:
 f=Path(t)/'nets.xml'
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','sch','export','netlist','--format','kicadxml','-o',str(f),str(O/'pendant-rev-c.kicad_sch')],check=True)
 names={(n.get('ref'),n.get('pin')):net.get('name') for net in E.parse(f).getroot().findall('nets/net') for n in net.findall('node')}
 mapping={}
 for fp in b.GetFootprints():
  for pad in fp.Pads():
   key=(fp.GetReference(),pad.GetNumber())
   if key not in names:continue
   code=pad.GetNetCode()
   assert code not in mapping or mapping[code]==names[key]
   mapping[code]=names[key]
 for code,name in mapping.items():b.FindNet(code).SetNetname(name)
 b.BuildListOfNets();p.SaveBoard(str(O/'pendant-rev-c.kicad_pcb'),b)
print('Schematic net names synchronized without changing memberships')
