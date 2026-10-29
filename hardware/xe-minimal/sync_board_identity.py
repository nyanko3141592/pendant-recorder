import pcbnew
import wx
app=wx.App(False)
import json,uuid,shutil,xml.etree.ElementTree as ET
from pathlib import Path
O=Path(__file__).resolve().parent;b=pcbnew.LoadBoard(str(O/'local-cap-routing-candidate.kicad_pcb'));d=json.loads((O/'design.json').read_text());parts={p['ref']:p for p in d['parts']};root=str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/xe-minimal/root'))
for f in b.GetFootprints():
 ref=f.GetReference();p=parts[ref];sid=str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/xe-minimal/'+ref));f.SetPath(pcbnew.KIID_PATH('/'+root+'/'+sid));f.SetValue(p['value']);lib,name=p['footprint'].split(':',1);f.SetFPID(pcbnew.LIB_ID(lib,name))
 # Pads reserved by the memory data sheet remain electrically unconnected.
fps={f.GetReference():f for f in b.GetFootprints()}
for n in ET.parse(O/'schematic.net.xml').findall('.//nets/net'):
 name=n.attrib['name']
 if not name.startswith('unconnected-'):continue
 ni=pcbnew.NETINFO_ITEM(b,name);b.AddNative(ni);ni.thisown=False
 for node in n.findall('node'):
  for pad in fps[node.attrib['ref']].Pads():
   if pad.GetNumber()==node.attrib['pin']:pad.SetNet(ni)
pcbnew.SaveBoard(str(O/'pendant-xe-minimal.kicad_pcb'),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(O/('local-cap-routing-candidate'+ext),O/('pendant-xe-minimal'+ext))
print('Mapped',len(parts),'physical references to generated schematic UUID paths.')
