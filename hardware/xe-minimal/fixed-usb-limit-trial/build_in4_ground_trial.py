"""Add an In4 ground plane candidate and inspect DRC; no production adoption."""
from pathlib import Path
import pcbnew as k,wx,shutil,json,hashlib,subprocess
app=wx.App(False);O=Path(__file__).resolve().parent;S=O/'material-dk-trial';D=O/'in4-ground-trial';D.mkdir(exist_ok=True)
for p in S.iterdir():
 if p.is_dir()and p.suffix=='.pretty':shutil.copytree(p,D/p.name,dirs_exist_ok=True)
 elif p.is_file()and(p.suffix in ['.kicad_sch','.kicad_pro','.kicad_dru']or p.name=='fp-lib-table'):shutil.copy2(p,D/p.name)
f=S/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(f));source=next(z for z in b.Zones()if z.IsOnLayer(k.In1_Cu)and z.GetNetname()=='/GND')
z=k.ZONE(b);z.SetLayer(k.In4_Cu);z.SetNetCode(source.GetNetCode())
for prop in ['LocalClearance','MinThickness','PadConnection','ThermalReliefGap','ThermalReliefSpokeWidth','IslandRemovalMode','MinIslandArea']:
 getattr(z,'Set'+prop)(getattr(source,'Get'+prop)())
z.Outline().NewOutline()
for i in range(source.GetNumCorners()):
 point=source.GetCornerPosition(i);z.Outline().Append(point.x,point.y)
b.AddNative(z);z.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());out=D/f.name;k.SaveBoard(str(out),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,capture_output=True)
d=json.loads((D/'drc.json').read_text());r={'status':'ADDED_IN4_GROUND_CANDIDATE_NOT_QUALIFIED','source_pcb_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'output_pcb_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'change':'NewIn4GND zone copied fromIn1 outline/clearance/thermal settings; allzonesrefilled','checks':{x:len(d[x])for x in ['violations','unconnected_items','schematic_parity']},'limits':['Reference coverage, plane connectivity, impedance and copper balance need review','Adding copper changes electrical geometry; no90ohmclaim']};(D/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
