from pathlib import Path
import math,shutil
P=Path(__file__).resolve().parent;s='candidate6usb35';dst='candidate6plane'
for e in ['kicad_pcb','kicad_pro','kicad_sch']:shutil.copyfile(P/(s+'.'+e),P/(dst+'.'+e))
dsn=(P/(s+'.dsn')).read_text()
# An unrouted isolated KiCad zone has no fill; its DSN exporter omitted it.
# Explicit plane matches the KiCad In1.Cu GND zone outline (R=11.2 mm).
poly=' '.join(f'{100000+11200*math.cos(2*math.pi*i/128):.3f} {-100000-11200*math.sin(2*math.pi*i/128):.3f}' for i in range(128))
dsn=dsn.replace('(boundary','(plane "/GND" (polygon In1.Cu 0 '+poly+'))\n    (boundary',1)
dsn=dsn.replace('(layer In1.Cu\n      (type signal)','(layer In1.Cu\n      (type power)',1)
(P/(dst+'.dsn')).write_text(dsn)
