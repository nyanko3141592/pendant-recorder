#!/usr/bin/env python3
from pathlib import Path
p=Path(__file__).with_name('Pendant.kicad_sym'); s=p.read_text()
assert '(symbol "Part_U13"' not in s
symbol='''(symbol "Part_U13" (pin_names (offset 1.016)) (in_bom yes) (on_board yes)
 (property "Reference" "U" (at 0 12.7 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "TPS22950CDDCR" (at 0 10.16 0) (effects (font (size 1.27 1.27)) ))
 (symbol "Part_U13_0_1" (rectangle (start -33.02 7.62) (end 33.02 -7.62) (stroke (width .254) (type default)) (fill (type background))))
 (symbol "Part_U13_1_1" (pin power_out line (at -38.1 3.81 0) (length 5.08) (name "VOUT" (effects (font (size 1 1)) )) (number "5" (effects (font (size .9 .9)) )))(pin power_in line (at -38.1 0 0) (length 5.08) (name "GND" (effects (font (size 1 1)) )) (number "3" (effects (font (size .9 .9)) )))(pin input line (at -38.1 -3.81 0) (length 5.08) (name "ILIM" (effects (font (size 1 1)) )) (number "4" (effects (font (size .9 .9)) )))(pin input line (at 38.1 3.81 180) (length 5.08) (name "ON" (effects (font (size 1 1)) )) (number "1" (effects (font (size .9 .9)) )))(pin power_in line (at 38.1 0 180) (length 5.08) (name "VIN" (effects (font (size 1 1)) )) (number "2" (effects (font (size .9 .9)) )))(pin open_collector line (at 38.1 -3.81 180) (length 5.08) (name "FLT" (effects (font (size 1 1)) )) (number "6" (effects (font (size .9 .9)) )))))'''
s=s.rstrip(); assert s.endswith(')'); p.write_text(s[:-1]+symbol+')\n')
