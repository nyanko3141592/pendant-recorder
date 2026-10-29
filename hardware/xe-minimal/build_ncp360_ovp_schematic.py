#!/usr/bin/env python3
"""Build the NCP360/C33 schematic matching the routed OVP PCB candidate."""
from pathlib import Path

HERE = Path(__file__).resolve().parent
src = HERE / "pendant-xe-minimal.kicad_sch"
out = HERE / "ncp360-ovp-candidate" / "pendant-xe-ncp360-ovp.kicad_sch"
s = src.read_text()
assert 'Pendant:Part_U14' not in s and 'Pendant:Part_C33' not in s

# TPS22950 ON/VIN and its input bypass move from raw VBUS to protected VBUS.
for old, new in (
    ('(label "VBUS" (at 1145.54 695.96 0)', '(label "VBUS_OVP" (at 1145.54 695.96 0)'),
    ('(label "VBUS" (at 1145.54 699.77 0)', '(label "VBUS_OVP" (at 1145.54 699.77 0)'),
    ('(label "VBUS" (at 929.64 726.44 0)', '(label "VBUS_OVP" (at 929.64 726.44 0)'),
):
    assert s.count(old) == 1, old
    s = s.replace(old, new, 1)

u14_def = '''(symbol "Pendant:Part_U14" (pin_names (offset 1.016)) (in_bom yes) (on_board yes)
 (property "Reference" "U" (at 0 12.7 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "NCP360SNT1G" (at 0 10.16 0) (effects (font (size 1.27 1.27)) ))
 (symbol "Part_U14_0_1" (rectangle (start -33.02 7.62) (end 33.02 -7.62) (stroke (width .254) (type default)) (fill (type background))))
 (symbol "Part_U14_1_1" (pin power_in line (at -38.1 3.81 0) (length 5.08) (name "IN" (effects (font (size 1 1)) )) (number "1" (effects (font (size .9 .9)) )))(pin power_in line (at -38.1 0 0) (length 5.08) (name "GND" (effects (font (size 1 1)) )) (number "2" (effects (font (size .9 .9)) )))(pin input line (at -38.1 -3.81 0) (length 5.08) (name "EN" (effects (font (size 1 1)) )) (number "3" (effects (font (size .9 .9)) )))(pin open_collector line (at 38.1 3.81 180) (length 5.08) (name "FLAG" (effects (font (size 1 1)) )) (number "4" (effects (font (size .9 .9)) )))(pin power_out line (at 38.1 -3.81 180) (length 5.08) (name "OUT" (effects (font (size 1 1)) )) (number "5" (effects (font (size .9 .9)) )))))'''
c33_def = '''(symbol "Pendant:Part_C33" (pin_names (offset 1.016)) (in_bom yes) (on_board yes)
 (property "Reference" "C" (at 0 10.16 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "1u 35V X5R" (at 0 7.62 0) (effects (font (size 1.27 1.27)) ))
 (symbol "Part_C33_0_1" (rectangle (start -33.02 5.08) (end 33.02 -5.08) (stroke (width .254) (type default)) (fill (type background))))
 (symbol "Part_C33_1_1" (pin passive line (at -38.1 1.27 0) (length 5.08) (name "1" (effects (font (size 1 1)) )) (number "1" (effects (font (size .9 .9)) )))(pin passive line (at 38.1 1.27 180) (length 5.08) (name "2" (effects (font (size 1 1)) )) (number "2" (effects (font (size .9 .9)) )))))'''
needle = ')(symbol "Pendant:Part_#FLG01"'
assert needle in s
s = s.replace(needle, ')' + u14_def + c33_def + '(symbol "Pendant:Part_#FLG01"', 1)

