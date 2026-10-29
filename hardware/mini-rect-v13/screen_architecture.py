"""Architecture lower bounds, not a placed or routed design."""
import hashlib,json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
src=ROOT/'hardware/mini-rect-v12/placement.json'
parts=json.loads(src.read_text())
# Existing conservative envelopes include pad/courtyard extents, not just bodies.
retained=[p for p in parts if p['ref']!='U11']
# Include the two new input pullups; provisional backside allocation.
for ref in ['R29','R30']:
    retained.append(dict(ref=ref,w=1.87,h=.97,height=.6,side='B'))
audit=json.loads((Path(__file__).parent/'socket-audit.json').read_text())
w,h,z=audit['conservative_installed_geometry_envelope_mm']
socket=dict(ref='J4',w=w,h=h,height=z)
# Baseline battery top includes existing case floor/support and nominal 6 mm pack.
battery_top=7.4; battery_reserve=.5; pcb=.8; roof_reserve=.2; lid=.8
variants=[]
for name,side,move_cpu in [('socket_front_cpu_back','F',True),('socket_back_cpu_front','B',False)]:
    pp=[dict(p) for p in retained]
    if move_cpu:
        next(p for p in pp if p['ref']=='U1')['side']='B'
    pp.append(dict(socket,side=side))
    front=max(p['height'] for p in pp if p['side']=='F')
    back=max(p['height'] for p in pp if p['side']=='B')
    board_z=battery_top+battery_reserve+back
    minimum=board_z+pcb+front+roof_reserve+lid
    variants.append(dict(name=name,board_bottom_z_mm=round(board_z,3),front_max_height_mm=front,
      back_max_height_mm=back,planar_minimum_case_height_mm=round(minimum,3),
      margin_to_15mm_mm=round(15-minimum,3),
      envelope_area_sum_mm2={s:round(sum(p['w']*p['h'] for p in pp if p['side']==s),3) for s in ['F','B']},
      retained_components=len(retained),socket_added=1,
      placement_complete=False,routing_complete=False))
result=dict(status='ARCHITECTURE_SCREEN_NOT_RELEASED',date='2026-10-26',
 source_placement_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),
 socket=dict(socket,mpn='Hirose DM3D-SF',source='https://www.hirose.com/de/product/document?clcode=CL0609-0032-3-00&documentid=D49662_en&documenttype=Catalog&lang=de&productname=DM3CS-SF&series=DM3'),
 assumptions=dict(battery_top_mm=battery_top,battery_reserve_mm=battery_reserve,pcb_thickness_mm=pcb,roof_reserve_mm=roof_reserve,lid_mm=lid),
 variants=variants,
 decision='Investigate front socket and back MCU first: better vertical margin. Neither alternative has a complete placement.',
 limitations=['Summed area is not a packing or routing proof; ignores overlaps and inaccessible spaces.',
 'Socket envelope is conservative library artwork plus max catalog height, not final corrected land pattern.',
 'Rounded lid, case fasteners, cable routing, socket no-copper zones, battery swelling and actual tolerances remain unchecked.',
 'Back maximum height is conservatively counted over battery regardless of eventual XY position.',
 'Socket envelope includes inserted card; card inserted before closing enclosure, retention structure required.',
 'Four-layer routability, card model/price/current and 16h runtime unqualified.',
 'Socket catalogue dimensions are nominal; exact procurement suffix and engineering drawing required before PCB release.'])
Path(__file__).with_name('architecture-screen.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
