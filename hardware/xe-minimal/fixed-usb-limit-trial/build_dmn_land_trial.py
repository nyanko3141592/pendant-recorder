"""Review-only manufacturer land geometry; transistor selection is not approved."""
from pathlib import Path
import pcbnew as k, wx, shutil, json, hashlib, subprocess
app=wx.App(False)
O=Path(__file__).resolve().parent; S=O/'usb-reference-via-small-trial'; D=O/'dmn-land-trial'; D.mkdir(exist_ok=True)
for p in S.iterdir():
 if p.is_dir() and p.name.endswith('.pretty'): shutil.copytree(p,D/p.name,dirs_exist_ok=True)
 elif p.is_file() and (p.suffix in ['.kicad_sch','.kicad_pro','.kicad_dru'] or p.name=='fp-lib-table'): shutil.copyfile(p,D/p.name)
f=S/'pendant-xe-minimal.kicad_pcb'; b=k.LoadBoard(str(f)); changes=[]
for fp in b.GetFootprints():
 if fp.GetReference() not in ('Q6','Q7'): continue
 for p in fp.Pads():
  old=k.VECTOR2I(p.GetPosition()); rel=p.GetFPRelativePosition()
  delta=k.FromMM(.0625) * (1 if rel.x>0 else -1)
  new=k.VECTOR2I(old.x+delta,old.y)
  p.SetShape(k.PAD_SHAPE_RECT); p.SetPosition(new); p.SetSize(k.VECTOR2I(k.FromMM(.9),k.FromMM(.8)))
  n=0
  for t in b.GetTracks():
   if isinstance(t,k.PCB_VIA) or t.GetNetCode()!=p.GetNetCode(): continue
   if t.GetStart()==old: t.SetStart(new); n+=1
   if t.GetEnd()==old: t.SetEnd(new); n+=1
  changes.append({'ref':fp.GetReference(),'pad':p.GetNumber(),'delta_x_mm':k.ToMM(delta),'size_mm':[.9,.8],'track_ends_moved':n})
k.ZONE_FILLER(b).Fill(b.Zones()); out=D/f.name; k.SaveBoard(str(out),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((D/'drc.json').read_text()); r={'status':'LAND_GEOMETRY_TRIAL_NOT_ADOPTED','source_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'changes':changes,'checks':{x:len(d[x]) for x in ['violations','unconnected_items','schematic_parity']},'limitations':['MPN not substituted; generic value retained for geometry isolation','Silkscreen/courtyard and local library synchronization require review','Electrical and physical assembly qualification pending']}
(D/'review.json').write_text(json.dumps(r,indent=2)+'\n'); print(json.dumps(r['checks']))
