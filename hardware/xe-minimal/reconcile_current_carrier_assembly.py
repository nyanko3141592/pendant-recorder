"""Reconcile single-unit carrier raw positions and candidate procurement mapping."""
from pathlib import Path
import csv,json,hashlib,shutil
import pcbnew as k,wx
app=wx.App(False);P=Path(__file__).resolve().parent;S=P/'fixed-usb-limit-trial/ncu-sensor-trial';D=P/'current-single-carrier-trial/rounded-fabrication-review';pcb=D.parent/'panel-rounded.kicad_pcb';b=k.LoadBoard(str(pcb));a=k.LoadBoard(str(S/'pendant-xe-minimal.kicad_pcb'));fps={f.GetReference():f for f in b.GetFootprints()};orig={f.GetReference():f for f in a.GetFootprints()};pos=list(csv.DictReader((D/'positions-raw.csv').open()));bom=list(csv.DictReader((S/'candidate-mpn-review.csv').open()));refs={r['Reference'] for r in bom};expected_excluded=set(fps)-refs
assert len(pos)==len(bom)==75 and len({r['Ref'] for r in pos})==75 and {r['Ref'] for r in pos}==refs
for r in pos:
 f=fps[r['Ref']];q=orig[r['Ref']];p=f.GetPosition();old=q.GetPosition()
 assert (p.x-old.x,p.y-old.y)==(23000000,21500000)
 assert abs(float(r['PosX'])-k.ToMM(p.x))<1e-6 and abs(float(r['PosY'])+k.ToMM(p.y))<1e-6
 assert abs((float(r['Rot'])-f.GetOrientationDegrees()+180)%360-180)<1e-6
 assert r['Side']==('bottom' if f.IsFlipped() else 'top')
 assert r['Package']==str(f.GetFPID().GetLibItemName()) and r['Val']==str(f.GetValue())
shutil.copyfile(S/'candidate-mpn-review.csv',D/'candidate-mpn-review.csv');groups={}
for row in bom:groups.setdefault(row['MPN_written_in_source'],[]).append(row['Reference'])
with (D/'candidate-bom-grouped.csv').open('w',newline='') as out:
 w=csv.writer(out);w.writerow(['MPN_candidate','References','Installed_per_carrier','Installed_for_five_units','Purchase_quantity','Qualification'])
 for mpn,rr in sorted(groups.items()):w.writerow([mpn,','.join(sorted(rr)),len(rr),5*len(rr),'UNCONFIRMED','CANDIDATE_NOT_RELEASED'])
assert len(groups)==38
report={'status':'PLACEMENTS_AND_CANDIDATE_BOM_RECONCILED_NOT_ASSEMBLY_APPROVAL','source_pcb_sha256':hashlib.sha256(pcb.read_bytes()).hexdigest(),'positions':len(pos),'unique_candidate_mpns':len(groups),'installed_for_five_units':375,'excluded_features':sorted(expected_excluded),'coordinate_convention':'Absolute panel origin; CSVY=-KiCadY; no bottom X mirroring; raw rotation equals KiCad orientation. Unit moved +23,+21.5mm in KiCad.','source_mapping_sha256':hashlib.sha256((S/'candidate-mpn-review.csv').read_bytes()).hexdigest(),'limits':['Raw KiCad angles are not validated supplier feeder angles or pin1 approvals.','MPN mapping is a candidate; price, stock, attrition and electrical qualification incomplete.','Grouped installed counts are not purchase quantities.','No changes to product PCB, case or firmware.']};(D/'assembly-reconciliation.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
