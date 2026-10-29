"""Add provisional panel features; not a manufacturing release."""
from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess
app=wx.App(False);p=Path(__file__).resolve().parent;d=p/'electrical-panel-candidate-v3';target=d/'panel.kicad_pcb';backup=d/'pre-process-features.kicad_pcb';assert not backup.exists();shutil.copyfile(target,backup);b=k.LoadBoard(str(target))
layout=json.loads((p/'supported-panel-topology-study.json').read_text());holes=json.loads((p/'assembly-mousebite-copper-screen.json').read_text())['holes'];tooling=json.loads((p/'panel-tooling-layout-study.json').read_text())
def add(obj):b.AddNative(obj);obj.thisown=False
def footprint(ref):
 f=k.FOOTPRINT(b);f.SetReference(ref);f.Reference().SetVisible(False);f.Value().SetVisible(False);f.SetAttributes(k.FP_EXCLUDE_FROM_BOM|k.FP_EXCLUDE_FROM_POS_FILES);return f
def pad(f,xy,diam,attr,layers,drill=0):
 q=k.PAD(f);q.SetNumber('');q.SetAttribute(attr);q.SetShape(k.PAD_SHAPE_CIRCLE);q.SetSize(k.VECTOR2I(round(diam*1e6),round(diam*1e6)));q.SetPosition(k.VECTOR2I(*(round(v*1e6) for v in xy)));q.SetLayerSet(layers)
 if drill:q.SetDrillSize(k.VECTOR2I(round(drill*1e6),round(drill*1e6)))
 f.AddNative(q);q.thisown=False;return q
for u in layout['units']:
 f=footprint(f'PERF{u["unit"]}');x,y=u['bounds_mm'][:2]
 for hole in holes:pad(f,[x+hole['hole_center_mm'][0],y+26.9],.5,k.PAD_ATTRIB_NPTH,k.LSET.AllCuMask(),.5)
 add(f)
for fid in tooling['fiducials']:
 for side,cu,mask in [('F',k.F_Cu,k.F_Mask),('B',k.B_Cu,k.B_Mask)]:
  f=footprint(fid['id']+side);f.SetLayer(cu);ls=k.LSET();ls.AddLayer(cu);ls.AddLayer(mask);q=pad(f,fid['center_mm'],1,k.PAD_ATTRIB_SMD,ls);q.SetLocalSolderMaskMargin(500000);add(f)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(target),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(target),'--format','json','--severity-all','-o',str(d/'process-features-drc.json')],check=True)
print('72 perforations and 6 fiducial pads added')
