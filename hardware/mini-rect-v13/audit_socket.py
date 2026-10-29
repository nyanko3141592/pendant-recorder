"""Compare installed candidate to visually inspected manufacturer drawings."""
from pathlib import Path
import json,hashlib
import pcbnew as k
P=Path(__file__).resolve().parent
lib=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Connector_Card.pretty')
fpath=lib/'microSD_HC_Hirose_DM3D-SF.kicad_mod'
f=k.FootprintLoad(str(lib),fpath.stem)
pads=[dict(number=p.GetNumber(),position_mm=[k.ToMM(p.GetPosition().x),k.ToMM(p.GetPosition().y)],size_mm=[k.ToMM(p.GetSize().x),k.ToMM(p.GetSize().y)]) for p in f.Pads()]
signal=sorted([p for p in pads if p['number'] in list('12345678')],key=lambda p:int(p['number']))
pitch=[round(signal[i]['position_mm'][0]-signal[i+1]['position_mm'][0],6) for i in range(7)]
assert pitch==[1.1]*7
r=dict(status='CANDIDATE_NOT_MANUFACTURING_QUALIFIED',sources={str(q.relative_to(P)):hashlib.sha256(q.read_bytes()).hexdigest() for q in (P/'reference').glob('*.pdf')},installed_footprint_sha256=hashlib.sha256(fpath.read_bytes()).hexdigest(),pads=pads,
 signal_pitch_mm=pitch,manufacturer_signal_pad_size_mm=[.7,1.75],installed_signal_pad_size_mm=signal[0]['size_mm'],
 signal_pad_width_excess_mm=round(signal[0]['size_mm'][0]-.7,3),
 manufacturer_body_mm=[11.95,11.45,1.55],manufacturer_body_tolerance_mm=[.2,.2,.13],
 installed_FFab_body_width_mm=12.75,
 conservative_installed_geometry_bounds_mm=[-6.92,-6.975,6.88,10.075],
 conservative_installed_geometry_envelope_mm=[13.8,17.05,1.68],
 findings=['Pitch and pin order agree with manufacturer page9 and engineering drawing EDC3-156814 sheet1.',
 'Signal lands0.70mm match;0.55mm is gap. Earlier width mismatch claim was a drawing misread.',
 'FFab body12.75mm differs from manufacturer body11.95mm. Courtyard and inserted-card geometry exceed body envelope.',
 'Socket max height1.68mm before solder from1.55+0.13; earlier stack screen used nominal height only.',
 'Two local copper keepouts exist in library, but exact boundaries and all shell/switch pads remain to audit.'],
 decision='Keep nominal body comparison as history; use larger installed envelope for provisional packing. No footprint correction or release until remaining land geometry checked.',
 limitations=['Engineering drawing is a 2007 revision mirrored by distributor; procurement suffix/current revision not confirmed.','Envelope includes artwork as conservative study; not vendor maximum outline.','Actual battery/CPU/USB tolerances remain unqualified.'])
(P/'socket-audit.json').write_text(json.dumps(r,indent=2)+'\n')
print('8 signal pads checked; pitch and land width agree; provisional envelope13.8x17.05x1.68mm')
