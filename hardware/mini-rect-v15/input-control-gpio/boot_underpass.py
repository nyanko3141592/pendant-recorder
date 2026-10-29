from pathlib import Path
import json,shutil,subprocess,itertools
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'input-power-connected.kicad_pcb';out=P/'input-boot-underpass.kicad_pcb';trial=P/'boot-underpass-trial.kicad_pcb'
for f in [out,trial]:
 for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),f.with_suffix(ext))
remove={'5dd2b7c8-5f9f-4498-81c3-74374a53f6af','69fa400c-143a-4a18-8b19-2a243bfe5b5c'}
def vec(p):return k.VECTOR2I(k.FromMM(p[0]),k.FromMM(p[1]))
a=(11.405,11.6155);z=(12.9639,12.1492);results=[]
for x,y in [(11.405,12.1492),(11.405,12.3),(11.2,12.15),(11.6,12.15),(11.1,12.3),(11.6,12.3),(11.405,12.5),(11.0,12.5)]:
 for style in ['In2','In4']:
  b=k.LoadBoard(str(src));net=b.FindNet('/BOOT0').GetNetCode()
  for t in list(b.GetTracks()):
   if t.m_Uuid.AsString() in remove:b.DeleteNative(t)
  def track(p,q,layer):
   if p==q:return
   t=k.PCB_TRACK(b);t.SetStart(vec(p));t.SetEnd(vec(q));t.SetLayer(layer);t.SetNetCode(net);t.SetWidth(k.FromMM(.1));b.Add(t)
  v=k.PCB_VIA(b);v.SetPosition(vec((x,y)));v.SetWidth(k.FromMM(.45));v.SetDrill(k.FromMM(.2));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNetCode(net);b.Add(v);track(a,(x,y),k.B_Cu)
  route=[(x,y),z]
  for p,q in zip(route,route[1:]):track(p,q,k.In2_Cu if style=='In2' else k.In4_Cu)
  k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(trial),b);rp=trial.with_suffix('.drc.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(trial),'-o',str(rp),'--format','json'],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
  d=json.loads(rp.read_text());r={'via':[x,y],'style':style,'violations':len(d['violations']),'unconnected':len(d['unconnected_items'])};results.append(r);print(r,flush=True)
  if not d['violations'] and len(d['unconnected_items'])==3:
   k.SaveBoard(str(out),b);shutil.copyfile(rp,out.with_suffix('.drc.json'));(P/'boot-underpass-review.json').write_text(json.dumps({'status':'ACCEPTED_GEOMETRY_ONLY','attempts':results},indent=2)+'\n');raise SystemExit(0)
(P/'boot-underpass-review.json').write_text(json.dumps({'status':'NO_ACCEPTED_ROUTE','attempts':results},indent=2)+'\n');raise SystemExit(1)
