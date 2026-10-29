from pathlib import Path
import json,hashlib
P=Path(__file__).parent
charger=json.loads((P/'charger-review.json').read_text())
limit=charger['settings']['input_limit_mA_min_typ_max_at_5V'][0]
charge=charger['settings']['iset_factor_and_1pct_resistor_only_mA_range'][1]
rows=[]
for state,sd in [('read',60),('write',50),('standby',.25)]:
 for enabled in [False,True]:
  rows.append({'storage_state':state,'storage_mA':sd,'charge_enabled':enabled,'charge_allocation_mA':charge if enabled else 0,'remaining_for_MCU_USB_regulator_and_other_mA':limit-sd-(charge if enabled else 0)})
ref=P.parent/'mini-rect-v11/reference/csnp16gcr01-aow.txt'
r={'status':'DESIGN_SCREEN_NOT_MEASURED','input_limit_lower_bound_mA':limit,'storage_reference':str(ref.relative_to(P.parent)),'storage_reference_sha256':hashlib.sha256(ref.read_bytes()).hexdigest(),'rows':rows,'conclusion':'60mA memory read plus nominal20mA charge leaves no MCU margin at80mA input minimum. KISET/resistor upper screen alone exceeds80mA before MCU. Cannot promise full-rate USB sync and20mA charging simultaneously.','design_policy':'Keep CHG_ALLOW low throughout USB storage ownership and recovery; only allow charging after storage is released and USB/load/battery/NTC conditions qualified. If remaining20mA MCU+USB budget fails, throttle read duty or redesign input limit with USB negotiation.','limitations':['Storage60mA is datasheet3.3V50MHz condition; actual selected SPI clock current unknown','Linear power path/LDO screening uses current sums, not switching conversion','Charge upper screen excludes unspecified additional errors','BQ power-path may reduce charge or supplement from battery; do not rely on supplement until battery pulse current qualified','Host eject while still configured does not alone prove low USB consumption'],'implemented':'Existing firmware has no charge-enable API, so charging remains inhibited. Conditional charging/resume not yet implemented.'}
(P/'usb-power-budget.json').write_text(json.dumps(r,indent=2)+'\n')
assert rows[1]['remaining_for_MCU_USB_regulator_and_other_mA']<0
print(json.dumps(rows,indent=2))
