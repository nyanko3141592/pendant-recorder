from pathlib import Path
import pcbnew as k,wx,json,shutil,re
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'plane-power-routed.kicad_pcb';b=k.LoadBoard(str(src));removed=0
for t in list(b.GetTracks()):
 if t.GetNetname() in ['/BAT','/VBUS','/SD_MOSI','/SD_CLK_MCU'] or (not isinstance(t,k.PCB_VIA) and t.GetLayer() in [k.In1_Cu,k.In2_Cu]):b.RemoveNative(t);removed+=1
out=w/'plane-repair-unrouted.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
assert k.ExportSpecctraDSN(b,str(out.with_suffix('.dsn')))
s=out.with_suffix('.dsn').read_text()
for layer in ['In1.Cu','In2.Cu']:s=s.replace(f'(layer {layer}\n      (type signal)',f'(layer {layer}\n      (type power)')
s='\n'.join(x for x in s.splitlines() if '(wire_keepout ' not in x)+'\n'
s=s.replace('(class kicad_default /BAT ', '(class kicad_default ')
s=s.replace('    (class USB_FS_PAIR', '    (class BAT_POWER /BAT (circuit (use_via "Via[0-3]_450:200_um")) (rule (width 150) (clearance 100)))\n    (class USB_FS_PAIR')
out.with_suffix('.dsn').write_text(s)
print(json.dumps({'removed_items':removed,'ripped_nets':['BAT','VBUS','SD_MOSI','SD_CLK_MCU'],'BAT_router_width_mm':.15,'inner_signal_allowed':False}))
