"""Conservative planar U-turn of factory leads at pack end; no bend-radius approval."""
from pathlib import Path
import json,math
P=Path(__file__).resolve().parent
rows=[]
for wall in [.8,1,1.2]:
 for radius in [.5,.75,1,1.5]:
  od=.6;front_clearance=.3;rear_clearance=.2
  required=27+2*wall+front_clearance+rear_clearance+radius+od/2
  rows.append(dict(wall_mm=wall,wire_outer_diameter_assumed_mm=od,bend_centerline_radius_assumed_mm=radius,pack_end_clearance_required_mm=radius+od/2+rear_clearance,required_case_length_mm=round(required,3),within30mm=required<=30,uturn_wire_length_mm=round(math.pi*radius,3),wire_length_remaining_at12mm_min_mm=round(12-math.pi*radius,3)))
r=dict(status='WIRE_EXIT_CONSTRAINT_SCREEN_NOT_FIT_APPROVAL',battery='DTP401525-XE',source_pack_max_length_mm=27,source_wire_length_mm=[12,18],case_limit_mm=[30,30,15],model='Leads initially leave pack along its long axis;180degree semicircular turn folds them above pack. Additional connector approach length and3D crossings excluded.',assumptions=['Wire outer diameter0.6mm is assumed, not established by AWG30 conductor size','Front clearance0.3mm, rear clearance0.2mm are design allocations','No manufacturer minimum bend radius established; passing rows are not permissible-radius approvals','No swelling/thickness tolerance or full connector insertion verification'],rows=rows,finding='With1.2mm walls even assumed0.5mm radius requires30.7mm. At0.8mm walls only0.5mm radius screen passes29.9mm, a tight bend not qualified. Need actual lead exit geometry/OD/bend evidence before declaring30mm fit; do not force tight bend or enlarge case silently.',new_alternative_lead={'model':'TinyCircuitsASR00003','source':'https://tinycircuits.com/products/lithium-ion-polymer-battery-3-7v-150mah','capacity_mAh':150,'published_size_max_mm':[23,22,5.5],'wire_length_mm':[15,35],'connector':'JST SHR-02V-S-B','max_charge_discharge_mA':150,'decision':'Unselected contingency only; domestic single-unit availability and full datasheet not verified. XE baseline preserved.'},release_allowed=False)
(P/'wire-exit-screen.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
