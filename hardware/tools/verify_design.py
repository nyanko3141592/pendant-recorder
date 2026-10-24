#!/usr/bin/env python3
"""Check KiCad's actual exported nets against the independent connection manifest.
Also runs ERC without exclusions. This checks connectivity, not analog behavior.
"""
import collections,json,subprocess,tempfile,xml.etree.ElementTree as E,sys
from pathlib import Path
root=Path(__file__).resolve().parents[1]/'rev-a'
cli=sys.argv[1] if len(sys.argv)>1 else 'kicad-cli'
parts=json.loads((root/'design.json').read_text())['parts'];expected={};nc=set()
assert len({p['ref'] for p in parts})==len(parts)
for p in parts:
 assert len({pin['number'] for pin in p['pins']})==len(p['pins']),p['ref']
 for pin in p['pins']:
  key=(p['ref'],pin['number'])
  if pin['net'] is None:nc.add(key)
  else:expected[key]=pin['net']
with tempfile.TemporaryDirectory() as td:
 td=Path(td)
 subprocess.run([cli,'sch','export','netlist','--format','kicadxml','-o',str(td/'nets.xml'),str(root/'pendant-rev-a.kicad_sch')],check=True)
 actual={};unconnected=set()
 for net in E.parse(td/'nets.xml').getroot().findall('nets/net'):
  for pin in net.findall('node'):
   key=(pin.get('ref'),pin.get('pin'))
   if key[0].startswith('#'):continue
   if net.get('name').startswith('unconnected-'):unconnected.add(key)
   else:actual[key]=net.get('name').removeprefix('/')
 assert actual==expected, f'Net mismatch: {set(actual.items())^set(expected.items())}'
 assert not nc.intersection(actual), 'NC pin connected'
 assert unconnected==nc, f'NC mismatch: {unconnected^nc}'
 subprocess.run([cli,'sch','erc','--format','json','--exit-code-violations','-o',str(td/'erc.json'),str(root/'pendant-rev-a.kicad_sch')],check=True)
 erc=json.loads((td/'erc.json').read_text())
 assert not [v for s in erc['sheets'] for v in s['violations']]
 print(f'PASS: {len(parts)} physical parts, {len(expected)} connected pins, {len(nc)} deliberate NC pins, {len(set(expected.values()))} nets. ERC: 0 violations.')
