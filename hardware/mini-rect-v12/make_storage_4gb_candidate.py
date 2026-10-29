from pathlib import Path
import json,shutil,hashlib
import pcbnew,wx
app=wx.App(False)
P=Path(__file__).resolve().parent
src=P/'iset-50pf-candidate.kicad_pcb';dst=P/'storage-4gb-candidate.kicad_pcb'
b=pcbnew.LoadBoard(str(src));f=next(f for f in b.GetFootprints() if f.GetReference()=='U11')
before={p.GetNumber():[p.GetPosition().x,p.GetPosition().y,p.GetNetname()] for p in f.Pads() if p.GetNumber()}
assert f.GetLayer()==pcbnew.B_Cu and f.GetOrientationDegrees()==0
aux=[p for p in f.Pads() if not p.GetNumber()];assert len(aux)==1
assert aux[0].GetFPRelativePosition()==pcbnew.VECTOR2I(0,-2500000)
aux[0].SetFPRelativePosition(pcbnew.VECTOR2I(0,-2600000))
f.SetValue('CSNP32GCR01-BOW');f.SetFPID(pcbnew.LIB_ID('Pendant','CSNP32GCR01_LGA8'))
assert before=={p.GetNumber():[p.GetPosition().x,p.GetPosition().y,p.GetNetname()] for p in f.Pads() if p.GetNumber()}
pcbnew.ZONE_FILLER(b).Fill(b.Zones());pcbnew.SaveBoard(str(dst),b)
s=(P/'iset-50pf-candidate.kicad_sch').read_text().replace('CSNP16GCR01-AOW','CSNP32GCR01-BOW').replace('CSNP16GCR01_AOW_LGA8','CSNP32GCR01_LGA8')
# Preserve library symbol default; only instance value describes the candidate.
s=s.replace('(property "Value" "CSNP32GCR01-BOW"','(property "Value" "CSNP16GCR01-AOW"',1)
(P/'storage-4gb-candidate.kicad_sch').write_text(s)
shutil.copyfile(P/'iset-50pf-candidate.kicad_pro',P/'storage-4gb-candidate.kicad_pro')
sourcing=json.loads((P/'sourcing-iset-50pf-candidate.json').read_text());sourcing.setdefault('U11',{}).update(mpn='CSNP32GCR01-BOW',lcsc='C5440134',source='https://jlcpcb.com/partdetail/6320934-CS_SDNAND_32Gb_SPISDIO/C5440134',note='Candidate only: footprint auxiliary pad shifted0.1mm; no assembly approval; transient battery load unqualified',assembly_accepted=False)
(P/'sourcing-storage-4gb-candidate.json').write_text(json.dumps(sourcing,indent=2)+'\n')
(P/'storage-4gb-candidate-change.json').write_text(json.dumps({'status':'NOT_RELEASED','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'signal_pad_positions_and_nets_unchanged':before,'aux_relative_mm_before':[0,-2.5],'aux_relative_mm_after':[0,-2.6],'netlist_change':False,'limitations':['Auxiliary pad paste/electrical role needs assembly qualification','No runtime or peak battery current validation','Baseline quote and manufacturing package unchanged']},indent=2)+'\n')
print(dst)
