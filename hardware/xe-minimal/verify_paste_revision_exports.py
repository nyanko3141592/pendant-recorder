from pathlib import Path
from gerbonara import GerberFile
import json,hashlib,csv
p=Path(__file__).resolve().parent;old=p/'fabrication-review-31ebfc3b1041';new=p/json.loads((p/'active-design.json').read_text())['manufacturing_review_directory'];checks={}
for f in sorted((new/'gerbers').iterdir()):
 if f.suffix=='.gbrjob':continue
 a=GerberFile.open(f);b=GerberFile.open(old/'gerbers'/f.name)
 if 'B_Paste' in f.name:
  changed=[o for o in a.objects if o.attrs.get('.C')==('U10',)];assert len(changed)==4
  for o in changed:
   (x,y),(xx,yy)=o.bounding_box();assert abs(xx-x-.25)<1e-8 and abs(yy-y-.25)<1e-8 and abs(o.aperture.parameters[0]-.05)<1e-8
  a.objects=[o for o in a.objects if o.attrs.get('.C')!=('U10',)];b.objects=[o for o in b.objects if o.attrs.get('.C')!=('U10',)]
 assert str(a.to_svg())==str(b.to_svg()),f.name
 checks[f.name]='IDENTICAL_GEOMETRY' if 'B_Paste' not in f.name else 'IDENTICAL_EXCEPT_VERIFIED_U10_APERTURES'
assert (new/'positions-raw.csv').read_bytes()==(old/'positions-raw.csv').read_bytes()
with (new/'positions-raw.csv').open() as f:
 reader=csv.DictReader(f);fields=reader.fieldnames;rows=list(reader)
rows=[r for r in rows if r['Ref']!='J3' and not r['Ref'].startswith('TP')];assert len(rows)==80
with (new/'positions-assembly-review.csv').open('w') as f:
 w=csv.DictWriter(f,fieldnames=fields);w.writeheader();w.writerows(rows)
r={'status':'EXPORT_GEOMETRY_COMPARISON_PASS_NOT_FABRICATION_RELEASE','previous_directory':old.name,'current_directory':new.name,'gerber_checks':checks,'raw_positions_byte_identical':True,'assembly_positions_count':80,'limitations':['Assembly rotations still require convention verification.','Old source-hash reviews retained as historical evidence; not silently relabeled.','Stencil/process/size/runtime qualification remain incomplete.']}
(new/'revision-comparison.json').write_text(json.dumps(r,indent=2)+'\n');print(len(checks),'layers checked;80 assembly positions')
