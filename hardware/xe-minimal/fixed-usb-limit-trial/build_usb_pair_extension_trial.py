from pathlib import Path
import pcbnew as k,wx,shutil,json,hashlib,subprocess,math,argparse
a=argparse.ArgumentParser();a.add_argument("--start-extension",type=float,default=.2);a.add_argument("--directory",default="usb-pair-extension-trial");args=a.parse_args()
app=wx.App(False);O=Path(__file__).resolve().parent;S=O/'r44-capped-trial';D=O/args.directory;D.mkdir(exist_ok=True)
for p in S.iterdir():
 if p.is_dir()and p.name.endswith('.pretty'):shutil.copytree(p,D/p.name,dirs_exist_ok=True)
 elif p.is_file()and(p.suffix in ['.kicad_sch','.kicad_pro','.kicad_dru','.csv']or p.name=='fp-lib-table'):shutil.copyfile(p,D/p.name)
f=S/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(f));changes=[]
# Extend both ends of the existing coupled straight segment, leaving endpoint vias fixed.
for net,start,end in [('/USB_DP',(15.687076,15.645503),(19.187076,11.145503)),('/USB_DM',(15.5,15.5),(19,11))]:
 newstart=(start[0]-args.start_extension*(end[0]-start[0]),start[1]-args.start_extension*(end[1]-start[1]));newend=(end[0]+.15*(end[0]-start[0]),end[1]+.15*(end[1]-start[1]))
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetNetname()!=net or t.GetLayer()!=k.In2_Cu:continue
  for getter,setter in [(t.GetStart,t.SetStart),(t.GetEnd,t.SetEnd)]:
   v=getter();a=(k.ToMM(v.x),k.ToMM(v.y))
   for old,new in [(start,newstart),(end,newend)]:
    if math.dist(a,old)<1e-6:setter(k.VECTOR2I(k.FromMM(new[0]),k.FromMM(new[1])));changes.append({'uuid':t.m_Uuid.AsString(),'from':a,'to':new})
assert len(changes)==8
k.ZONE_FILLER(b).Fill(b.Zones());out=D/f.name;k.SaveBoard(str(out),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((D/'drc.json').read_text());r={'status':'TRIAL_NOT_ADOPTED','source_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'changes':changes,'coupled_straight_length_mm':math.hypot(3.5,4.5)*(1.15+args.start_extension),'checks':{x:len(d[x])for x in ['violations','unconnected_items','schematic_parity']},'violations':d['violations'],'limits':['Only geometric extension; reference copper, bend coupling and fanouts still unqualified','Parent PCB unchanged']};(D/'review.json').write_text(json.dumps(r,indent=2));print(json.dumps(r,indent=2))
