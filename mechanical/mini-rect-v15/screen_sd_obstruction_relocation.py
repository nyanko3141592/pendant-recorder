"""Geometry-only placement trial; does not move routed board or approve circuitry."""
from pathlib import Path
import hashlib,json
import cadquery as cq
P=Path(__file__).resolve().parent;ROOT=P.parents[1]
hp=ROOT/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json';h=json.loads(hp.read_text())
bp=Path(h['source_board']);assert hashlib.sha256(bp.read_bytes()).hexdigest()==h['source_sha256']
O=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-usb-relief')
def box(x,y,z,w,d,t):return cq.Workplane('XY').box(w,d,t).val().translate((x+w/2,y+d/2,z+t/2))
def shape(p):
 z=9.53 if p['side']=='F' else 8.6-p['height_mm']
 return box(1.8+p['x_mm']-p['w_mm']/2,1.3+p['y_mm']-p['d_mm']/2,z,p['w_mm'],p['d_mm'],p['height_mm'])
card_sweep=box(5.825,3.03,9.53,30,11,1.68)
u15=box(1.8+23-.7,1.3+8-1.52,9.53,1.4,3.04,1.12)
upper_card=box(5.825,3.03,10.21,30,11,1)
positions={'Q7':(23,14.5),'U15':(23,18)}
fixed={p['ref']:shape(p) for p in h['parts'] if p['ref'] not in positions}
moved={}
for ref,(x,y) in positions.items():
 p=dict(next(p for p in h['parts'] if p['ref']==ref));p.update(x_mm=x,y_mm=y);moved[ref]=shape(p)
paths=[O/(n+'-NOT-MANUFACTURING.step') for n in ['body','lid','key']]
obstacles={**fixed,**{n:cq.importers.importStep(str(p)).val() for n,p in zip(['body','lid','key'],paths)},'card_insertion_sweep':card_sweep}
# Candidate retaining pads/posts footprint allocations, board coordinates.
for i,(x,y) in enumerate([(1.8,20.7),(20.2,24.4),(17.6,27.2)]):obstacles['retention_'+str(i)]=box(1.8+x-1.5,1.3+y-1.5,9.53,3,3,4.07)
hits=[]
for ref,s in moved.items():
 for name,target in {**obstacles,**{n:t for n,t in moved.items() if n!=ref}}.items():
  v=s.intersect(target).Volume()
  if v>1e-6:hits.append(dict(reference=ref,target=name,overlap_mm3=v))
report=dict(status='GEOMETRY_ONLY_RELOCATION_SCREEN_NOT_ROUTED',source_sha256={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [hp,bp,*paths,P/'evidence/tlv803e-package-review.pdf',Path(__file__)]},U15_package_review=dict(part='TLV803EB29DBZR',drawing='DBZ0003A',url='https://www.ti.com/lit/ds/symlink/tlv803e.pdf',maximum_body_mm=[1.4,3.04,1.12],uppermost_card_overlap_mm3=u15.intersect(upper_card).Volume(),interpretation='Maximum package envelope still conflicts; shrinking provisional height1.45 to actual maximum1.12 does not qualify the current straight insertion path.'),Q7_package_review='Nexperia direct PDF403; do not infer exact height or bypass restriction. Existing1.45mm envelope retained.',trial_centers_board_mm=positions,collisions=hits,adopted=False,board_changed=False,remaining=['No routing or pad/trace/via DRC for trial positions; existing board and manufacturing files unchanged.','Actual card Z datum and remaining low components still need verification; two-part relocation alone is not full insertion approval.','Recheck schematic/PCB parity, USB return/current control nets and all mechanical artifacts if moving parts.','No manufacturer guarantee of hand access or tilted insertion.'],release_allowed=False)
(P/'sd-obstruction-relocation-review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'U15_maximum_body_overlap_mm3':report['U15_package_review']['uppermost_card_overlap_mm3'],'trial_centers':positions,'trial_collisions':hits},indent=2))
