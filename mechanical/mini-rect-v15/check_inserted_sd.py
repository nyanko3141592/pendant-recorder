"""Explicit inserted-card allocation and pre-enclosure insertion path."""
from pathlib import Path
import hashlib,json
import cadquery as cq
P=Path(__file__).resolve().parent;ROOT=P.parents[1]
hp=ROOT/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json'
h=json.loads(hp.read_text());bp=Path(h['source_board']);assert hashlib.sha256(bp.read_bytes()).hexdigest()==h['source_sha256']
O=Path('/Users/takahashinaoki/Downloads/Pendant-v15-XE-usb-relief')
def box(x,y,z,w,d,t):return cq.Workplane('XY').box(w,d,t).val().translate((x+w/2,y+d/2,z+t/2))
j=next(x for x in h['parts'] if x['ref']=='J4');assert j['rotation_deg']==90 and j['side']=='F'
# Board coordinates from inspected current J4 F.Fab card outline:
# far edge X19.025; card length15 =>X4.025; sidesY1.73/12.73.
# Hirose DM3 catalog p9 shows15x11 card,15.8 fully inserted from socket rear.
# Socket rearX3.225 +15.8 =card far edge19.025.
x,y,z=1.8+4.025,1.3+1.73,8.6+h['board_mm'][2]
card=box(x,y,z,15,11,j['height_mm'])
socket_allocation=box(1.8+j['x_mm']-j['w_mm']/2,1.3+j['y_mm']-j['d_mm']/2,z,j['w_mm'],j['d_mm'],j['height_mm'])
assert card.cut(socket_allocation).Volume()<1e-6
sweep=box(x,y,z,30,11,j['height_mm']) # +15mm X outward; exact continuous union
hits=[]
for p in h['parts']:
 if p['ref']=='J4':continue
 pz=8.6+h['board_mm'][2] if p['side']=='F' else 8.6-p['height_mm']
 shape=box(1.8+p['x_mm']-p['w_mm']/2,1.3+p['y_mm']-p['d_mm']/2,pz,p['w_mm'],p['d_mm'],p['height_mm'])
 v=sweep.intersect(shape).Volume()
 if v>1e-6:hits.append(dict(reference=p['ref'],overlap_mm3=v))
# Optimistic uppermost1mm card within modeled socket height. If even this
# intersects tall components, reducing the full-height allocation cannot clear it.
upper_sweep=box(x,y,z+j['height_mm']-1.0,30,11,1.0)
upper_hits=[]
for p in h['parts']:
 if p['ref']=='J4':continue
 pz=8.6+h['board_mm'][2] if p['side']=='F' else 8.6-p['height_mm']
 shape=box(1.8+p['x_mm']-p['w_mm']/2,1.3+p['y_mm']-p['d_mm']/2,pz,p['w_mm'],p['d_mm'],p['height_mm'])
 v=upper_sweep.intersect(shape).Volume()
 if v>1e-6:upper_hits.append(dict(reference=p['ref'],height_mm=p['height_mm'],overlap_mm3=v))
case_paths=[O/(name+'-NOT-MANUFACTURING.step') for name in ['body','lid','key']]
case={name:cq.importers.importStep(str(p)).val() for name,p in zip(['body','lid','key'],case_paths)}
card_hits={name:card.intersect(shape).Volume() for name,shape in case.items()}
path_hits={name:sweep.intersect(shape).Volume() for name,shape in case.items()}
assert all(v<1e-6 for v in card_hits.values())
report=dict(status='INSERTED_CARD_CONTAINED_IN_EXISTING_J4_ENVELOPE',source_sha256={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [hp,bp,*case_paths,ROOT/'hardware/mini-rect-v13/reference/hirose-dm3-catalog.pdf',Path(__file__)]},source_drawing=dict(author='Hirose',catalog='DM3',page=9,printed_date='Sep.1.2024',drawing_reference_only=True,inserted_card_length_width_mm=[15,11],socket_rear_to_card_far_edge_mm=15.8),card_allocation_case_mm=[x,y,z,15,11,j['height_mm']],card_outside_existing_J4_allocation_mm3=card.cut(socket_allocation).Volume(),inserted_card_case_overlap_mm3=card_hits,insertion_travel_mm=15,insertion_direction_case='+X',insertion_other_component_collisions=hits,uppermost_1mm_card_sweep_collisions=upper_hits,insertion_case_overlap_mm3=path_hits,assembly_requirement='Do not freeze assembly instructions: straight insertion before case assembly has component-envelope conflicts. Resolve actual card/socket height and insertion approach or move obstructing components; closed-case access is also blocked.',limitations=['Card allocation uses full1.68mm socket height from PCB surface, conservatively covering nominal1mm card; card position/shape/tolerance is not manufacturer3D solid accuracy.','Hand/tool gripping clearance and card insertion forces are not modeled.','15mm sweep is an initial access screen, not a proof of every manual insertion motion.','Card removal while powered is not qualified. No hand/tool access or tilted insertion path has been approved.','Enclosure closure, battery harness and selected SD electrical qualification remain unresolved.'],release_allowed=False)
(P/'inserted-sd-review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({k:report[k] for k in ['card_outside_existing_J4_allocation_mm3','inserted_card_case_overlap_mm3','insertion_other_component_collisions','insertion_case_overlap_mm3','uppermost_1mm_card_sweep_collisions']},indent=2))
