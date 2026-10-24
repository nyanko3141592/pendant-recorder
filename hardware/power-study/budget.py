#!/usr/bin/env python3
"""Battery-terminal current thresholds, not a prediction of hardware consumption."""
import json
from pathlib import Path
capacities = [74, 108, 110, 145, 150]
result = {
    'status': 'feasibility_only_not_measured',
    'usable_capacity_fraction_assumption': 0.70,
    'measurement_boundary': 'battery terminals; includes all rails and conversion losses',
    'capacity_note': '70% is an assumption, not verified margin against temperature, aging or LDO cutoff',
    'candidates': [dict(nominal_mAh=c, usable_mAh=c*.7,
        max_average_mA_for_16h=round(c*.7/16, 4),
        max_average_mA_for_20h=round(c*.7/20, 4)) for c in capacities],
    '150mAh_runtime_sensitivity_hours': {str(i):round(150*.7/i,2) for i in [3,4,5,6,7,8]},
    'ima_adpcm_payload_bytes_per_second': 1024*16000/2041,
    'ima_adpcm_36h_payload_bytes': 1024*16000/2041*36*3600,
    'storage_note': 'Excludes WAV headers, age overhead and filesystem allocation; 4GB nominal retains ample budget.'
}
Path(__file__).with_name('budget.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(result, indent=2))
