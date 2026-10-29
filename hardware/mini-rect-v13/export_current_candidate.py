"""Bind current board placement to schematic source and fit-model handoff."""
from pathlib import Path
import wx,pcbnew as k,json,hashlib
app=wx.App(False);P=Path(__file__).resolve().parent
src=P/'usb-ground-plane-candidate.kicad_pcb'
base=P/'power-width-candidate.kicad_pcb'
model=P/'acoustic-r13-placement-candidate.kicad_pcb'
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def placements(p):
 b=k.LoadBoard(str(p));rows={}
 for f in b.GetFootprints():
  ref=f.GetReference();assert ref not in rows
  rows[ref]={'ref':ref,'x_mm':k.ToMM(f.GetPosition().x),'y_mm':k.ToMM(f.GetPosition().y),'rotation_deg':f.GetOrientationDegrees(),'side':'B' if f.IsFlipped() else 'F','footprint':str(f.GetFPID().GetLibItemName()),'value':f.GetValue()}
 return rows
current,old,fit=placements(src),placements(base),placements(model)
assert set(current)==set(old)==set(fit)
assert current==fit,'Latest board does not match mechanical source placement'
diff=[{'ref':r,'before':old[r],'after':current[r]} for r in current if current[r]!=old[r]]
assert len(diff)==1 and diff[0]['ref']=='R13'
assert abs(diff[0]['after']['y_mm']-diff[0]['before']['y_mm']-.175)<1e-6
parity=json.loads(src.with_suffix('.parity.json').read_text())
assert parity['status']=='PASS' and parity['board_sha256']==digest(src)
assert parity['source_design_sha256']==digest(P/'design.json')
out={'status':'CURRENT_CANDIDATE_INDEX_NOT_ORDER_RELEASE','board':src.name,'sha256':digest(src),'schematic_source':'design.json','schematic_source_sha256':digest(P/'design.json'),'placement_source':'KiCad board is authoritative; design.json contains netlist, not placement','model_source_board':model.name,'model_source_sha256':digest(model),'model_placement_match':True,'placement_changes_from_four_layer_baseline':diff,'parts':sorted(current.values(),key=lambda x:x['ref']),'limitations':['Raw KiCad origins and rotations, NOT JLC placement CSV convention','Placement match does not certify component bodies or all assembly clearances','Six-layer board remains candidate; battery, storage power, harness, assembly orientation and quote gates open']}
(P/'current-candidate-index.json').write_text(json.dumps(out,indent=2)+'\n')
print('Verified',len(current),'parts; fit model placement matches; baseline diff:',[x['ref'] for x in diff])
