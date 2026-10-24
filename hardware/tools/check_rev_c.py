#!/usr/bin/env python3
"""Connectivity audit and fail-closed release status, run with KiCad Python."""
import json,hashlib,subprocess,sys,collections
from pathlib import Path
import pcbnew as p
O=Path(__file__).resolve().parents[1]/'rev-c';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for domain in ('sch','pcb'):
 subprocess.run([cli,domain,'erc' if domain=='sch' else 'drc']+(['--schematic-parity'] if domain=='pcb' else [])+['--format','json','-o',str(O/('erc.json' if domain=='sch' else 'drc.json')),str(O/('pendant-rev-c.kicad_sch' if domain=='sch' else 'pendant-rev-c.kicad_pcb'))],check=True)
d=json.loads((O/'design.json').read_text());expected={(part['ref'],pin['number']):pin['net'] for part in d['parts'] for pin in part['pins']};b=p.LoadBoard(str(O/'pendant-rev-c.kicad_pcb'));actual={};pads=0
for f in b.GetFootprints():
 for pad in f.Pads():
  if not pad.GetNumber() or pad.GetNumber()=='MP':continue
  key=(f.GetReference(),pad.GetNumber());net=pad.GetNetname();net=None if net.startswith('unconnected-') else net.removeprefix('/')
  assert key not in actual or actual[key]==net
  actual[key]=net;pads+=1
assert expected==actual, (set(expected.items())^set(actual.items()))
e=json.loads((O/'erc.json').read_text());r=json.loads((O/'drc.json').read_text());erc=sum(len(s['violations']) for s in e['sheets']);tracks=list(b.GetTracks())
audit={'status':'PASS_NET_MEMBERSHIP_ONLY','physical_pad_count':pads,'logical_pin_count':len(expected),'parts':len(d['parts']),'tracks_and_vias':len(tracks),'via_count':sum(t.GetClass()=='PCB_VIA' for t in tracks)}
(O/'pcb-net-audit.json').write_text(json.dumps(audit,indent=2)+'\n')
status={'revision':'C0','order_ready':False,'erc_violations':erc,'drc_violations':len(r['violations']),'drc_types':dict(collections.Counter(v['type'] for v in r['violations'])),'unconnected_items':len(r['unconnected_items']),'schematic_parity_issues':len(r.get('schematic_parity',[])),'pcb_net_audit':audit,'board_mm':[21,31,.8],'enclosure_study_mm':[23.8,34,14.0],'runtime_required_h':16,'runtime_measured_h':None,'storage_required_h':36,'blockers':['Incomplete routing / DRC; USB pair/return path and decoupling review','Independent complete pin/AF/land pattern audit','Exact MPN/JLC stock and PCBA acceptance; unresolved BOM TBDs','USB input/inrush and power-path transient validation','3.3V LDO battery capacity, ADC calibration, 16h real recording','Mated PH, uncut 100mm leads, NTC thermal contact, microphone duct, fastening, wearing attachment and fixture','Firmware, standard encrypted storage and power-loss recovery, 3 OS sync not implemented'],'hashes':{n:hashlib.sha256((O/n).read_bytes()).hexdigest() for n in ['design.json','pendant-rev-c.kicad_sch','pendant-rev-c.kicad_pcb','erc.json','drc.json']}}
(O/'order-status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps(status,indent=2));sys.exit(2)
