from pathlib import Path
import pcbnew as k,wx,json,shutil,re
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'pdm-tp6-routed.kicad_pcb';b=k.LoadBoard(str(src))
for t in list(b.GetTracks()):
 if t.GetNetname() in ['/ILIM_VSET'] or str(t.m_Uuid.AsString())=='6490fcc0-037a-4394-8df0-2857fee4c650':b.RemoveNative(t)
data=json.loads((w/'iset-bent-escape-ILIM_VSET.json').read_text())
for net,info in data.items():
 path=info['escapes'][0]['path_mm'];points=[path[0]]
 for i in range(1,len(path)-1):
  a,c,d=path[i-1],path[i],path[i+1]
  if abs((c[0]-a[0])*(d[1]-c[1])-(c[1]-a[1])*(d[0]-c[0]))>1e-8:points.append(c)
 points.append(path[-1]);code=b.FindNet(net).GetNetCode()
 for a,c in zip(points,points[1:]):
  t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(c[0]),k.FromMM(c[1])));t.SetLayer(k.B_Cu);t.SetWidth(k.FromMM(.127));t.SetNetCode(code);b.AddNative(t);t.thisown=False
 v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(path[-1][0]),k.FromMM(path[-1][1])));v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(code);b.AddNative(v);v.thisown=False
out=w/'iset-ilim-unrouted.kicad_pcb';k.SaveBoard(str(out),b)
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
