#!/usr/bin/env python3
"""Remove only DRC-reported dangling copper. Re-run DRC after this operation."""
import json
from pathlib import Path
import pcbnew as p
O=Path(__file__).resolve().parents[1]/'rev-c'
b=p.LoadBoard(str(O/'pendant-rev-c.kicad_pcb'));report=json.loads((O/'drc.json').read_text())
ids={i['uuid'] for v in report['violations'] if v['type'] in ('via_dangling','track_dangling') for i in v['items']}
n=0
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in ids:b.RemoveNative(t);n+=1
p.ZONE_FILLER(b).Fill(b.Zones());p.SaveBoard(str(O/'pendant-rev-c.kicad_pcb'),b);print('Removed dangling copper:',n)
