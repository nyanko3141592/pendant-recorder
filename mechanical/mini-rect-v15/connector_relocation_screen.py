"""Necessary reach and body-envelope screen, not a route or placement approval."""
from pathlib import Path
import json,math,hashlib
P=Path(__file__).resolve().parent
source=P.parents[1]/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.mechanical-handoff.json'
h=json.loads(source.read_text());j=next(p for p in h['parts'] if p['ref']=='J2')
radius=1.4;initial_straight=.4;minimum_lead=12.
remaining=minimum_lead-initial_straight-math.pi*radius
return_start=(28.9,7.3);old_exit=(22.02,7.3)
rows=[]
for ix in range(-12,13):
 for iy in range(-4,17):
  dx,dy=ix*.5,iy*.5
  chord=math.sqrt(dx*dx+(return_start[0]-old_exit[0]-dy)**2)
  if chord>remaining:continue
  cx,cy=j['x_mm']+dx,j['y_mm']+dy
  within=cx-j['w_mm']/2>=0 and cx+j['w_mm']/2<=26 and cy-j['d_mm']/2>=0 and cy+j['d_mm']/2<=29
  overlaps=[]
  for part in h['parts']:
   if part['ref']=='J2' or part['side']!='B':continue
   ox=(j['w_mm']+part['w_mm'])/2-abs(cx-part['x_mm'])
   oy=(j['d_mm']+part['d_mm'])/2-abs(cy-part['y_mm'])
   if ox>0 and oy>0:overlaps.append(part['ref'])
  rows.append(dict(translation_mm=[dx,dy],remaining_shortest_lead_slack_upper_bound_mm=remaining-chord,body_within_board=within,body_envelope_overlap_refs=overlaps,passes_necessary_screens_only=within and not overlaps))
r=dict(status='NECESSARY_RELOCATION_SCREEN_NOT_PLACEMENT_APPROVAL',source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),assumed_minimum_lead_mm=minimum_lead,assumed_uturn_radius_mm=radius,remaining_length_after_fixed_uturn_mm=remaining,minimum_exit_Y_at_zero_X_shift_mm=return_start[0]-remaining,max_abs_X_shift_at_current_Y_mm=math.sqrt(remaining**2-(return_start[0]-old_exit[0])**2),rows=rows,passing_necessary_screen_count=sum(r['passes_necessary_screens_only'] for r in rows),limitations=['Same connector rotation and endpoint translation assumed; wire-exit coordinates remain unverified.','Euclidean chord is only a necessary lower bound; tangent and bend constraints require additional length.','Body overlap screen uses existing B-side axis-aligned envelopes, not pads, courtyard, tracks, mated housing, insertion path or rework access.','Long-lead storage, wire-to-wire and case interference not screened.','No routing edits, no manufacturing approval.'])
(P/'connector-relocation-screen.json').write_text(json.dumps(r,indent=2)+'\n')
print({k:r[k] for k in ['remaining_length_after_fixed_uturn_mm','minimum_exit_Y_at_zero_X_shift_mm','max_abs_X_shift_at_current_Y_mm','passing_necessary_screen_count']})
print('Candidate translations:',[r['translation_mm'] for r in rows if r['passes_necessary_screens_only']])
