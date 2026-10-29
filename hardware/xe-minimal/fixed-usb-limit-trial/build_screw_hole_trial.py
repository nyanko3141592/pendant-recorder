from pathlib import Path
import shutil,json,subprocess,hashlib
import pcbnew as k,wx
app=wx.App(False)
D=Path(__file__).resolve().parent;S=D/'tps22950-19k1-candidate';O=D/'screw-hole-trial';O.mkdir(exist_ok=True);name='pendant-xe-minimal'
for f in S.iterdir():
 if f.is_file() and f.suffix in ['.kicad_pro','.kicad_dru','.kicad_sch','.kicad_sym'] or f.name in ['fp-lib-table','sym-lib-table']:shutil.copyfile(f,O/f.name)
for d in S.iterdir():
 if d.is_dir() and d.name.endswith('.pretty'):shutil.copytree(d,O/d.name,dirs_exist_ok=True)
b=k.LoadBoard(str(S/(name+'.kicad_pcb')))
ids=['4b86ed9e-facc-4c8e-ba2e-4235a349e744','a0177bd2-96bd-4124-86a1-4fab46461445']
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() not in ids:continue
 pts=[t.GetStart(),k.VECTOR2I(k.FromMM(16.9),k.FromMM(25.0)),k.VECTOR2I(k.FromMM(19.1),k.FromMM(25.0)),t.GetEnd()]
 for a,z in zip(pts,pts[1:]):
  n=k.PCB_TRACK(b);n.SetStart(a);n.SetEnd(z);n.SetWidth(t.GetWidth());n.SetLayer(t.GetLayer());n.SetNetCode(t.GetNetCode());b.Add(n)
 b.RemoveNative(t)
f=k.FOOTPRINT(b);f.SetReference('H4');f.SetValue('M1 clearance candidate');f.SetAttributes(k.FP_BOARD_ONLY|k.FP_EXCLUDE_FROM_BOM|k.FP_EXCLUDE_FROM_POS_FILES);f.SetPosition(k.VECTOR2I(k.FromMM(18),k.FromMM(26)))
p=k.PAD(f);p.SetAttribute(k.PAD_ATTRIB_NPTH);p.SetShape(k.PAD_SHAPE_CIRCLE);p.SetSize(k.VECTOR2I(k.FromMM(1.3),k.FromMM(1.3)));p.SetDrillSize(p.GetSize());p.SetLayerSet(k.LSET.AllCuMask());p.SetPosition(f.GetPosition());p.SetLocalClearance(k.FromMM(.25));f.Add(p)
g=k.PCB_SHAPE(f);g.SetShape(k.SHAPE_T_CIRCLE);g.SetCenter(f.GetPosition());g.SetEnd(k.VECTOR2I(k.FromMM(18.7),k.FromMM(26)));g.SetLayer(k.F_CrtYd);g.SetWidth(k.FromMM(.05));f.Add(g)
b.AddNative(f);f.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());out=O/(name+'.kicad_pcb');k.SaveBoard(str(out),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
x=json.loads((O/'drc.json').read_text());print({q:len(x[q])for q in ['violations','unconnected_items','schematic_parity']});print([(v['type'],v['description'])for v in x['violations']][:20])
