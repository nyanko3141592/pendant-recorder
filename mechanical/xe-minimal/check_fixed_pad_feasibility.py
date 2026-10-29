"""Necessary fixed-gap-pad compression bound, not cell force approval."""
from pathlib import Path
import json,hashlib
O=Path(__file__).resolve().parent
p=O/'thermal-pad-thickness-sensitivity.json';s=json.loads(p.read_text())
gmin=min(x['gap_mm'] for x in s['rows']);gmax=max(x['gap_mm'] for x in s['rows'])
rows=[]
for tol in [0,.05,.10]:
 # Contact in largest gap requires nominal*(1-tol)>=gmax.
 # This minimum nominal still compresses in the smallest gap.
 nominal=gmax/(1-tol)
 compression=1-gmin/(nominal*(1+tol))
 rows.append({'pad_fractional_tolerance_hypothesis':tol,'minimum_nominal_for_geometric_contact_mm':nominal,'unavoidable_compression_at_small_gap_fraction':compression,'linear_modulus_pressure_estimate_kPa':55*compression,'linear_modulus_force_estimate_for_2x2mm_N':55*compression*.004})
r={'status':'FIXED_PAD_NECESSARY_BOUND_NOT_APPROVED_DESIGN','source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'gap_range_mm':[gmin,gmax],'equations':['nominal_min = gap_max/(1-tolerance)','compression_at_small_gap = 1-gap_min/(nominal_min*(1+tolerance))'],'rows':rows,'interpretation':'Any fixed pad bridging the largest studied gap necessarily sees at least this compression at the smallest studied gap; positive preload requires more. Unknown battery and seating tolerances can widen the gap range further.','pressure_estimate_basis':'55kPa typical Young modulus from July2020 TGP1000VOUS TDS; linear uniform-strain hypothesis only.2x2mm is the existing investigation probe, not selected contact area.','historical_evidence':{'VOUS_2001_TDS':'https://docs.rs-online.com/daa0/0900766b800b6cd6.pdf','date':'2001-01-24','text':'8psi Young modulus; graphs generated from modulus,0.01in/min and0.79square-inch sample; thickness tolerance +/-5%','visual_status':'Web screenshot returned no image; direct download403. No curve points digitized.','Application_Note116':'https://thermal.henkel-adhesives.com/files/downloads/application-notes/APN-116-0309.pdf','retrieval':'Redirected to generic Henkel thermal-management webpage; note not obtained'},'design_decision':'Keep fixed-pad scheme unapproved. Evaluate reducing gap variation or a compliant sensor carrier before increasing pad thickness.','limits':['No permissible battery pressure/force established.','Sensor is smaller than2x2mm; local stress and nonuniform deformation invalidate use of this estimate as a maximum.','Current sheet formulation, relaxation, temperature dependence and rate effects not qualified.','No new sensor carrier design adopted; original no-user-solder requirement persists.']}
(O/'fixed-pad-feasibility-review.json').write_text(json.dumps(r,indent=2)+'\n')
for x in rows:print('tolerance',x['pad_fractional_tolerance_hypothesis'],'minimum compression',round(100*x['unavoidable_compression_at_small_gap_fraction'],2),'%')
