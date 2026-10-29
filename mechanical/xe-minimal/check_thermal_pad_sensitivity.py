"""Necessary gap closure only; no pressure, tolerance or thermal qualification."""
from pathlib import Path
from itertools import product
import hashlib,json
O=Path(__file__).resolve().parent
source=O/'ncu-body-space-review.json'
s=json.loads(source.read_text())
# Recover board-to-max-battery distance from existing drawing-envelope study.
gap=s['rows'][0]['gap_to_battery_max_envelope_mm']+s['shape_dimensions_mm'][2]
assert abs(gap-2.42)<1e-9
rows=[]
for height,stand,thickness in product([.65,.8,.95],[0,.1,.2],[1.524,2.032]):
 air=gap-height-stand
 rows.append({'sensor_height_hypothesis_mm':height,'solder_standoff_hypothesis_mm':stand,'pad_nominal_mm':thickness,'gap_mm':round(air,6),'nominal_interference_mm':round(thickness-air,6),'compression_fraction_if_contact':round((thickness-air)/thickness,6) if thickness>=air else None,'geometric_contact_possible':thickness>=air})
r={'status':'NECESSARY_CONTACT_SCREEN_NOT_PAD_SELECTION','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'sensor_height_basis':'0.8 +/-0.15 interpreted drawing height, same interpretation as existing max-envelope screen; not verified production limits','board_to_max_battery_mm':gap,'candidate_sheet_names':['GPVOUS-0.060-01-0816','GPVOUS-0.080-01-0816'],'nominal_thickness_basis':'0.060 and0.080 inch x25.4; exact thickness tolerances and supply not established','manufacturer_authored_TDS':'https://www.mouser.com/datasheet/2/48/BERGQUIST_GAP_PAD_TGP_1000VOUS_en_GL-3432650.pdf','TDS_revision':'July2020','rows':rows,'conclusions':['1.524mm cannot bridge the1.77mm gap in the minimum-height, zero-standoff case:0.246mm nominal clearance remains even with maximum battery envelope.','2.032mm gives12.89%-37.5% nominal compression in these limited cases; this does not establish acceptable pressure or reliable contact.','A thinner actual battery increases the gap if bottom seating stays fixed; no minimum battery thickness is established.','55kPa is typical Young modulus, not an allowable cell contact pressure. No force approval inferred.'],'limits':['No pad thickness tolerance, print tolerance, PCB seating, swelling or pad relaxation included.','No permitted cell compressive load established.','Do not reuse1.016mm TDS thermal impedance values for1.524/2.032mm pads.','No assembly geometry adopted; thermal lag, retention and electrical insulation remain unqualified.']}
# The historical guide contains both general +/-10% and VO-family +/-5%.
# Keep both as scenarios; neither is an exact-SKU production specification.
tolerance_rows=[]
for nominal,tol in product([1.524,2.032],[.05,.10]):
 low,high=nominal*(1-tol),nominal*(1+tol)
 tolerance_rows.append({'nominal_mm':nominal,'fractional_tolerance_scenario':tol,'thickness_range_mm':[round(low,6),round(high,6)],'margin_at_largest_gap_mm':round(low-1.77,6),'max_compression_at_smallest_gap':round((high-1.27)/high,6),'additional_gap_before_contact_loss_mm':round(low-1.77,6) if low>=1.77 else None})
r['historical_tolerance_reference']={'url':'https://dm.henkel-dam.com/is/content/henkel/Henkel_TIM_Guide_082917_US_LRpdf','general_FAQ_pdf_page_10':'Materials over10mil: +/-10%','ordering_pdf_page_106':'GAP PAD VO +/-5%; GAP PAD S-Class +/-10%','applicability':'Ambiguous for current exact VO Ultra Soft SKU; both sensitivity assumptions only, not certified bounds','pressure_reference':'FAQ refers to Application Note116 pressure-versus-deflection curves; not yet obtained'}
r['thickness_tolerance_scenarios']=tolerance_rows
r['conclusions'].append('At2.032mm nominal and-10% thickness, only0.0588mm extra gap remains in the1.77mm case. Unspecified cell thickness and seating variation can consume this margin.')
r['limits'][0]='Pad tolerance is sensitivity only; print tolerance, PCB seating, swelling and pad relaxation are omitted.'
(O/'thermal-pad-thickness-sensitivity.json').write_text(json.dumps(r,indent=2)+'\n')
for t in [1.524,2.032]:
 v=[x for x in rows if x['pad_nominal_mm']==t]
 print(t,'contact cases',sum(x['geometric_contact_possible'] for x in v),'/',len(v),'gap range',min(x['gap_mm'] for x in v),max(x['gap_mm'] for x in v))
