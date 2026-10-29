from pathlib import Path
import csv,json,hashlib,zipfile
P=Path(__file__).resolve().parent;O=P/'manufacturing-review-storage-r6'
m=json.loads((O/'manifest.json').read_text())
for n,h in m['files'].items():assert hashlib.sha256((O/n).read_bytes()).hexdigest()==h,n
# Tie the inspection records to both working sources and packaged sources.
change=json.loads((O/'storage-cap-candidate-change.json').read_text())
for name,expected in change['sha256'].items():
 assert hashlib.sha256((P/name).read_bytes()).hexdigest()==expected,('working source/report changed',name)
 packed=(O/'source'/('pendant-v12-review.'+name.split('.')[-1])) if name.endswith(('.kicad_pcb','.kicad_sch')) else O/name
 assert hashlib.sha256(packed.read_bytes()).hexdigest()==expected,('packaged source/report mismatch',name)
assert m['board_sha256']==change['sha256']['storage-4gb-4u7-candidate.kicad_pcb']
erc=json.loads((O/'storage-4gb-4u7-erc.json').read_text())
drc=json.loads((O/'storage-4gb-4u7-drc.json').read_text())
assert not any(sheet['violations'] for sheet in erc['sheets'])
assert not drc['violations'] and not drc['unconnected_items'] and not drc['schematic_parity']
bom={}
for r in csv.DictReader((O/'BOM-JLC-CANDIDATE-NOT-RELEASED.csv').open()):
 for ref in r['Designator'].split(','):
  assert ref not in bom; bom[ref]=r
cpl=list(csv.DictReader((O/'CPL-JLC-CANDIDATE-NOT-RELEASED.csv').open()));assert len(cpl)==66 and len({r['Designator'] for r in cpl})==66
assert set(bom)=={r['Designator'] for r in cpl}
assert bom['U11']['LCSC Part #']=='C5440134' and bom['U11']['Comment']=='CSNP32GCR01-BOW'
assert bom['C27']['LCSC Part #']=='C1705' and bom['C27']['Comment']=='CL10A475KP8NNNC'
positions={r['Ref']:r for r in csv.DictReader((O/'positions-kicad.csv').open())}
for part in json.loads((O/'part-match-candidates.json').read_text()):
 row=positions[part['ref']]
 assert row['Val']==part['design_value'],part['ref']
 assert row['Package']==part['footprint'].split(':')[-1],part['ref']
 assert bom[part['ref']]['LCSC Part #']==part['lcsc'],part['ref']
 assert bom[part['ref']]['Comment']==part['comment'],part['ref']
assert positions['U11']['Val']=='CSNP32GCR01-BOW' and positions['C27']['Val']=='4.7u effective TBD'
for row in cpl:
 p=positions[row['Designator']];assert row['Mid X']==p['PosX']+'mm' and row['Mid Y']==p['PosY']+'mm' and row['Rotation']==p['Rot']
 assert row['Layer']==('Top' if p['Side']=='top' else 'Bottom')
with zipfile.ZipFile(P/(O.name+'-NOT-RELEASED.zip')) as z:
 assert z.testzip() is None
 for f in O.rglob('*'):
  if f.is_file():assert z.read(str(f.relative_to(P)))==f.read_bytes()
# A Gerber-only upload archive avoids accidentally uploading source/audit files.
q=P/'V12-R6-STORAGE-GERBER-QUOTE-ONLY.zip'
with zipfile.ZipFile(q,'w',zipfile.ZIP_DEFLATED) as z:
 for f in sorted((O/'gerber').iterdir()):
  if f.is_file():z.write(f,f.name)
result={'status':'PASS_REVIEW_PACKAGE_NOT_RELEASE','files_hashed':len(m['files']),'assembly_refs':len(bom),'source_report_package_hash_chain':True,'all66_design_values_and_footprints_match_export':True,'erc_drc_parity_clean':True,'bom_cpl_reference_sets_equal':True,'C27':'C1705','U11':'C5440134','cpl_matches_kicad_export':True,'zip_crc_and_file_bytes':True,'quote_zip':q.name,'quote_zip_sha256':hashlib.sha256(q.read_bytes()).hexdigest(),'scope_limit':'Candidate codes only; not JLC stock/acceptance, rotation qualification, physical electrical verification or shipping quotation.'}
(P/'storage-r6-bundle-verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
