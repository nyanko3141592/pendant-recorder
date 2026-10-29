"""DM3D-SF local candidate from dimensioned EDC3-156814 sheet1.
Datum is standard KiCad origin; card center x=-0.025, signal land top y=4.475.
0.55 is inter-land gap, not width. Land width is 0.70, pitch1.10.
"""
from pathlib import Path
import json,hashlib
import pcbnew as k
P=Path(__file__).resolve().parent
lib=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Connector_Card.pretty')
f=k.FootprintLoad(str(lib),'microSD_HC_Hirose_DM3D-SF')
expected={str(i):[round(3.175-(i-1)*1.1,3),5.35,.7,1.75] for i in range(1,9)}
expected.update({'9':[-5.65,-3.875,1.45,1],'10':[5.575,-5.45,1,1.55]})
shell=[[-5.975,-2.375,.8,1.5],[-5.725,5.225,1.3,1.5],[5.625,5.225,1.5,1.5],[5.975,-3.025,.8,1.4]]
actual={};actual_shell=[]
for pad in f.Pads():
 values=[round(k.ToMM(v),4) for v in (pad.GetPosition().x,pad.GetPosition().y,pad.GetSize().x,pad.GetSize().y)]
 if pad.GetNumber()=='SH':actual_shell.append(values)
 else:actual[pad.GetNumber()]=values
assert actual==expected,(actual,expected)
assert sorted(actual_shell)==sorted(shell)
# Preserve signal/shell lands, fix conservative body artwork separately below.
source=lib/'microSD_HC_Hirose_DM3D-SF.kicad_mod'
s=source.read_text().replace('(footprint "microSD_HC_Hirose_DM3D-SF"','(footprint "DM3D_SF_reviewed_candidate"',1)
assert '(xy -1.975 -3.875) (xy 0.525 -3.875)' in s
s=s.replace('(xy -1.975 -3.875) (xy 0.525 -3.875)','(xy -1.975 -3.725) (xy 0.525 -3.725)')
# This is a local library candidate. Conservative Fab and courtyard retained;
# they are deliberately NOT used as exact vendor body geometry.
output=P/'Pendant.pretty/DM3D_SF_reviewed_candidate.kicad_mod'
output.write_text(s)
r=dict(status='LOCAL_CANDIDATE_DIMENSION_REVIEWED_NOT_RELEASED',drawing='reference/hirose-dm3d-engineering.pdf',drawing_id='EDC3-156814 sheet1 revision3 2007-08-27',
 drawing_sha256=hashlib.sha256((P/'reference/hirose-dm3d-engineering.pdf').read_bytes()).hexdigest(),
 signal_and_detection_pads=actual,shell_pads=actual_shell,signal_width_mm=.7,signal_gap_mm=.55,signal_pitch_mm=1.1,
 correction_to_previous_audit='0.55 dimension is the gap. Previous claim of0.15mm excessive land width was incorrect; lands match drawing.',
 upper_keepout_before_mm=[-1.975,-5.725,.525,-3.875],upper_keepout_after_mm=[-1.975,-5.725,.525,-3.725],
 lower_keepout_mm=[-4.925,-1.525,3.575,.475],
 dimensions_verified=['8 signal pads','2 detection pads','4 shell pads','2 keepout rectangles'],
 source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),output_sha256=hashlib.sha256(output.read_bytes()).hexdigest(),
 limitations=['Exact orderable suffix/current drawing revision still needs supplier confirmation.','Fab/courtyard and stock3D model retained as conservative envelopes, not accurate body model.','No physical solder or fit test.'])
(P/'socket-land-verification.json').write_text(json.dumps(r,indent=2)+'\n')
print('All14 pad positions/sizes match; upper keepout extended0.15mm. Local candidate saved.')
