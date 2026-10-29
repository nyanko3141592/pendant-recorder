from pathlib import Path
import pcbnew as k,wx,shutil,json,hashlib,subprocess,argparse
parser=argparse.ArgumentParser();parser.add_argument("--dx",type=float,default=.05);parser.add_argument("--dy",type=float,default=-.1);parser.add_argument("--directory",default="usb-inner-neighbor-trial");args=parser.parse_args()
app=wx.App(False);O=Path(__file__).resolve().parent;S=O/'usb-adjacent-via-trial';D=O/args.directory;D.mkdir(exist_ok=True)
for p in S.iterdir():
 if p.is_dir()and p.name.endswith('.pretty'):shutil.copytree(p,D/p.name,dirs_exist_ok=True)
 elif p.is_file()and(p.suffix in ['.kicad_sch','.kicad_pro','.kicad_dru','.csv']or p.name=='fp-lib-table'):shutil.copyfile(p,D/p.name)
f=S/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(f));moves=[]
for uid,dx,dy in [('02c2326c-3b01-4e6c-b9de-fc24784970d4',0,.04),('2a7ff8bf-961b-4c3b-a1fc-dad001d91a29',-.005,-.02)]:
 v=next(t for t in b.GetTracks()if t.m_Uuid.AsString()==uid);old=v.GetPosition();new=k.VECTOR2I(old.x+k.FromMM(dx),old.y+k.FromMM(dy));net=v.GetNetname();v.SetPosition(new);count=0
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA)or t.GetNetname()!=net:continue
  if t.GetStart()==old:t.SetStart(new);count+=1
  if t.GetEnd()==old:t.SetEnd(new);count+=1
 moves.append({'uuid':uid,'net':net,'delta_mm':[dx,dy],'track_ends_moved':count})
k.ZONE_FILLER(b).Fill(b.Zones());out=D/f.name;k.SaveBoard(str(out),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((D/'drc.json').read_text());r={'status':'TRIAL_NOT_ADOPTED','moves':moves,'source_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'checks':{x:len(d[x])for x in ['violations','unconnected_items','schematic_parity']},'violations':d['violations']};(D/'review.json').write_text(json.dumps(r,indent=2));print(r['checks'])
