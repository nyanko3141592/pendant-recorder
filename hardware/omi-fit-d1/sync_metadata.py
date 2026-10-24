#!/usr/bin/env python3
"""Match schematic net names and footprint BOM attributes, without altering connectivity."""
import subprocess,tempfile,xml.etree.ElementTree as E
from pathlib import Path
import pcbnew as p
import uuid
O=Path(__file__).resolve().parent;b=p.LoadBoard(str(O/'omi-fit-d1.kicad_pcb'))
with tempfile.TemporaryDirectory() as t:
 f=Path(t)/'nets.xml'
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','sch','export','netlist','--format','kicadxml','-o',str(f),str(O/'omi-fit-d1.kicad_sch')],check=True)
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
 for fp in b.GetFootprints():
  ref=fp.GetReference()
  root=str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/omi-fit-d1/root'));u=str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/omi-fit-d1/'+ref))
  fp.SetPath(p.KIID_PATH('/'+root+'/'+u))
  if ref=='J3' or ref.startswith('TP'):fp.SetAttributes(fp.GetAttributes()|p.FP_EXCLUDE_FROM_BOM)
 b.BuildListOfNets();p.SaveBoard(str(O/'omi-fit-d1.kicad_pcb'),b)
print('Schematic net names synchronized without changing memberships')
