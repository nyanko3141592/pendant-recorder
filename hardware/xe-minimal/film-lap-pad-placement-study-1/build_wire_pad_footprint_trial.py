"""Dedicated manual wire-attachment footprint; not a sensor mounting footprint."""
from pathlib import Path
import pcbnew as k,wx,shutil,json,hashlib,subprocess
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-film-lap-connected-trial.kicad_pcb';b=k.LoadBoard(str(src));old=next(f for f in b.GetFootprints()if f.GetReference()=='TH1');nets={p.GetNumber():p.GetNet()for p in old.Pads()};b.RemoveNative(old);old.thisown=False
lib=O/'PendantWire.pretty';lib.mkdir(exist_ok=True);name='External_NTC_WirePads_P1.75_0.8x1.8';f=k.FOOTPRINT(b);f.SetFPID(k.LIB_ID('PendantWire',name));f.SetReference('REF**');f.SetValue('External NTC wire pads');f.SetAttributes(k.FP_SMD|k.FP_EXCLUDE_FROM_POS_FILES);f.Reference().SetVisible(False);f.Value().SetVisible(False)
def vec(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
ls=k.LSET();ls.AddLayer(k.F_Cu);ls.AddLayer(k.F_Mask)
for num,x in [('1',-.875),('2',.875)]:
 q=k.PAD(f);q.SetNumber(num);q.SetAttribute(k.PAD_ATTRIB_SMD);q.SetShape(k.PAD_SHAPE_RECT);q.SetLayerSet(ls);q.SetSize(vec(.8,1.8));q.SetPosition(vec(x,0));f.AddNative(q);q.thisown=False
corners=[(-1.425,-1.15),(1.525,-1.15),(1.525,1.15),(-1.425,1.15),(-1.425,-1.15)]
for a,c in zip(corners,corners[1:]):
 s=k.PCB_SHAPE(f);s.SetShape(k.SHAPE_T_SEGMENT);s.SetStart(vec(*a));s.SetEnd(vec(*c));s.SetLayer(k.F_CrtYd);s.SetWidth(k.FromMM(.05));f.AddNative(s);s.thisown=False
k.PCB_IO_MGR.FindPlugin(k.PCB_IO_MGR.KICAD_SEXP).FootprintSave(str(lib),f)
b.AddNative(f);f.thisown=False;f.Flip(vec(0,0),k.FLIP_DIRECTION_TOP_BOTTOM);f.SetPosition(vec(13.625,1.5));f.SetReference('TH1');f.SetValue('103JT-025 external - STUDY')
for p in f.Pads():p.SetNet(nets[p.GetNumber()])
t=O/'fp-lib-table';text=t.read_text()
if '(name "PendantWire")'not in text:text=text.rstrip()[:-1]+'\n(lib (name "PendantWire") (type "KiCad") (uri "${KIPRJMOD}/PendantWire.pretty") (options "") (descr "Seller-installed external sensor wire attachment"))\n)\n';t.write_text(text)
out=O/'pendant-xe-film-lap-footprint-trial.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--format','json','--severity-all','-o',str(O/'footprint-trial-drc.json')],check=True)
r=json.loads((O/'footprint-trial-drc.json').read_text());review={'status':'WIRE_PAD_FOOTPRINT_CANDIDATE_NOT_RELEASE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'footprint_sha256':hashlib.sha256((lib/(name+'.kicad_mod')).read_bytes()).hexdigest(),'drc_violations':len(r['violations']),'unconnected':len(r['unconnected_items']),'courtyard_margin_hypothesis_mm':{'left_of_pad_1':.15,'other_outer_edges':.25},'pads':[{'number':p.GetNumber(),'net':p.GetNetname(),'pcb_xy_mm':[k.ToMM(p.GetPosition().x),k.ToMM(p.GetPosition().y)]}for p in f.Pads()],'limits':['External sensor attachment excluded from automated placement; seller joining process remains unqualified.','Courtyard uses a provisional 0.15 mm left margin and 0.25 mm other margins; it is not a qualified tool/strain-relief envelope. Q6 pad 3 right edge is x=11.705 mm and wire pad 1 left edge x=12.35 mm; actual solder spread and positioning tolerance remain unqualified.','Schematic parity, component adoption and updated mechanical model remain incomplete.','No manufacturing release, order, physical test or runtime guarantee.']};(O/'footprint-trial-review.json').write_text(json.dumps(review,indent=2)+'\n');print(json.dumps(review,indent=2))
