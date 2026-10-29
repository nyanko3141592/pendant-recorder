"""Copper geometry and resistance screen; not battery/runtime qualification."""
from pathlib import Path
import json,hashlib,collections
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'xe-terminal-candidate.kicad_pcb';b=k.LoadBoard(str(src));rows=[]
for net in ['/BAT','/SYS','/V3V3','/VBUS']:
 ts=[t for t in b.GetTracks() if t.GetNetname()==net and not isinstance(t,k.PCB_VIA)];widths=collections.defaultdict(float)
 for t in ts:widths[round(k.ToMM(t.GetWidth()),4)]+=k.ToMM(t.GetLength())
 # Sum of all branches, not a specific current path; excludes vias, pads, planes, contacts.
 resistance=sum(.01724*k.ToMM(t.GetLength())/1000/(k.ToMM(t.GetWidth())*.035) for t in ts)
 rows.append(dict(net=net,segment_count=len(ts),length_by_width_mm={str(w):round(l,4) for w,l in sorted(widths.items())},all_branch_trace_resistance_ohm_at_assumed_35um=round(resistance,6)))
r=dict(status='GEOMETRY_ONLY_NOT_POWER_APPROVAL',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),rows=rows,assumptions=['35um uniform copper, resistivity0.01724 ohm mm2/m','Resistance sums every branch and excludes vias/pads/planes; not an operating voltage-drop prediction'],remaining=['Verify fabrication copper and power-current paths including necks and vias','USB supply startup/suspend and charger voltage constraints','Exact storage peak and average current and 16h runtime']);(P/'power-geometry-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(rows,indent=2))
