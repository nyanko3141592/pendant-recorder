"""Local ground-land adjustment reviewed against GCT USB4105 drawing B4.
NOT supplier DFM acceptance. Signal lands and locating holes remain unchanged.
"""
from pathlib import Path
import pcbnew as p,json
D=Path(__file__).resolve().parent;b=p.LoadBoard(str(D/'omi-fit-d1.kicad_pcb'))
f=next(f for f in b.GetFootprints() if f.GetReference()=='J1')
name='USB_C_GCT_USB4105_GroundLand112';lib=D/'PendantD1.pretty';lib.mkdir(exist_ok=True)
for a in f.Pads():
 if a.GetNumber() in ['A1','A12','B1','B12']:
  assert abs(p.ToMM(a.GetSize().x)-.6)<1e-6
  a.SetSize(p.VECTOR2I(p.FromMM(.6),p.FromMM(1.12)))
f.SetFPID(p.LIB_ID('PendantD1',name));f.SetLibDescription('GCT USB4105 B4: ground lands 0.60x1.12 mm (nominal recommendation 1.15 +/-0.05); NPTH unchanged. DFM review required.')
clone=p.FOOTPRINT(f);clone.SetPosition(p.VECTOR2I(0,0));p.PCB_IO_MGR.FindPlugin(p.PCB_IO_MGR.KICAD_SEXP).FootprintSave(str(lib),clone)
p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(D/'omi-fit-d1.kicad_pcb'),b)
old='Connector_USB:USB_C_Receptacle_GCT_USB4105-xx-A_16P_TopMnt_Horizontal';new='PendantD1:'+name
for file in ['design.json','parts.json','omi-fit-d1.kicad_sch','bom.csv','sourcing-candidates.json','sourcing-candidates.csv']:
 path=D/file;s=path.read_text();assert old in s;path.write_text(s.replace(old,new))
path=D/'fp-lib-table';s=path.read_text()
if '(name "PendantD1")' not in s:
 idx=s.rfind(')');s=s[:idx]+' (lib (name "PendantD1") (type "KiCad") (uri "${KIPRJMOD}/PendantD1.pretty") (options "") (descr "D1 audited local land patterns"))\n'+s[idx:]
path.write_text(s)
