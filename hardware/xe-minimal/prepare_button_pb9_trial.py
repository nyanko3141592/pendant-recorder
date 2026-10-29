import pcbnew as k,wx,json,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;T=O/'button-pb9-trial';b=k.LoadBoard(str(O/'pendant-xe-minimal.kicad_pcb'));u=next(f for f in b.GetFootprints() if f.GetReference()=='U1');pads={p.GetNumber():p for p in u.Pads()};net=pads['26'].GetNet();pads['46'].SetNet(net)
n=k.NETINFO_ITEM(b,'unconnected-(U1-PB13-Pad26)');b.Add(n);pads['26'].SetNet(n)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(T/'pendant-xe-minimal.kicad_pcb'),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(T/'pendant-xe-minimal.kicad_pcb'),'--schematic-parity','--format','json','--severity-all','-o',str(T/'drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((T/'drc.json').read_text());print(len(r['violations']),len(r['schematic_parity']),len(r['unconnected_items']));print(r['schematic_parity'])
