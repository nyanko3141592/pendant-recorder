"""Reconcile live schematic identity; output engineering quantities, never orders."""
from pathlib import Path
import csv, hashlib, json, subprocess, xml.etree.ElementTree as ET
from collections import defaultdict
O = Path(__file__).resolve().parent / 'film-integration-trial'
cli = '/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli, 'sch', 'export', 'netlist', '--format', 'kicadxml', '--output', str(O/'identity-netlist.xml'), str(O/'pendant-xe-minimal.kicad_sch')], check=True, capture_output=True)
components = ET.parse(O/'identity-netlist.xml').findall('./components/comp')
refs = [c.attrib['ref'] for c in components]
assert len(refs) == len(set(refs)), 'Duplicate schematic references'
with (O/'candidate-mpn-review.csv').open() as f:
    candidates = list(csv.DictReader(f))
assert len(candidates) == len({r['Reference'] for r in candidates}), 'Duplicate candidate references'
by_ref = {r['Reference']: r for r in candidates}
rows, excluded, issues = [], [], []
groups = defaultdict(list)
for c in components:
    ref = c.attrib['ref']
    value, footprint = c.findtext('value'), c.findtext('footprint')
    omit = any(p.get('name') == 'exclude_from_bom' for p in c.findall('property'))
    if omit:
        assert ref not in by_ref, f'Excluded component unexpectedly counted: {ref}'
        excluded.append({'reference': ref, 'value': value, 'footprint': footprint})
        continue
    assert ref in by_ref, f'Missing candidate: {ref}'
    r = by_ref[ref]
    assert r['Value'] == value, f'Value mismatch: {ref}'
    override = r.get('Candidate_footprint_override', '')
    if override:
        assert override == footprint, f'Footprint override mismatch: {ref}'
    mpn = r['MPN_written_in_source']
    assert mpn and footprint, f'Missing identity: {ref}'
    process = 'SELLER_EXTERNAL_SENSOR_INSTALL' if ref == 'TH1' else 'PCB_ASSEMBLY_CANDIDATE'
    notes = r['Remaining']
    if ref in ('Q6','Q7'):
        issues.append({'reference':ref,'schematic_value':value,'candidate_mpn':mpn,'resolution':'Explicit candidate adoption and electrical qualification required; do not order generic 2N7002 from the value field.'})
    row = {'Reference':ref,'Schematic_value':value,'Candidate_MPN':mpn,'Footprint':footprint,'Assembly_process':process,'Status':r['Status'],'Remaining':notes}
    rows.append(row)
    groups[(mpn,footprint,process)].append(row)
assert set(by_ref) == {r['Reference'] for r in rows}, 'Unmatched candidate rows'
with (O/'reconciled-candidate-bom.csv').open('w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
grouped=[]
for (mpn,footprint,process), members in sorted(groups.items()):
    grouped.append({'Candidate_MPN':mpn,'Footprint':footprint,'Assembly_process':process,'References':' '.join(r['Reference'] for r in members),'Qty_per_device':len(members),'Installed_qty_five_devices':5*len(members),'Purchase_qty':'UNRESOLVED_FEEDER_LOSS_MOQ_SPARES','Status':'ENGINEERING_CANDIDATE_NOT_ORDER_BOM'})
with (O/'five-unit-candidate-quantities.csv').open('w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=list(grouped[0]));w.writeheader();w.writerows(grouped)
report={'status':'IDENTITY_RECONCILED_NOT_QUALIFIED_OR_PRICED','source_sha256':{name:hashlib.sha256((O/name).read_bytes()).hexdigest() for name in ['pendant-xe-minimal.kicad_sch','candidate-mpn-review.csv','identity-netlist.xml']},'schematic_components':len(components),'candidate_references':len(rows),'grouped_mpn_footprint_process_rows':len(grouped),'installed_quantity_five_devices':sum(r['Installed_qty_five_devices'] for r in grouped),'explicit_exclusions':excluded,'identity_issues':issues,'limits':['Values match candidate table, not proof of electrical suitability.','Only explicit footprint overrides checked against candidate table; package compatibility not established for every MPN.','Installed quantities are not purchase quantities or feeder counts.','Battery excluded from sale. Wire, insulation, adhesive, case, fixtures, programming and assembly labor require separate materials/process costing.','TH1 is installed by seller, not a pick-and-place thermistor.','All candidate qualification statuses remain unchanged.']}
(O/'candidate-bom-reconciliation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({k:report[k] for k in ['schematic_components','candidate_references','grouped_mpn_footprint_process_rows','installed_quantity_five_devices']}))
