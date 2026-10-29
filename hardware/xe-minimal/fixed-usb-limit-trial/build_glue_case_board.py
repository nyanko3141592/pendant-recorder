"""Remove obsolete screw-only hole for the user-authorized adhesive case."""
from pathlib import Path
import pcbnew as k,wx,shutil,json,subprocess,hashlib
app=wx.App(False);D=Path(__file__).resolve().parent;S=D/'pdm-stitch-trial';O=D/'glue-case-trial';O.mkdir(exist_ok=True);stem='pendant-xe-minimal'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(S/(stem+ext),O/(stem+ext))
for lib in S.glob('*.pretty'):shutil.copytree(lib,O/lib.name,dirs_exist_ok=True)
shutil.copyfile(S/'fp-lib-table',O/'fp-lib-table')
for name in ['bom.csv','design.json','connections.csv']:
 src=D/'led-land-trial'/name
 if src.exists():shutil.copyfile(src,O/name)
p=S/(stem+'.kicad_pcb');b=k.LoadBoard(str(p));holes=[f for f in b.GetFootprints()if f.GetReference()=='H4'];assert len(holes)==1
h=holes[0];assert all(q.GetAttribute()==k.PAD_ATTRIB_NPTH and q.GetNetCode()==0 for q in h.Pads())
removed={'reference':'H4','uuid':h.m_Uuid.AsString(),'position_mm':[k.ToMM(h.GetPosition().x),k.ToMM(h.GetPosition().y)],'drills_mm':[[k.ToMM(q.GetDrillSize().x),k.ToMM(q.GetDrillSize().y)]for q in h.Pads()]}
b.RemoveNative(h);k.ZONE_FILLER(b).Fill(b.Zones());out=O/(stem+'.kicad_pcb');k.SaveBoard(str(out),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drc.json')],check=True,stdout=subprocess.DEVNULL)
r=json.loads((O/'drc.json').read_text());assert all(not r[x]for x in ['violations','unconnected_items','schematic_parity'])
def signature(t):
 via=isinstance(t,k.PCB_VIA)
 return [t.GetNetname(),t.GetStart().x,t.GetStart().y,t.GetEnd().x,t.GetEnd().y,t.GetLayer(),t.GetWidth(t.TopLayer())if via else t.GetWidth(),t.GetDrillValue()if via else None]
old=k.LoadBoard(str(p));new=k.LoadBoard(str(out));assert {t.m_Uuid.AsString():signature(t)for t in old.GetTracks()}=={t.m_Uuid.AsString():signature(t)for t in new.GetTracks()}
r={'status':'ADHESIVE_CASE_BOARD_CANDIDATE_NOT_RELEASED','source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'pcb_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'removed':removed,'retained_tracks_vias':len(list(new.GetTracks())),'footprints':len(list(new.GetFootprints())),'checks':{x:len(r[x])for x in ['violations','unconnected_items','schematic_parity']},'limits':['Zone fill changed around removed NPTH; CAM review required','New 3D and fabrication exports required','Battery lead fit, adhesive joint and runtime not qualified']};(O/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
