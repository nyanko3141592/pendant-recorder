from pathlib import Path
HERE=Path(__file__).resolve().parent
source=HERE/'render_actual_fit_case_v3.py'
s=source.read_text();s=s.replace('OUT=HERE/"actual-fit-case-v3"','OUT=HERE/"fixed-board-compact-v1"').replace('case-v3','case-compact-v1').replace('Wall tunnel / no inner boss','30.8 mm compact candidate').replace('4-layer PCB and battery fit','Fixed PCB / battery / cord barrier').replace('HW-V1.4 4-layer + case v3 - corner-wall cord tunnel','Fixed 27.5 mm PCB - compact case candidate, not released').replace('31.4 x 31.4 x 13.9 mm | no inner cord boss | 27.5 mm PCB + DTP401525-XE','30.8 x 30.8 x 13.9 mm | integral cord barrier | impact qualification pending')
s=s.replace('if explode: add(ax,pcb,"#187044"); add(ax,battery,"#397fa8")', 'if explode: add(ax,battery,"#397fa8")').replace('Fixed PCB / battery / cord barrier','Exploded shell / battery / cord barrier')
exec(compile(s,str(source),'exec'),{'__file__':str(source),'__name__':'compact_render'})
