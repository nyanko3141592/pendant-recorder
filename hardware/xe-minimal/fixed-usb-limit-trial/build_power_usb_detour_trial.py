"""Add an In4 ground plane candidate and inspect DRC; no production adoption."""
from pathlib import Path
import pcbnew as k,wx,shutil,json,hashlib,subprocess
app=wx.App(False);O=Path(__file__).resolve().parent;S=O/'nrst-detour-trial';D=O/'power-usb-detour-trial';D.mkdir(exist_ok=True)
for p in S.iterdir():
 if p.is_dir()and p.suffix=='.pretty':shutil.copytree(p,D/p.name,dirs_exist_ok=True)
 elif p.is_file()and(p.suffix in ['.kicad_sch','.kicad_pro','.kicad_dru']or p.name=='fp-lib-table'):shutil.copy2(p,D/p.name)
f=S/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(f));ids={'1b95afe9-6d46-481e-9ea3-d6aca4394837','3a9c5f77-b694-4579-85c6-9b7bd2644574','d5f8b75b-f823-42a1-ba3e-2fe2bfcf7d5d','ebc4a490-0f3e-4654-bd46-586f291b35c4'};removed=[];net=None
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString()in ids:
  assert t.GetNetname()=='/V3V3'and t.GetLayer()==k.In4_Cu;net=t.GetNetCode();removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
assert len(removed)==4
def add(a,z):
 t=k.PCB_TRACK(b);t.SetNetCode(net);t.SetWidth(k.FromMM(.25));t.SetLayer(k.In4_Cu);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(z[0]),k.FromMM(z[1])));b.AddNative(t);t.thisown=False
routes=[[(20,4.3),(19.9,4.3),(19.9,10.4),(20.3,10.4),(20.7,10.6),(21,10.4),(22.8,10.4),(22.8,10.9)],[(20,4.6),(19.9,4.6)],[(20,4.7),(19.9,4.7)]]
for points in routes:
 for a,z in zip(points,points[1:]):add(a,z)
k.ZONE_FILLER(b).Fill(b.Zones());out=D/f.name;k.SaveBoard(str(out),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,capture_output=True)
d=json.loads((D/'drc.json').read_text());r={'status':'POWER_USB_DETOUR_TRIAL_NOT_ADOPTED','source_pcb_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'output_pcb_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'change':'Replace4V3V3segmentswithleftbackbone;existingviasretained','checks':{x:len(d[x])for x in ['violations','unconnected_items','schematic_parity']},'limits':['Reference coverage, plane connectivity, impedance and copper balance need review','Adding copper changes electrical geometry; no90ohmclaim']};(D/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
