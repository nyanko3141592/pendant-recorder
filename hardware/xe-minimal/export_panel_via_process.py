"""Translate and verify source via process intent for every panel unit."""
from pathlib import Path
import json,hashlib,csv
import pcbnew as k,wx
app=wx.App(False);p=Path(__file__).resolve().parent;d=p/'electrical-panel-candidate-v3';pcb=d/'panel.kicad_pcb';sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest();out=d/('fabrication-review-'+sha(pcb)[:12]);assert out.is_dir()
a=json.loads((p/'active-design.json').read_text());source=p/a['manufacturing_review_directory']/'via-process-intent.json';r=json.loads(source.read_text());assert sha(p/a['board'])==r['source_pcb_sha256'];layout=json.loads((p/'supported-panel-topology-study.json').read_text());b=k.LoadBoard(str(pcb));vias=[v for v in b.GetTracks() if isinstance(v,k.PCB_VIA)];rows=[];matched=set()
for unit in layout['units']:
 n=unit['unit'];x,y=unit['bounds_mm'][:2]
 for original in r['vias']:
  px,py=round((x+original['x_mm'])*1e6),round((y+original['y_mm'])*1e6)
  hits=[v for v in vias if v.GetPosition().x==px and v.GetPosition().y==py and v.GetNetname()==f'P{n}'+original['net']];assert len(hits)==1
  v=hits[0];uid=v.m_Uuid.AsString();assert uid not in matched;matched.add(uid)
  assert abs(k.ToMM(v.GetDrillValue())-original['drill_mm'])<1e-9 and abs(k.ToMM(v.GetWidth(k.F_Cu))-original['copper_mm'])<1e-9
  assert int(v.GetFillingMode())==original['filling_mode'] and int(v.GetCappingMode())==original['capping_mode']
  if original['filled'] and original['capped']:rows.append({'unit':n,'source_uuid':original['uuid'],'panel_uuid':uid,'net':v.GetNetname(),'x_board_mm':px/1e6,'y_board_mm':py/1e6,'y_export_mm':-py/1e6,'drill_mm':original['drill_mm'],'copper_mm':original['copper_mm']})
assert len(matched)==len(vias)==1518 and len(rows)==84
with (out/'filled-capped-vias.csv').open('w',newline='') as f:
 w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
report={'status':'VERIFIED_PANEL_PROCESS_INTENT_NOT_FABRICATOR_APPROVAL','panel_sha256':sha(pcb),'source_intent_sha256':sha(source),'matched_vias':len(matched),'filled_capped_count':len(rows),'filled_capped_per_unit':14,'coordinate_convention':'Board XY as top view, Y down. Export Y is negated; bottom is not mirrored.','process_intent':'Nonconductive epoxy fill, planarization, copper cap and ENIG; capability and solderability unqualified.','limitations':['Other vias retain unspecified process modes; unspecified does not imply approved open/tented processing.','CSV is supplementary process intent and must accompany CAM review; not encoded by drill diameters alone.']};(out/'via-process-review.json').write_text(json.dumps(report,indent=2)+'\n');print('matched',len(matched),'filled/capped',len(rows))
