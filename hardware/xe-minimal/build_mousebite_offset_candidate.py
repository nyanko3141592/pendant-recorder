"""Isolated perforation feasibility candidate; not a panel or release board."""
from pathlib import Path
import shutil,json,hashlib,subprocess
import pcbnew as k,wx
app=wx.App(False)
p=Path(__file__).resolve().parent;src=p/'pendant-xe-minimal.kicad_pcb';sha=hashlib.sha256(src.read_bytes()).hexdigest()
s=json.loads((p/'assembly-mousebite-copper-screen.json').read_text());assert sha==s['source_pcb_sha256']
d=p/'mousebite-offset-candidate';d.mkdir(exist_ok=False)
for ext in ('.kicad_pcb','.kicad_pro','.kicad_dru','.kicad_sch'):shutil.copyfile(p/('pendant-xe-minimal'+ext),d/('pendant-xe-minimal'+ext))
(d/'fp-lib-table').write_text((p/'fp-lib-table').read_text().replace('${KIPRJMOD}',str(p)))
target=d/src.name;b=k.LoadBoard(str(target))
f=k.FOOTPRINT(b);f.SetReference('MP_PANEL');f.SetValue('PERFORATION_STUDY_NOT_RELEASED')
f.SetAttributes(k.FP_EXCLUDE_FROM_BOM | k.FP_EXCLUDE_FROM_POS_FILES)
f.Reference().SetVisible(False);f.Value().SetVisible(False)
for h in s['holes']:
 pad=k.PAD(f);pad.SetNumber('');pad.SetAttribute(k.PAD_ATTRIB_NPTH);pad.SetShape(k.PAD_SHAPE_CIRCLE)
 pad.SetSize(k.VECTOR2I(500000,500000));pad.SetDrillSize(k.VECTOR2I(500000,500000));pad.SetLayerSet(k.LSET.AllCuMask())
 pad.SetPosition(k.VECTOR2I(round(h['hole_center_mm'][0]*1e6),26900000))
 f.AddNative(pad);pad.thisown=False
b.AddNative(f);f.thisown=False
filler=k.ZONE_FILLER(b);filler.Fill(b.Zones());k.SaveBoard(str(target),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(target),'--format','json','--severity-all','-o',str(d/'drc.json')],check=True)
r=json.loads((d/'drc.json').read_text())
report={'status':'ISOLATED_HOLE_FEASIBILITY_NOT_ADOPTED','source_pcb_sha256':sha,'candidate_pcb_sha256':hashlib.sha256(target.read_bytes()).hexdigest(),'added_holes':len(s['holes']),'hole_center_y_mm':26.9,'hole_center_inset_mm':0.1,'change':'Hole centers moved outward by 0.15 mm; original profile unchanged','violations':r['violations'],'unconnected_items':r['unconnected_items'],'limitations':['Added holes on original profile only; no panel tabs, supporting rails or routing slots.','No schematic parity check: temporary mechanical footprint is intentionally absent from schematic.','No mechanical stress or assembly process qualification.']}
(d/'review.json').write_text(json.dumps(report,indent=2)+'\n')
assert hashlib.sha256(src.read_bytes()).hexdigest()==sha
print('violations',len(r['violations']),'unconnected',len(r['unconnected_items']))
