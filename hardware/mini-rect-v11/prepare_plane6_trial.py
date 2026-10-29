"""Isolated six-layer trial: dedicate In1 to GND, strengthen power routing."""
from pathlib import Path
import json,re,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'placement-unrouted.kicad_pcb'))
b.SetCopperLayerCount(6)
zone=k.ZONE(b);zone.SetLayer(k.In1_Cu);zone.SetNetCode(b.FindNet('/GND').GetNetCode());zone.SetLocalClearance(k.FromMM(.15));zone.SetPadConnection(k.ZONE_CONNECTION_FULL)
o=zone.Outline();o.NewOutline()
for x,y in json.loads((P/'outline.json').read_text()):o.Append(k.FromMM(x),k.FromMM(y))
b.Add(zone)
back=zone.Duplicate(False);back.SetLayer(k.In4_Cu);b.Add(back)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'plane6-trial.kicad_pcb'),b)
shutil.copy2(P/'pendant-mini-rect-v11.kicad_pro',P/'plane6-trial.kicad_pro')
assert k.ExportSpecctraDSN(b,str(P/'plane6-trial.dsn'))
f=P/'plane6-trial.dsn';s=f.read_text().replace('(width 200)','(width 100)').replace('(clearance 200)','(clearance 110)').replace('Via[0-5]_600:300','Via[0-5]_350:150').replace('(circle F.Cu 600)','(circle F.Cu 350)').replace('(circle B.Cu 600)','(circle B.Cu 350)')
# Restrict signal routing; only ground copper and through vias use In1.
s=s.replace('(class kicad_default ', '(class kicad_default ')
s=s.replace('(circuit\n', '(circuit\n        (use_layer F.Cu In2.Cu In3.Cu B.Cu)\n')
# New class removes supply nets from default; broad tracks may neck down at pads.
start=s.index('(class kicad_default');end=s.index('(rule',start)
head=s[start:end]
for n in ['/BAT','/SYS','/V3V3','/SD_V3','/VBUS']:head=re.sub(re.escape(n)+r'(?=\s)', '',head)
s=s[:start]+head+s[end:]
pos=s.index('\n  (wiring')
# insert immediately before network closing parenthesis
close=s.rfind('\n  )',0,pos)
s=s[:close]+'\n    (class power /BAT /SYS /V3V3 /SD_V3 /VBUS (circuit (use_layer F.Cu In2.Cu In3.Cu B.Cu) (use_via "Via[0-5]_350:150_um")) (rule (width 250) (clearance 110)))'+s[close:]
for n in range(1,5):s=s.replace(f'(circle In{n}.Cu 600)',f'(circle In{n}.Cu 350)')
f.write_text(s)
