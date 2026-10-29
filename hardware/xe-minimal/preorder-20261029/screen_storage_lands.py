"""Separate geometric screen; no adopted-board changes or fabrication claim."""
from pathlib import Path
import hashlib,json,shutil,subprocess,collections
import wx
import pcbnew as k
app=wx.App(False)
w=Path(__file__).resolve().parent
src=w.parent/'costdown/HW-V1.4-EVT-4LAYER-27P5/route/hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb'
before=hashlib.sha256(src.read_bytes()).hexdigest()
b=k.LoadBoard(str(src));fp=next(f for f in b.GetFootprints() if f.GetReference()=='U11')
original=[]
for p in fp.Pads():
 original.append({'number':p.GetNumber(),'size_mm':[k.ToMM(p.GetSize().x),k.ToMM(p.GetSize().y)]})
 if p.GetNumber():p.SetSize(k.VECTOR2I(k.FromMM(.85),k.FromMM(.85)))
 # Retain the existing auxiliary pad to isolate numbered-land growth.
# Maximum terminal square as conservative geometric screen, NOT a recommended solder land.
out=w/'storage-land-screen.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ('.kicad_pro','.kicad_dru','.kicad_sch'):shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--refill-zones','--save-board','--schematic-parity','--severity-all','--format','json','-o',str(w/'storage-land-drc.json'),str(out)],check=True)
d=json.loads((w/'storage-land-drc.json').read_text());types=collections.Counter(v['type'] for v in d['violations'])
r={'status':'GEOMETRIC_SCREEN_ONLY_NOT_ADOPTED','source_sha256':before,'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'test_land_mm':[.85,.85],'original_pads':original,'violations':dict(types),'geometric':sum(n for t,n in types.items() if t!='lib_footprint_issues'),'unconnected':len(d['unconnected_items']),'parity':len(d['schematic_parity']),'limits':['Value kept MK for controlled geometry comparison; not a CSNP production board','0.85mm square is screening geometry, not manufacturer recommended land/stencil','Unnumbered MK auxiliary pad retained; this is not the CSNP final footprint','No power/runtime/physical assembly qualification']}
assert before==hashlib.sha256(src.read_bytes()).hexdigest()
(w/'storage-land-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
