"""Conservative planar stack screen; does not replace CAD collision or tolerance checks."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PLACEMENT = ROOT / 'hardware/mini-rect-v12/placement.json'
parts = json.loads(PLACEMENT.read_text())
# Nominal planes from generate.py. Rounded roof may reduce local clearance further.
board_z, board_thickness = 8.5, 0.8
battery_top, roof_z = 7.4, 13.2
bottom = max((p for p in parts if p['side'] == 'B'), key=lambda p: p['height'])
top = max((p for p in parts if p['side'] == 'F'), key=lambda p: p['height'])
# Desired reserves are engineering study assumptions, not vendor-approved tolerances.
roof_reserve, battery_reserve = 0.2, 0.5
max_board_z = roof_z - roof_reserve - board_thickness - top['height']
min_board_z = battery_top + battery_reserve + bottom['height']
result = {
    'status': 'STACK_SCREEN_NOT_RELEASED',
    'placement_sha256': hashlib.sha256(PLACEMENT.read_bytes()).hexdigest(),
    'dimensions_mm': [23, 25, 14],
    'limiting_top_component': top['ref'],
    'limiting_bottom_component': bottom['ref'],
    'current_battery_gap_mm': round(board_z-bottom['height']-battery_top, 3),
    'current_planar_roof_gap_mm': round(roof_z-board_z-board_thickness-top['height'], 3),
    'study_battery_reserve_mm': battery_reserve,
    'study_roof_reserve_mm': roof_reserve,
    'required_board_z_min_mm': round(min_board_z, 3),
    'allowed_board_z_max_mm': round(max_board_z, 3),
    'translation_only_feasible': min_board_z <= max_board_z,
    'additional_stack_reduction_needed_mm': round(max(0, min_board_z-max_board_z), 3),
    'sweep': [{
        'board_raise_mm': dz,
        'battery_gap_mm': round(board_z+dz-bottom['height']-battery_top, 3),
        'planar_roof_gap_mm': round(roof_z-board_z-dz-board_thickness-top['height'], 3),
    } for dz in [0, 0.1, 0.16, 0.2, 0.3]],
    'decision': 'Do not raise the whole PCB as the final fix. Qualify a lower-profile USB connector or thinner qualified battery, or rearrange underside storage outside the battery footprint. Preserve exterior and baseline until the full stack closes.',
    'limitations': [
        'Full-height envelopes; solder stand-off and PCB/pack tolerances unqualified.',
        'Roof plane is optimistic near fillets; no claim of collision-free geometry.',
        '0.5mm battery reserve is a study target, not confirmed swelling allowance.',
        'USB opening, supports and microphone riser must move with PCB in any variant.',
    ],
}
output = Path(__file__).with_name('vertical-budget.json')
output.write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(result, indent=2))
