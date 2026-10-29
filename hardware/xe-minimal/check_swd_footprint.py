"""Run with KiCad's bundled Python. Validate actual target geometry, not fixture qualification."""
import json
from pathlib import Path
import pcbnew
root = Path(__file__).resolve().parent
fp = pcbnew.FootprintLoad(str(root / 'PendantMinimal.pretty'), 'SWD_Pogo_5Pad_P1.27mm')
assert fp is not None
pads = list(fp.Pads())
assert {p.GetNumber() for p in pads} == {'1','2','3','4','5'}
for p in pads:
    assert p.IsOnLayer(pcbnew.F_Cu) and p.IsOnLayer(pcbnew.F_Mask)
    assert not p.IsOnLayer(pcbnew.F_Paste)
    assert p.GetDrillSize().x == 0 and p.GetDrillSize().y == 0
    assert p.GetSize().x == pcbnew.FromMM(1)
clearance = 1.27 - 1.0
report = {'status':'FOOTPRINT_PARSE_AND_GEOMETRY_PASS_NOT_FIXTURE_QUALIFIED',
          'pad_count':len(pads), 'pitch_mm':1.27, 'pad_size_mm':1,
          'minimum_copper_gap_mm':round(clearance,3),
          'nominal_mask_web_mm':round(clearance-2*.05,3),
          'courtyard_mm':[2.77,4.04], 'courtyard_area_mm2':2.77*4.04,
          'previous_library_envelope_area_mm2':28.5525,
          'pin_map':{'1':'V3V3 sense only','2':'SWDIO','3':'NRST','4':'SWCLK','5':'GND'},
          'constraints':['No power through VTref. Power board through current-limited USB bench source; battery disconnected.',
                         'Factory fixture must locate edges and prevent reversed contact before applying power.',
                         'Keep component-free probe approach and board support; courtyard alone is insufficient.',
                         'Exact pogo pin, alignment tolerance, finish and contact force remain to be selected.',
                         'Not compatible with Tag-Connect cable; separate fixture required.',
                         'Footprint candidate only; not applied to routed V15 board.']}
(root/'swd-footprint-review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
