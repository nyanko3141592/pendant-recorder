#!/usr/bin/env python3
from pathlib import Path
p=Path(__file__).with_name('pendant-xe-minimal.kicad_sch')
s=p.read_text()
anchor=s.index('b72f4225-1a4d-56c1-b563-9dfb527af969')
start=s.rfind('(wire',0,anchor)
marker='(reference "U13") (unit 1)))) )'
end=s.index(marker,anchor)+len(marker)
block=s[start:end]
for old,new in {
    '1061.9':'1061.72','1054.28':'1054.1','1138.1':'1137.92','1145.72':'1145.54',
    '1100.0':'1099.82','696.19':'695.96','700.0':'699.77','703.81':'703.58',
    '687.3':'687.07','689.84':'689.61',
}.items():
    assert old in block, old
    block=block.replace(old,new)
s=s[:start]+block+s[end:]
s=s.replace('(property "Value" "0R 1%" (at 426.72 553.7200000000001 0)',
            '(property "Value" "RC0402FR-0720KL 20k 1%" (at 426.72 553.7200000000001 0)',1)
p.write_text(s)
