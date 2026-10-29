from pathlib import Path
import pcbnew as k,wx,json,shutil,re
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'spi-cluster-unrouted.kicad_pcb';b=k.LoadBoard(str(src))
for z in list(b.Zones()):
 if z.GetIsRuleArea() and z.GetLayer()==k.In2_Cu:b.RemoveNative(z)
out=w/'mixed-l3-unrouted.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
assert k.ExportSpecctraDSN(b,str(out.with_suffix('.dsn')))
s=out.with_suffix('.dsn').read_text().replace('(layer In1.Cu\n      (type signal)','(layer In1.Cu\n      (type power)')
s='\n'.join(x for x in s.splitlines() if '(wire_keepout ' not in x)+'\n'
critical=['/PDM_CLK','/PDM_CLK_MCU','/PDM_DATA','/SD_CLK','/SD_CLK_MCU','/SD_MOSI','/SD_MISO','/SD_CS_N']
a=s.index('(class kicad_default ');end=s.index('(circuit',a);head=s[a:end]
for net in ['/BAT',*critical]:head=re.sub(r'(?<!\S)'+re.escape(net)+r'(?=\s)','',head)
s=s[:a]+head+s[end:]
classes='    (class BAT_POWER /BAT (circuit (use_via "Via[0-3]_450:200_um")) (rule (width 150) (clearance 100)))\n'
classes+='    (class CRITICAL_OUTER '+' '.join(critical)+' (circuit (use_via "Via[0-3]_450:200_um") (use_layer F.Cu B.Cu)) (rule (width 127) (clearance 100)))\n'
s=s.replace('    (class USB_FS_PAIR',classes+'    (class USB_FS_PAIR');s=s.replace('(class USB_FS_PAIR /USB_DM /USB_DP\n      (circuit','(class USB_FS_PAIR /USB_DM /USB_DP\n      (circuit (use_layer F.Cu B.Cu)')
out.with_suffix('.dsn').write_text(s)
(w/'mixed-l3-preparation.json').write_text(json.dumps({'L2':'GND dedicated power layer','L3':'GND pour with power/slow signal routing allowed','critical_nets_outer_only':critical,'staging':'If connected, freeze critical routes and protect their B.Cu reference from L3 slow/power crossings in a second stage','release_allowed':False},indent=2)+'\n')
