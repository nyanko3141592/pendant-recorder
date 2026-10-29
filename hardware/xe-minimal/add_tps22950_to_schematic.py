#!/usr/bin/env python3
"""Mechanically add the validated TPS22950 USB limiter to the canonical schematic."""
from pathlib import Path

p=Path(__file__).with_name('pendant-xe-minimal.kicad_sch')
s=p.read_text()
assert 'Pendant:Part_U13' not in s

definition='''(symbol "Pendant:Part_U13" (pin_names (offset 1.016)) (in_bom yes) (on_board yes)
 (property "Reference" "U" (at 0 12.7 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "TPS22950CDDCR" (at 0 10.16 0) (effects (font (size 1.27 1.27)) ))
 (symbol "Part_U13_0_1" (rectangle (start -33.02 7.62) (end 33.02 -7.62) (stroke (width .254) (type default)) (fill (type background))))
 (symbol "Part_U13_1_1" (pin power_out line (at -38.1 3.81 0) (length 5.08) (name "VOUT" (effects (font (size 1 1)) )) (number "5" (effects (font (size .9 .9)) )))(pin power_in line (at -38.1 0 0) (length 5.08) (name "GND" (effects (font (size 1 1)) )) (number "3" (effects (font (size .9 .9)) )))(pin input line (at -38.1 -3.81 0) (length 5.08) (name "ILIM" (effects (font (size 1 1)) )) (number "4" (effects (font (size .9 .9)) )))(pin input line (at 38.1 3.81 180) (length 5.08) (name "ON" (effects (font (size 1 1)) )) (number "1" (effects (font (size .9 .9)) )))(pin power_in line (at 38.1 0 180) (length 5.08) (name "VIN" (effects (font (size 1 1)) )) (number "2" (effects (font (size .9 .9)) )))(pin open_collector line (at 38.1 -3.81 180) (length 5.08) (name "FLT" (effects (font (size 1 1)) )) (number "6" (effects (font (size .9 .9)) )))))'''
needle=')(symbol "Pendant:Part_#FLG01"'
assert needle in s
s=s.replace(needle,')'+definition+'(symbol "Pendant:Part_#FLG01"',1)

s=s.replace('(property "Value" "0R" (at 426.72 553.7200000000001 0)',
            '(property "Value" "RC0402FR-0720KL 20k 1%" (at 426.72 553.7200000000001 0)',1)
s=s.replace('(label "VBUS_CHARGER" (at 381.0 560.0700000000002 0)',
            '(label "GND" (at 381.0 560.0700000000002 0)',1)
s=s.replace('(label "VBUS" (at 472.44000000000005 560.0700000000002 0)',
            '(label "USB_ILIM_SET" (at 472.44000000000005 560.0700000000002 0)',1)

instance='''(wire (pts (xy 937.26 375.92) (xy 929.64 375.92)) (stroke (width 0) (type default)) (uuid b72f4225-1a4d-56c1-b563-9dfb527af969))(label "VBUS_CHARGER" (at 929.64 375.92 0) (effects (font (size 1 1)) (justify right bottom)) (uuid 34f2b1fd-f84c-5df2-8630-97aecc382759))(wire (pts (xy 937.26 379.73) (xy 929.64 379.73)) (stroke (width 0) (type default)) (uuid ebacb6ea-f7f3-54c5-bf84-868a2cab1ead))(label "GND" (at 929.64 379.73 0) (effects (font (size 1 1)) (justify right bottom)) (uuid f9dc537d-8d74-55e1-93e2-7f2e5bbfdf8a))(wire (pts (xy 937.26 383.54) (xy 929.64 383.54)) (stroke (width 0) (type default)) (uuid 43ed038c-aaee-5c35-a833-e1756fd9d417))(label "USB_ILIM_SET" (at 929.64 383.54 0) (effects (font (size 1 1)) (justify right bottom)) (uuid a80d6513-4366-59fe-b93e-c70f7bb2ffe5))(wire (pts (xy 1013.46 375.92) (xy 1021.08 375.92)) (stroke (width 0) (type default)) (uuid 13854a7b-584e-504a-8fcc-1ae6eeaa1eb8))(label "VBUS" (at 1021.08 375.92 0) (effects (font (size 1 1)) (justify left bottom)) (uuid 44e6463b-60c1-5a3b-bf06-ef38a15c2473))(wire (pts (xy 1013.46 379.73) (xy 1021.08 379.73)) (stroke (width 0) (type default)) (uuid e4c1ed05-a1a1-52bb-bfb9-716df7ef11ab))(label "VBUS" (at 1021.08 379.73 0) (effects (font (size 1 1)) (justify left bottom)) (uuid 14f486fe-3441-588a-96e7-f318689dbf0c))(no_connect (at 1013.46 383.54) (uuid 6b7e4f05-9301-5e9e-b917-e788ebd4128e))(symbol (lib_id "Pendant:Part_U13") (at 975.36 379.73 0) (unit 1) (in_bom yes) (on_board yes) (dnp no) (uuid 11d51b9b-a59a-508d-b564-973619f416e0)
 (property "Reference" "U13" (at 975.36 367.03 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "TPS22950CDDCR" (at 975.36 369.57 0) (effects (font (size 1.27 1.27)) ))
 (property "Footprint" "Package_TO_SOT_SMD:SOT-23-6" (at 975.36 379.73 0) (effects (font (size 1.27 1.27)) hide))
 (property "Datasheet" "https://www.ti.com/lit/ds/symlink/tps22950.pdf" (at 975.36 379.73 0) (effects (font (size 1.27 1.27)) hide))
 (property "Description" "5V load switch with adjustable current limit" (at 975.36 379.73 0) (effects (font (size 1.27 1.27)) hide))
 (pin "1" (uuid 11111111-a59a-508d-b564-973619f416e1))(pin "2" (uuid 11111111-a59a-508d-b564-973619f416e2))(pin "3" (uuid 11111111-a59a-508d-b564-973619f416e3))(pin "4" (uuid 11111111-a59a-508d-b564-973619f416e4))(pin "5" (uuid 11111111-a59a-508d-b564-973619f416e5))(pin "6" (uuid 11111111-a59a-508d-b564-973619f416e6))
 (instances (project "pendant-xe-minimal" (path "/afab3f0e-e2bb-5ea9-9f68-cfd4ab17cf9a" (reference "U13") (unit 1)))) )'''
# Insert before the final root close. The schematic is intentionally generated
# as compact s-expressions, so this is deterministic and easy to audit.
s=s.rstrip()
assert s.endswith(')')
s=s[:-1]+instance+')\n'
p.write_text(s)
print(p)
