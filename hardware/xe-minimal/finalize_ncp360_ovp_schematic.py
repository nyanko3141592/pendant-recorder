#!/usr/bin/env python3
"""Normalize new symbols to the 1.27-mm grid and update the project symbol library."""
from pathlib import Path

HERE = Path(__file__).resolve().parent
sch = HERE / "ncp360-ovp-candidate" / "pendant-xe-ncp360-ovp.kicad_sch"
s = sch.read_text()
for old, new in {
    "661.9":"662.94", "654.28":"655.32", "738.1":"739.14", "745.72":"746.76",
    "696.19":"697.23", "703.81":"704.85", "(at 700 ":"(at 701.04 ",
}.items():
    s = s.replace(old, new)
s = s.replace('(symbol (lib_id "Pendant:Part_U14") (at 701.04 700 0)',
              '(symbol (lib_id "Pendant:Part_U14") (at 701.04 701.04 0)')
s = s.replace('662.94 700', '662.94 701.04').replace('655.32 700', '655.32 701.04')
sch.write_text(s)

def block(text, marker):
    start = text.index(marker)
    depth = 0
    for i in range(start, len(text)):
        if text[i] == '(':
            depth += 1
        elif text[i] == ')':
            depth -= 1
            if depth == 0:
                return text[start:i+1]
    raise AssertionError(marker)

lib = HERE / "Pendant.kicad_sym"
l = lib.read_text()
for ref in ("U14", "C33"):
    if f'(symbol "Part_{ref}"' in l:
        continue
    definition = block(s, f'(symbol "Pendant:Part_{ref}"').replace(f'"Pendant:Part_{ref}"', f'"Part_{ref}"', 1)
    l = l.rstrip()
    assert l.endswith(')')
    l = l[:-1] + definition + ')\n'
lib.write_text(l)
print(sch)
