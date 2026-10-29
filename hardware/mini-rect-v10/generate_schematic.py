#!/usr/bin/env python3
"""Generate a self-contained KiCad schematic and review tables from design.json.
Rectangular symbols deliberately show every pin. Footprints are NOT manufacturing-ready.
"""
import csv,json,math,uuid,sys
from pathlib import Path
REV=sys.argv[1] if len(sys.argv)>1 else 'rev-a'
assert REV in ('rev-a','rev-b','rev-c','omi-fit-d1','mini-rect-v10')
ROOT=Path(sys.argv[2]).resolve() if len(sys.argv)>2 else Path(__file__).resolve().parents[1]/REV
d=json.loads((ROOT/'design.json').read_text()); parts=list(d['parts'])
for i,net in enumerate((['GND','VDDA','VBUS'] if REV in ('rev-a','rev-c','omi-fit-d1','mini-rect-v10') else ['GND','VBUS','SYS']),1):
 parts.append(dict(ref=f'#FLG0{i}',value='PWR_FLAG',pins=[dict(number='1',name='pwr',net=net,type='power_out')],section=1,note='Supply declaration after connector/passive path',footprint=''))
def uid(key):return str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/'+REV+'/'+key))
def q(s):return json.dumps(str(s))
def effects(size=1,extra=''):return f'(effects (font (size {size} {size})) {extra})'
root=uid('root'); libs=[]; items=[]; rows=[]; positions={s:45.72 for s in range(4)}
for part in parts:
 ref=part['ref']; physical=not ref.startswith('#'); bom_item=physical and not (REV in ('rev-c','omi-fit-d1','mini-rect-v10') and (ref=='J3' or ref.startswith('TP'))); pins=part['pins']; n=math.ceil(len(pins)/2); h=max(10.16,(n+1)*3.81); w=66.04
 x=152.4+274.32*part['section']; y=positions[part['section']]+h/2; positions[part['section']]+=h+12.7
 name='Part_'+ref; libid='Pendant:'+name
 geometry=[]; placement=[]
 for i,p in enumerate(pins):
  right=i>=n; j=i-n if right else i; px=(w/2+5.08)*(1 if right else -1); py=h/2-3.81*(j+1); angle=180 if right else 0
  geometry.append(f'(pin {p["type"]} line (at {px} {py} {angle}) (length 5.08) (name {q(p["name"])} {effects()}) (number {q(p["number"])} {effects(.9)}))')
  ax=x+px; ay=y-py
  placement.append(f'(pin {q(p["number"])} (uuid {uid(ref+"/pin/"+p["number"])}))')
  if p['net'] is None:items.append(f'(no_connect (at {ax} {ay}) (uuid {uid(ref+"/nc/"+p["number"])}))')
  else:
   end=ax+(7.62 if right else -7.62)
   items.append(f'(wire (pts (xy {ax} {ay}) (xy {end} {ay})) (stroke (width 0) (type default)) (uuid {uid(ref+"/wire/"+p["number"])}))')
   # Local labels are global throughout this single sheet.
   items.append(f'(label {q(p["net"])} (at {end} {ay} 0) {effects(1,"(justify "+("left" if right else "right")+" bottom)")} (uuid {uid(ref+"/label/"+p["number"])}))')
  rows.append([ref,part['value'],p['number'],p['name'],p['net'] or 'NC',p['type']])
 libs.append(f'''(symbol {q(libid)} (pin_names (offset 1.016)) (in_bom yes) (on_board yes)
 (property "Reference" "U" (at 0 {h/2+5.08} 0) {effects(1.27)})
 (property "Value" {q(part['value'])} (at 0 {h/2+2.54} 0) {effects(1.27)})
 (symbol {q(name+'_0_1')} (rectangle (start {-w/2} {h/2}) (end {w/2} {-h/2}) (stroke (width .254) (type default)) (fill (type background))))
 (symbol {q(name+'_1_1')} {''.join(geometry)}))''')
 items.append(f'''(symbol (lib_id {q(libid)}) (at {x} {y} 0) (unit 1) (in_bom {"yes" if bom_item else "no"}) (on_board {"yes" if physical else "no"}) (dnp no) (uuid {uid(ref)})
 (property "Reference" {q(ref)} (at {x} {y-h/2-5.08} 0) {effects(1.27)})
 (property "Value" {q(part['value'])} (at {x} {y-h/2-2.54} 0) {effects(1.27)})
 (property "Footprint" {q(part['footprint'])} (at {x} {y} 0) {effects(1,'hide')})
 {''.join(placement)}
 (instances (project "pendant-{REV}" (path "/{root}" (reference {q(ref)}) (unit 1)))))''')
for s,title in enumerate(['01 MCU / RTC / UI','02 USB-C / CHARGER','03 POWER / FUEL GAUGE','04 AUDIO / SD / INDICATORS']):
 items.append(f'(text {q(title)} (at {150+275*s} 25 0) {effects(3)} (uuid {uid(title)}))')
items.append(f'(text "ENGINEERING DRAFT - NOT FOR FABRICATION - See hardware/{REV}/README.md" (at 580 12 0) {effects(3)} (uuid {uid("warning")}))')
text=f'''(kicad_sch (version 20250114) (generator "eeschema") (uuid {root}) (paper "A0")
 (title_block (title "Pendant Recorder - Omi-derived electrical design") (date "2026-10-25") (rev "{REV} DRAFT") (comment 1 "Unrouted PCB / no manufacturing release"))
 (lib_symbols {''.join(libs)}) {''.join(items)})'''
(ROOT/(f'{REV}.kicad_sch' if REV=='omi-fit-d1' else f'pendant-{REV}.kicad_sch')).write_text(text)
(ROOT/'Pendant.kicad_sym').write_text('(kicad_symbol_lib (version 20241209) (generator \"kicad_symbol_editor\") '+''.join(libs).replace('Pendant:','')+')')
(ROOT/'sym-lib-table').write_text('(sym_lib_table (version 7) (lib (name \"Pendant\") (type \"KiCad\") (uri \"${KIPRJMOD}/Pendant.kicad_sym\") (options \"\") (descr \"Project pin-level symbols\")))\n')
with (ROOT/'connections.csv').open('w') as f:
 w=csv.writer(f,lineterminator="\n");w.writerow(['Reference','Part','Pin','Signal','Net','Electrical type']);w.writerows(r for r in rows if not r[0].startswith('#'))
with (ROOT/'bom.csv').open('w') as f:
 w=csv.writer(f,lineterminator="\n");w.writerow(['Reference','Part/value','Footprint','Design note']);w.writerows([p['ref'],p['value'],p['footprint'],p['note']] for p in parts if not p['ref'].startswith('#'))
print(f'{len(parts)} parts, {len(rows)} pins; column extents {positions}')
assert max(positions.values())<800, 'Schematic exceeds page'
