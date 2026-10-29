from pathlib import Path
import pcbnew as k,wx,shutil,json,hashlib,subprocess
app=wx.App(False);O=Path(__file__).resolve().parent;S=O/'glue-case-trial';D=O/'r44-clearance-trial';D.mkdir(exist_ok=True)
for p in S.iterdir():
 if p.is_dir()and p.name.endswith('.pretty'):shutil.copytree(p,D/p.name,dirs_exist_ok=True)
 elif p.is_file()and(p.suffix in ['.kicad_sch','.kicad_pro','.kicad_dru','.csv','.json']or p.name=='fp-lib-table'):shutil.copyfile(p,D/p.name)
f=S/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(f));old=k.VECTOR2I(k.FromMM(17.3025),k.FromMM(1.029999));new=k.VECTOR2I(k.FromMM(17.6025),k.FromMM(1.029999));changed=[]
for t in b.GetTracks():
 if t.GetStart()==old or t.GetEnd()==old:
  changed.append(t.m_Uuid.AsString())
  if isinstance(t,k.PCB_VIA):t.SetPosition(new)
  else:
   if t.GetStart()==old:t.SetStart(new)
   if t.GetEnd()==old:t.SetEnd(new)
assert len(changed)==3
k.ZONE_FILLER(b).Fill(b.Zones());out=D/f.name;k.SaveBoard(str(out),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True,stdout=subprocess.DEVNULL)
d=json.loads((D/'drc.json').read_text());r={'status':'TRIAL_NOT_ADOPTED','source_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'output_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'moved_via_dx_mm':.3,'changed_track_via_uuids':changed,'checks':{x:len(d[x])for x in ['violations','unconnected_items','schematic_parity']},'limits':['Mask and plane connectivity review still required','Existing fabrication exports and3D models refer to parent board']};(D/'review.json').write_text(json.dumps(r,indent=2));print(r)
