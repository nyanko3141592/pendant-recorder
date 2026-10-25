"""Repair local clearances without relaxing rules; synchronize NC names."""
from pathlib import Path
import json
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parents[1]/'charge-guard-v4';file=P/'pendant-charge-guard-v4.kicad_pcb';b=k.LoadBoard(str(file))
moves=[('/SD_CS_N',11.6158,16.4258,0,.015),('/SD_CS_N',11.4798,16.4258,0,.015),('/PDM_CLK_MCU',5.6112,7.4245,.015,0),('/PDM_CLK_MCU',5.6112,7.2202,.015,0),('/CHG_INHIBIT_GATE',13.5496,12.5583,-.020,.020),('/GND',2.6723,8.7125,0,.030)]
changed=0
for t in b.GetTracks():
 for net,x,y,dx,dy in moves:
  if t.GetNetname()!=net:continue
  if isinstance(t,k.PCB_VIA):
   p=t.GetPosition()
   if abs(k.ToMM(p.x)-x)<.00001 and abs(k.ToMM(p.y)-y)<.00001:t.SetPosition(k.VECTOR2I(p.x+k.FromMM(dx),p.y+k.FromMM(dy)));changed+=1
  else:
   for get,set in [(t.GetStart,t.SetStart),(t.GetEnd,t.SetEnd)]:
    p=get()
    if abs(k.ToMM(p.x)-x)<.00001 and abs(k.ToMM(p.y)-y)<.00001:set(k.VECTOR2I(p.x+k.FromMM(dx),p.y+k.FromMM(dy)));changed+=1
assert changed>0,'Already applied or different board'
parts={p['ref']:p for p in json.loads((P/'design.json').read_text())['parts']};nets={n.GetNetname():n for n in b.GetNetsByNetcode().values()}
for f in b.GetFootprints():
 pp={p['number']:p for p in parts[f.GetReference()]['pins']}
 for pad in f.Pads():
  p=pp.get(pad.GetNumber())
  if p and p['net'] is None:
   name=f"unconnected-({f.GetReference()}-{p['name'].replace(' ','_')}-Pad{p['number']})"
   if name not in nets:n=k.NETINFO_ITEM(b,name);b.Add(n);nets[name]=n
   pad.SetNet(nets[name])
k.SaveBoard(str(file),b);print('moved',changed)
