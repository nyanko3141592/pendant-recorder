#!/usr/bin/env python3
"""Fail closed: publish actual check results, never an unsupported order-ready flag."""
import json,hashlib,subprocess,sys,collections
from pathlib import Path
out=Path(__file__).resolve().parents[1]/'rev-b';cli=sys.argv[1] if len(sys.argv)>1 else 'kicad-cli'
for kind,cmd in [('erc',['sch','erc']),('drc',['pcb','drc'])]:
 suffix='kicad_sch' if kind=='erc' else 'kicad_pcb'
 subprocess.run([cli,*cmd,'--format','json','-o',str(out/(kind+'.json')),str(out/('pendant-rev-b.'+suffix))],check=True)
erc=json.loads((out/'erc.json').read_text());drc=json.loads((out/'drc.json').read_text());src=json.loads((out/'sourcing-review.json').read_text())
blocks=['Manufacturer pin/footprint and analog power review incomplete','USB input capacitance/inrush review incomplete','USB differential route and continuous return-path review incomplete','Factory assembly/procurement acceptance missing','Solderless programming/measurement kit unverified','Case fastening/acoustics/NTC/plug-and-lead fit incomplete','JLC panel/fixture/fiducial design incomplete']
checks={'erc_violations':sum(len(s['violations']) for s in erc['sheets']),'drc_violations':len(drc['violations']),'unconnected_items':len(drc['unconnected_items']),'drc_types':dict(collections.Counter(v['type'] for v in drc['violations'])),'assembly_unaccepted_refs':[p['ref'] for p in src['parts'] if p.get('assembly_accepted') is not True and not p['ref'].startswith('TP') and p['ref']!='J3']}
if checks['erc_violations']:blocks.insert(0,'ERC violations remain')
if checks['drc_violations']:blocks.insert(0,'DRC violations remain')
if checks['unconnected_items']:blocks.insert(0,'PCB connections remain incomplete')
r={'status':'NOT_ORDER_READY','checks':checks,'blockers':blocks,'post_build_acceptance':['continuous recording >24h','encrypted storage >=36h','random power-loss recovery','Windows/Linux/macOS authenticated wired sync'],'sha256':{n:hashlib.sha256((out/n).read_bytes()).hexdigest() for n in ['design.json','pendant-rev-b.kicad_sch','pendant-rev-b.kicad_pcb','sourcing-review.json']}}
(out/'order-status.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2));sys.exit(2)
