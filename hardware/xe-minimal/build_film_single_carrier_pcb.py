"""Current film one-unit panel integration; nominal sharp slots, not released."""
from pathlib import Path
import json,hashlib,shutil
import pcbnew as k,wx
app=wx.App(False);P=Path(__file__).resolve().parent;src=P/'film-integration-trial/pendant-xe-minimal.kicad_pcb';sha=hashlib.sha256(src.read_bytes()).hexdigest()
assert sha=='85721b062eadb1cf1309f0fda7117d65f9eda037e773e49d467361cdcd6254f6'
D=P/'film-single-carrier-trial';D.mkdir(exist_ok=False);dst=D/'panel.kicad_pcb'
for ext in ['.kicad_pro','.kicad_dru']:
 f=src.with_suffix(ext)
 if f.exists():shutil.copyfile(f,D/('panel'+ext))
f=src.parent/'fp-lib-table'
if f.exists():(D/'fp-lib-table').write_text(f.read_text().replace('${KIPRJMOD}',str(src.parent)))
b=k.LoadBoard(str(src));counts=[len(list(b.GetFootprints())),len(list(b.GetTracks())),len(list(b.Zones()))];delta=k.VECTOR2I(k.FromMM(23),k.FromMM(21.5))
for collection in [b.GetFootprints(),b.GetTracks(),b.Zones()]:
 for obj in collection:obj.Move(delta)
for obj in list(b.GetDrawings()):
 if obj.GetLayer()==k.Edge_Cuts:b.RemoveNative(obj)
 else:obj.Move(delta)
def add(o):b.AddNative(o);o.thisown=False
def vec(xy):return k.VECTOR2I(k.FromMM(xy[0]),k.FromMM(xy[1]))
for ring in json.loads((P/'single-carrier-outline-rings.json').read_text()):
 for a,z in zip(ring,ring[1:]):
  line=k.PCB_SHAPE();line.SetShape(k.SHAPE_T_SEGMENT);line.SetStart(vec(a));line.SetEnd(vec(z));line.SetLayer(k.Edge_Cuts);line.SetWidth(k.FromMM(.05));add(line)
tooling=json.loads((P/'single-carrier-tooling-review.json').read_text())
for h in tooling['tooling_holes']:
 f=k.FOOTPRINT(b);f.SetReference(h['id']);f.SetValue('Carrier tooling NPTH');f.SetPosition(vec(h['center_mm']));f.SetAttributes(k.FP_EXCLUDE_FROM_BOM|k.FP_EXCLUDE_FROM_POS_FILES)
 pad=k.PAD(f);pad.SetAttribute(k.PAD_ATTRIB_NPTH);pad.SetShape(k.PAD_SHAPE_CIRCLE);pad.SetSize(vec([2,2]));pad.SetDrillSize(vec([2,2]));pad.SetLayerSet(k.LSET.AllCuMask());pad.SetPosition(vec(h['center_mm']));f.Add(pad);add(f)
for h in tooling['fiducials']:
 for side,layer,mask in [('F',k.F_Cu,k.F_Mask),('B',k.B_Cu,k.B_Mask)]:
  f=k.FOOTPRINT(b);f.SetReference(h['id']+side);f.SetValue('Carrier fiducial');f.SetPosition(vec(h['center_mm']));f.SetLayer(layer);f.SetAttributes(k.FP_EXCLUDE_FROM_BOM|k.FP_EXCLUDE_FROM_POS_FILES)
  pad=k.PAD(f);pad.SetAttribute(k.PAD_ATTRIB_SMD);pad.SetShape(k.PAD_SHAPE_CIRCLE);pad.SetSize(vec([1,1]));ls=k.LSET();ls.AddLayer(layer);ls.AddLayer(mask);pad.SetLayerSet(ls);pad.SetLocalSolderMaskMargin(k.FromMM(.5));pad.SetPosition(vec(h['center_mm']));f.Add(pad);add(f)
k.SaveBoard(str(dst),b);assert hashlib.sha256(src.read_bytes()).hexdigest()==sha
r={'status':'CURRENT_SINGLE_UNIT_MERGE_NOT_RELEASED','source_sha256':sha,'output_sha256':hashlib.sha256(dst.read_bytes()).hexdigest(),'source_counts':counts,'output_counts':[len(list(b.GetFootprints())),len(list(b.GetTracks())),len(list(b.Zones()))],'translation_mm':[23,21.5],'limits':['Nominal sharp slot outline; router-compensated outline not incorporated.','No zone refill or DRC yet.','Fiducial and tooling library/courtyard metadata not finalized.','Schematic parity applies to original unit; carrier has no separate schematic.','Cut method, fixture strength, sourcing and case/physical validations outstanding.']};(D/'merge-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
