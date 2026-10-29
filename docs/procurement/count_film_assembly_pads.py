"""Current candidate counts; physical solder pads are not supplier billable joints."""
import pcbnew,json,wx,hashlib,csv
from pathlib import Path
from collections import Counter
app=wx.App(False)
R=Path(__file__).resolve().parents[2]
D=R/'hardware/xe-minimal/film-integration-trial'
pcb=D/'pendant-xe-minimal.kicad_pcb';bom=D/'reconciled-candidate-bom.csv'
with bom.open() as f: refs={r['Reference']:r for r in csv.DictReader(f)}
b=pcbnew.LoadBoard(str(pcb));rows=[];excluded=[]
for f in b.GetFootprints():
 ref=f.GetReference()
 if ref not in refs:
  excluded.append(ref);continue
 spec=refs[ref];counts=Counter()
 for p in f.Pads():
  attr=p.GetAttribute()
  counts['smd_pads' if attr==pcbnew.PAD_ATTRIB_SMD else 'plated_through_pads' if attr==pcbnew.PAD_ATTRIB_PTH else 'other_pads']+=1
 assert f.GetValue()==spec['Schematic_value'],ref
 assert f.GetFPID().GetLibItemName()==spec['Footprint'].split(':',1)[1],ref
 rows.append({'reference':ref,'mpn':spec['Candidate_MPN'],'side':'bottom' if f.IsFlipped() else 'top','process':spec['Assembly_process'],**{k:counts[k] for k in ['smd_pads','plated_through_pads','other_pads']}})
assert {r['reference'] for r in rows}==set(refs)
auto=[r for r in rows if r['process']=='PCB_ASSEMBLY_CANDIDATE'];manual=[r for r in rows if r['process']=='SELLER_EXTERNAL_SENSOR_INSTALL']
summary={'pcb_assembly_components_per_unit':len(auto),'seller_external_sensors_per_unit':len(manual),'pcb_assembly_components_five':5*len(auto),'sides':dict(Counter(r['side'] for r in auto)),'pcb_assembly_unique_mpn':len({r['mpn']for r in auto}),'pcb_assembly_unique_mpn_side_pairs':len({(r['mpn'],r['side'])for r in auto}),'pcb_assembly_pad_counts_per_unit':{k:sum(r[k]for r in auto)for k in ['smd_pads','plated_through_pads','other_pads']},'seller_sensor_attachment_pad_counts_per_unit':{k:sum(r[k]for r in manual)for k in ['smd_pads','plated_through_pads','other_pads']}}
out={'status':'CURRENT_CAD_COUNTS_NOT_ASSEMBLER_QUOTE','sources_sha256':{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest()for p in [pcb,bom]},'summary':summary,'rows':sorted(rows,key=lambda r:r['reference']),'excluded_non_bom_footprints':sorted(excluded),'limits':['No placement orientation, nozzle, tape packaging or assembler acceptance qualification.','MPN/side groups inform attrition and setup; neither number is a confirmed billed feeder count.','Physical pads are not automatically billed solder joints, especially USB shell/through-hole stakes and thermal pads.','External sensor wire joints, insulation and strain relief add seller operations beyond two PCB attachment pads.','TH1 is excluded from automated placement; battery is not sold.']}
(R/'docs/procurement/xe-film-assembly-counts.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(summary))
