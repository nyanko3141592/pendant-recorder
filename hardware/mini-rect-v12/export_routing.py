from pathlib import Path
import re
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
b=k.LoadBoard(str(P/'pendant-mini-rect-v12.kicad_pcb'))
assert k.ExportSpecctraDSN(b,str(P/'route-trial.dsn'))
f=P/'route-trial.dsn';s=f.read_text().replace('(width 200)','(width 100)').replace('(clearance 200)','(clearance 110)').replace('Via[0-5]_600:300','Via[0-5]_350:150').replace('(circle F.Cu 600)','(circle F.Cu 350)').replace('(circle B.Cu 600)','(circle B.Cu 350)')
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
