from pathlib import Path
import shutil,subprocess
import pcbnew as k,wx
app=wx.App(False)
o=Path(__file__).resolve().parent;d=o/'u10-paste-candidate';lib=d/'Pendant.pretty'
shutil.copytree(o.parent/'mini-rect-v15/Pendant.pretty',lib)
f=k.FootprintLoad(str(lib),'TPS22916_YFP4')
for p in list(f.Pads()):
 ls=p.GetLayerSet();ls.RemoveLayer(k.F_Paste);p.SetLayerSet(ls)
 a=k.PAD(f);a.SetNumber('');a.SetAttribute(k.PAD_ATTRIB_SMD);a.SetShape(k.PAD_SHAPE_ROUNDRECT);a.SetSize(k.VECTOR2I(250000,250000));a.SetRoundRectRadiusRatio(.2)
 ls=k.LSET();ls.AddLayer(k.F_Paste);a.SetLayerSet(ls);a.SetPosition(p.GetPosition());a.SetOrientation(p.GetOrientation());f.AddNative(a);a.thisown=False
k.FootprintSave(str(lib),f)
t=d/'fp-lib-table';s=t.read_text().replace(str(o)+'/../mini-rect-v15/Pendant.pretty',str(lib));t.write_text(s)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(d/'pendant-xe-minimal.kicad_pcb'),'--schematic-parity','--format','json','--severity-all','-o',str(d/'drc.json')],check=True)