u14 = '''(wire (pts (xy 661.9 696.19) (xy 654.28 696.19)) (stroke (width 0) (type default)) (uuid a1400000-0000-4000-8000-000000000001))(label "VBUS" (at 654.28 696.19 0) (effects (font (size 1 1)) (justify right bottom)) (uuid a1400000-0000-4000-8000-000000000002))(wire (pts (xy 661.9 700) (xy 654.28 700)) (stroke (width 0) (type default)) (uuid a1400000-0000-4000-8000-000000000003))(label "GND" (at 654.28 700 0) (effects (font (size 1 1)) (justify right bottom)) (uuid a1400000-0000-4000-8000-000000000004))(wire (pts (xy 661.9 703.81) (xy 654.28 703.81)) (stroke (width 0) (type default)) (uuid a1400000-0000-4000-8000-000000000005))(label "GND" (at 654.28 703.81 0) (effects (font (size 1 1)) (justify right bottom)) (uuid a1400000-0000-4000-8000-000000000006))(no_connect (at 738.1 696.19) (uuid a1400000-0000-4000-8000-000000000007))(wire (pts (xy 738.1 703.81) (xy 745.72 703.81)) (stroke (width 0) (type default)) (uuid a1400000-0000-4000-8000-000000000008))(label "VBUS_OVP" (at 745.72 703.81 0) (effects (font (size 1 1)) (justify left bottom)) (uuid a1400000-0000-4000-8000-000000000009))(symbol (lib_id "Pendant:Part_U14") (at 700 700 0) (unit 1) (in_bom yes) (on_board yes) (dnp no) (uuid a1400000-0000-4000-8000-000000000010)
 (property "Reference" "U14" (at 700 687.3 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "NCP360SNT1G" (at 700 689.84 0) (effects (font (size 1.27 1.27)) ))
 (property "Footprint" "Package_TO_SOT_SMD:SOT-23-5" (at 700 700 0) (effects (font (size 1.27 1.27)) hide))
 (property "Datasheet" "" (at 700 700 0) (effects (font (size 1.27 1.27)) hide))
 (property "Description" "" (at 700 700 0) (effects (font (size 1.27 1.27)) hide))
 (pin "1" (uuid a1400000-0000-4000-8000-000000000011))(pin "2" (uuid a1400000-0000-4000-8000-000000000012))(pin "3" (uuid a1400000-0000-4000-8000-000000000013))(pin "4" (uuid a1400000-0000-4000-8000-000000000014))(pin "5" (uuid a1400000-0000-4000-8000-000000000015))
 (instances (project "pendant-xe-minimal" (path "/afab3f0e-e2bb-5ea9-9f68-cfd4ab17cf9a" (reference "U14") (unit 1)))) )'''
c33 = '''(wire (pts (xy 661.9 726.44) (xy 654.28 726.44)) (stroke (width 0) (type default)) (uuid c0330000-0000-4000-8000-000000000001))(label "VBUS" (at 654.28 726.44 0) (effects (font (size 1 1)) (justify right bottom)) (uuid c0330000-0000-4000-8000-000000000002))(wire (pts (xy 738.1 726.44) (xy 745.72 726.44)) (stroke (width 0) (type default)) (uuid c0330000-0000-4000-8000-000000000003))(label "GND" (at 745.72 726.44 0) (effects (font (size 1 1)) (justify left bottom)) (uuid c0330000-0000-4000-8000-000000000004))(symbol (lib_id "Pendant:Part_C33") (at 700 727.71 0) (unit 1) (in_bom yes) (on_board yes) (dnp no) (uuid c0330000-0000-4000-8000-000000000005)
 (property "Reference" "C33" (at 700 715.01 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "1u 35V X5R" (at 700 717.55 0) (effects (font (size 1.27 1.27)) ))
 (property "Footprint" "Capacitor_SMD:C_0402_1005Metric" (at 700 725.17 0) (effects (font (size 1.27 1.27)) hide))
 (property "Datasheet" "" (at 700 727.71 0) (effects (font (size 1.27 1.27)) hide))
 (property "Description" "" (at 700 725.17 0) (effects (font (size 1.27 1.27)) hide))
 (pin "1" (uuid c0330000-0000-4000-8000-000000000006))(pin "2" (uuid c0330000-0000-4000-8000-000000000007))
 (instances (project "pendant-xe-minimal" (path "/afab3f0e-e2bb-5ea9-9f68-cfd4ab17cf9a" (reference "C33") (unit 1)))) )'''
s = s.rstrip()
assert s.endswith(')')
out.write_text(s[:-1] + u14 + c33 + ')\n')
print(out)
