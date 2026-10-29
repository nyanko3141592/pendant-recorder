"""Add an In4 ground plane candidate and inspect DRC; no production adoption."""
from pathlib import Path
import pcbnew as k,wx,shutil,json,hashlib,subprocess
app=wx.App(False);O=Path(__file__).resolve().parent;S=O/'in4-ground-trial';D=O/'nrst-detour-trial';D.mkdir(exist_ok=True)
for p in S.iterdir():
 if p.is_dir()and p.suffix=='.pretty':shutil.copytree(p,D/p.name,dirs_exist_ok=True)
 elif p.is_file()and(p.suffix in ['.kicad_sch','.kicad_pro','.kicad_dru']or p.name=='fp-lib-table'):shutil.copy2(p,D/p.name)
f=S/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(f));removed=[];net=None;width=None
for t in list(b.GetTracks()):
 if not isinstance(t,k.PCB_VIA)and t.GetNetname()=='/NRST'and t.GetLayer()==k.In4_Cu:
  net=t.GetNetCode();width=t.GetWidth();removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
assert len(removed)==3
def add(a,z,layer):
 t=k.PCB_TRACK(b);t.SetNetCode(net);t.SetWidth(width);t.SetLayer(layer);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));b.AddNative(t);t.thisown=False
add((12.7,17.9),(13.1,17.7),k.F_Cu)
points=[(13.1,17.7),(13.5,17.6),(14.4,17.6),(14.4,18.5),(14.1,18.9),(14.1,20.6),(15.3,22.2)]
for a,z in zip(points,points[1:]):add(a,z,k.In4_Cu)
k.ZONE_FILLER(b).Fill(b.Zones());out=D/f.name;k.SaveBoard(str(out),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,capture_output=True)
d=json.loads((D/'drc.json').read_text());r={'status':'NRST_DETOUR_TRIAL_NOT_ADOPTED','source_pcb_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'output_pcb_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'change':'Replace3In4NRSTsegmentswith6detoursegmentsand1Fbridge;existingviasretained','checks':{x:len(d[x])for x in ['violations','unconnected_items','schematic_parity']},'limits':['Reference coverage, plane connectivity, impedance and copper balance need review','Adding copper changes electrical geometry; no90ohmclaim']};(D/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
