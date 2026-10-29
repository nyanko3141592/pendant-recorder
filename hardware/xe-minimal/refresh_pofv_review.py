#!/usr/bin/env python3
import json,wx,pcbnew as k
from pathlib import Path
wx.App(False);h=Path(__file__).resolve().parent;a=json.loads((h/'exact-via-pad-overlap-audit.json').read_text());p=h/'via-in-pad-process-review.json';r=json.loads(p.read_text());b=k.LoadBoard(str(h/'pendant-xe-minimal.kicad_pcb'));by={v.m_Uuid.AsString():v for v in b.GetTracks() if type(v) is k.PCB_VIA};rows=[]
for item in a['vias']:
 hits=[x for x in item['hits'] if x['hole_overlaps_pad']]
 if not hits:continue
 v=by[item['uuid']];rows.append({'uuid':item['uuid'],'net':v.GetNetname(),'pad':','.join(f"{x['ref']}.{x['pad']}" for x in hits),'xy_mm':item['xy_mm'],'drill_mm':k.ToMM(v.GetDrillValue()),'diameter_mm':k.ToMM(v.GetWidth(k.F_Cu)),'filled':v.GetFillingMode()==k.FILLING_MODE_FILLED,'capped':v.GetCappingMode()==k.CAPPING_MODE_CAPPED})
assert len(rows)==4 and all(x['filled'] and x['capped'] for x in rows)
r['decision']='Retain the four local hole-over-pad vias as epoxy-filled, planarized and copper-capped POFV. The TPS22950 integration adds one VBUS_CHARGER overlap but does not add a new process class because the selected six-layer ENIG build already requires POFV for three existing vias.';r['current_vias']=rows;p.write_text(json.dumps(r,ensure_ascii=False,indent=2)+'\n')
