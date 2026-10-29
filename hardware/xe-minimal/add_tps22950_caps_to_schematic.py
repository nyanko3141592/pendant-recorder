#!/usr/bin/env python3
"""Add C31/C32, the TPS22950 local bypass capacitors, to the schematic."""
from pathlib import Path


p = Path(__file__).with_name("pendant-xe-minimal.kicad_sch")
s = p.read_text()
assert 'reference "C31"' not in s.lower()
assert 'Pendant:Part_C31' not in s


def definition(ref):
    return f'''(symbol "Pendant:Part_{ref}" (pin_names (offset 1.016)) (in_bom yes) (on_board yes)
 (property "Reference" "C" (at 0 10.16 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "1u 10V X5R" (at 0 7.62 0) (effects (font (size 1.27 1.27)) ))
 (symbol "Part_{ref}_0_1" (rectangle (start -33.02 5.08) (end 33.02 -5.08) (stroke (width .254) (type default)) (fill (type background))))
 (symbol "Part_{ref}_1_1" (pin passive line (at -38.1 1.27 0) (length 5.08) (name "1" (effects (font (size 1 1)) )) (number "1" (effects (font (size .9 .9)) )))(pin passive line (at 38.1 1.27 180) (length 5.08) (name "2" (effects (font (size 1 1)) )) (number "2" (effects (font (size .9 .9)) )))))'''


needle = ')(symbol "Pendant:Part_#FLG01"'
assert needle in s
s = s.replace(needle, ')' + definition('C31') + definition('C32') + '(symbol "Pendant:Part_#FLG01"', 1)


def instance(ref, y, left_net, seed):
    return f'''(wire (pts (xy 937.26 {y}) (xy 929.64 {y})) (stroke (width 0) (type default)) (uuid {seed}0000-0000-4000-8000-000000000001))(label "{left_net}" (at 929.64 {y} 0) (effects (font (size 1 1)) (justify right bottom)) (uuid {seed}0000-0000-4000-8000-000000000002))(wire (pts (xy 1013.46 {y}) (xy 1021.08 {y})) (stroke (width 0) (type default)) (uuid {seed}0000-0000-4000-8000-000000000003))(label "GND" (at 1021.08 {y} 0) (effects (font (size 1 1)) (justify left bottom)) (uuid {seed}0000-0000-4000-8000-000000000004))(symbol (lib_id "Pendant:Part_{ref}") (at 975.36 {y+1.27} 0) (unit 1) (in_bom yes) (on_board yes) (dnp no) (uuid {seed}0000-0000-4000-8000-000000000005)
 (property "Reference" "{ref}" (at 975.36 {y-11.43} 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "1u 10V X5R" (at 975.36 {y-8.89} 0) (effects (font (size 1.27 1.27)) ))
 (property "Footprint" "Capacitor_SMD:C_0402_1005Metric" (at 975.36 {y-1.27} 0) (effects (font (size 1.27 1.27)) hide))
 (property "Datasheet" "" (at 975.36 {y+1.27} 0) (effects (font (size 1.27 1.27)) hide))
 (property "Description" "" (at 975.36 {y-1.27} 0) (effects (font (size 1.27 1.27)) hide))
 (pin "1" (uuid {seed}0000-0000-4000-8000-000000000006))(pin "2" (uuid {seed}0000-0000-4000-8000-000000000007))
 (instances (project "pendant-xe-minimal" (path "/afab3f0e-e2bb-5ea9-9f68-cfd4ab17cf9a" (reference "{ref}") (unit 1)))) )'''


s = s.rstrip()
assert s.endswith(')')
s = s[:-1] + instance('C31', 726.44, 'VBUS', 'c031') + instance('C32', 749.30, 'VBUS_CHARGER', 'c032') + ')\n'
p.write_text(s)
print(p)
