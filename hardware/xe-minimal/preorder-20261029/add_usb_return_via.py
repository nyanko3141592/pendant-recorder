from pathlib import Path
import wx,pcbnew as k,json,math,shutil,subprocess
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'usb-back-corridor-routed.kicad_pcb';b=k.LoadBoard(str(p));target=(12.1505,19.8);candidates=[]
for i in range(-12,13):
 for j in range(-12,13):
  x=target[0]+i*.1;y=target[1]+j*.1;d=math.hypot(i*.1,j*.1)
  if not .5<d<1.25:continue
  q=k.VECTOR2I(k.FromMM(x),k.FromMM(y));bad=False
  for t in b.GetTracks():
   if t.GetNetname()=='/GND':continue
   for layer in [k.F_Cu,k.In1_Cu,k.In2_Cu,k.B_Cu]:
    if t.IsOnLayer(layer) and t.GetEffectiveShape(layer).Collide(q,k.FromMM(.33)):bad=True;break
   if bad:break
  if bad:continue
  for f in b.GetFootprints():
   for pad in f.Pads():
    for layer in [k.F_Cu,k.B_Cu]:
     if pad.IsOnLayer(layer) and pad.GetEffectiveShape(layer).Collide(q,k.FromMM(.33)):bad=True;break
    if bad:break
   if bad:break
  if not bad:candidates.append((d,x,y))
candidates.sort();(w/'usb-return-via-sites.json').write_text(json.dumps(candidates,indent=2)+'\n');print('sites',len(candidates))
if not candidates:raise SystemExit(0)
_,x,y=candidates[0];v=k.PCB_VIA(b);v.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(b.FindNet('/GND').GetNetCode());b.AddNative(v);v.thisown=False
out=w/'usb-return-via.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ('.kicad_pro','.kicad_dru','.kicad_sch'):shutil.copy2(p.with_suffix(ext),out.with_suffix(ext))
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--refill-zones','--save-board','--schematic-parity','--severity-all','--format','json','-o',str(w/'usb-return-via-drc.json'),str(out)],check=True)
d=json.loads((w/'usb-return-via-drc.json').read_text());print('geometric',len([t for t in d['violations'] if t['type']!='lib_footprint_issues']),'unconnected',len(d['unconnected_items']),'site',x,y)
