"""Declare required process on the two existing pad vias; no copper geometry change."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib,shutil,subprocess
app=wx.App(False);o=Path(__file__).resolve().parent;src=o/'pendant-xe-minimal';dst=o/'filled-capped-process-candidate'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
active=json.loads((o/'active-design.json').read_text())
assert sha(src.with_suffix('.kicad_pcb'))==active['sha256'][src.with_suffix('.kicad_pcb').name]
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));audit=json.loads((o/'exact-via-pad-overlap-audit.json').read_text());assert audit['board_sha256']==sha(src.with_suffix('.kicad_pcb'))
rows=[]
for row in audit['vias']:
 t=next(t for t in b.GetTracks() if t.m_Uuid.AsString()==row['uuid']);d=k.ToMM(t.GetDrillValue());w=k.ToMM(t.GetWidth(k.B_Cu));hits=[]
 for hit in row['hits']:
  f=next(f for f in b.GetFootprints() if f.GetReference()==hit['ref']);p=next(p for p in f.Pads() if p.GetNumber()==hit['pad']);paste=p.GetSolderPasteMargin(k.B_Paste)
  hits.append(dict(hit,pad_center_mm=[k.ToMM(p.GetPosition().x),k.ToMM(p.GetPosition().y)],pad_size_mm=[k.ToMM(p.GetSize().x),k.ToMM(p.GetSize().y)],mask_expansion_mm=k.ToMM(p.GetSolderMaskExpansion(k.B_Mask)),paste_margin_mm=[k.ToMM(paste.x),k.ToMM(paste.y)]))
 t.SetFillingMode(k.FILLING_MODE_FILLED);t.SetCappingMode(k.CAPPING_MODE_CAPPED)
 rows.append(dict(uuid=row['uuid'],xy_mm=row['xy_mm'],drill_mm=d,copper_diameter_mm=w,nominal_annular_ring_mm=(w-d)/2,published_diameter_screen_pass=d>=.15 and w>=d+.15,hits=hits))
k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(o/'filled-capped-process-drc.json')],check=True)
r=json.loads((o/'filled-capped-process-drc.json').read_text())
result={'status':'PROCESS_SPECIFIED_QUALIFICATION_PENDING','source_sha256':sha(src.with_suffix('.kicad_pcb')),'candidate_sha256':sha(dst.with_suffix('.kicad_pcb')),'vias':rows,'physical_violations':len(r['violations']),'parity_violations':len(r['schematic_parity']),'unconnected_items':len(r['unconnected_items']),'mask_stencil_review':'Both pads have zero effective mask/paste margin. The via copper exceeds the narrow pad width; retain pad-defined paste and qualify partial-overlap filling/capping and mask registration. No extra via paste aperture.','limitations':['Nominal annular ring excludes drill registration and fabrication tolerances.','KiCad flags express fabrication intent; Gerber alone does not order a filled/capped process.','Final mask Gerbers, stencil, flatness and assembly acceptance remain unqualified.'],'adopted':False}
(o/'filled-capped-process-review.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
