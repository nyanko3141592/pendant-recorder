"""Reconcile current assembly refs and quantities; never infer procurement approval."""
from pathlib import Path
import csv,json,hashlib,collections
ROOT=Path(__file__).resolve().parents[2]
SRC=ROOT/'hardware/mini-rect-v15/input-control-pa2-pb5/manufacturing-review'
rows=list(csv.DictReader((SRC/'BOM-ENGINEERING-REVIEW.csv').open()))
cpl=list(csv.DictReader((SRC/'CPL-ENGINEERING-REVIEW.csv').open()))
refs=[x['Reference'] for x in rows]
assert len(refs)==len(set(refs))==85
assert set(refs)=={x['Designator'] for x in cpl}
# Explicit MPN strings in the design are candidates, not manufacturer qualification.
mpn={'U1':'STM32U535CEU6','SW1':'B3U-1000P','J1':'USB4105-GF-A','U2':'USBLC6-2P6','U3':'BQ25185DLHR','J2':'781710003','U4':'TPS7A0233PDBVR','U8':'IM69D130V01XTSA1','U10':'TPS22916CYFPR','U12':'TLV7042DDFR','J4':'DM3D-SF','TH1':'NCP18XH103F03RB','U13':'MAX4995CAUT+T','U14':'SN74HCS74DYYR','U15':'TLV803EB29DBZR'}
resistor_review=json.loads((ROOT/'docs/procurement/v15-resistor-candidates.json').read_text())
resistor_review['entries']+=json.loads((ROOT/'docs/procurement/v15-capacitor-candidates.json').read_text())['entries']
resistor_review['entries']+=json.loads((ROOT/'docs/procurement/v15-mosfet-candidates.json').read_text())['entries']
resistor_review['entries']+=json.loads((ROOT/'docs/procurement/v15-final-mpn-candidates.json').read_text())['entries']
for item in resistor_review['entries']:
 assert item['reference'] in refs
 assert next(r['Design value'] for r in rows if r['Reference']==item['reference'])==item['design_value']
 mpn[item['reference']]=item['mpn']
candidate_requirements={item['reference']:item['remaining'] for item in resistor_review['entries']}
groups=collections.defaultdict(list)
for row in rows:groups[(row['Design value'],row['Footprint'],mpn.get(row['Reference'],''))].append(row['Reference'])
lines=[]
for (value,footprint,part),members in groups.items():
 needs=['Supplier SKU, availability, minimum order, attrition and assembly acceptance']
 if not part:needs.append('Exact manufacturer orderable part number')
 if members[0].startswith('C'):needs.append('Voltage rating, tolerance, dielectric, effective capacitance at bias and height')
 if members[0].startswith('R'):needs.append('Resistance tolerance, power and working voltage')
 if members[0].startswith('Q'):needs.append('Proposed BSS138BK substitution not adopted in board; minimum gate drive, temperature, leakage and capacitance validation pending')
 if 'tentative' in value or 'TBD' in value:needs.append('Design value still tentative')
 for member in members:
  needs.extend(x for x in candidate_requirements.get(member,[]) if x not in needs)
 lines.append(dict(references=sorted(members),design_value=value,footprint=footprint,candidate_mpn=part or None,per_board=len(members),installed_quantity_for_five=5*len(members),procurement_quantity=None,unit_price=None,currency=None,qualification='NOT_RELEASED',remaining=needs))
assert sum(x['installed_quantity_for_five'] for x in lines)==425
r=dict(status='QUANTITIES_RECONCILED_PRICING_AND_QUALIFICATION_INCOMPLETE',prototype_units=5,assembly_refs_per_board=85,installed_components=425,grouped_lines=len(lines),candidate_mpn_refs=len(mpn),unresolved_mpn_refs=85-len(mpn),source_hashes={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [SRC/'BOM-ENGINEERING-REVIEW.csv',SRC/'CPL-ENGINEERING-REVIEW.csv']},lines=lines,non_pcba_items=[dict(item=x,required_quantity=q,price=None) for x,q in [('DTP401525-XE protected connectorized battery',5),('Qualified microSD card at least2GB',5),('Case body',5),('Case lid',5),('Removable left support key (current comparison)',5),('Thermal contact material',5),('PORON support pads 2x2mm (three per unit; purchase full sheet)',15),('Pad adhesive pieces (three per unit; purchase pack/roll)',15),('Case closure tape (purchase pack/roll; not selected)',5),('Pendant cord/accessory set (not selected)',5),('SWD pogo fixture/cable set',1),('Debug probe (reuse ownership not confirmed)',1),('Assembly support fixture (not yet designed)',1),('USB-C data cable (reuse ownership not confirmed)',1)]],unpriced_services=['6-layer PCB fabrication','Double-sided assembly','Stencil/setup','Part sourcing and attrition','Case printing and finishing','Shipping per supplier','Japan tax/import fees','Foreign exchange conversion'],pricing_policy='Unknown costs remain null, never zero. Old revision quote totals are not used. Installed quantities exclude supplier attrition and MOQ. No orders or external uploads.')
r['non_pcba_scope']='Current removable-ledge/open-acoustic comparison only; no manufacturing adoption. Shared cavity has no separate microphone gasket. If acoustic design changes, add its selected material. Tools may be reused only after ownership/compatibility confirmation; unknown cost is not zero.'
out=ROOT/'docs/procurement/v15-five-unit-quantity-review.json';out.write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:r[k] for k in ['assembly_refs_per_board','installed_components','grouped_lines','candidate_mpn_refs','unresolved_mpn_refs']}))
