#!/usr/bin/env python3
from pathlib import Path
for name in ('Pendant.kicad_sym','pendant-xe-minimal.kicad_sch'):
    p=Path(__file__).with_name(name); s=p.read_text()
    marker='(symbol "Part_U13_1_1" (pin power_out line (at -38.1 3.81 0)'
    assert s.count(marker)==1, (name,s.count(marker))
    p.write_text(s.replace(marker,marker.replace('power_out','passive'),1))
