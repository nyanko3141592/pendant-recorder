import sys
if '--overwrite-current' not in sys.argv: raise SystemExit('Historical promotion utility; --overwrite-current would replace the current board and its later USB land-pattern correction.')
"""Promote validated connectivity trial, retaining NOT_FOR_ORDER status."""
from pathlib import Path
import pcbnew as p,json,shutil
P=Path(__file__).resolve().parent;D=P.parent;s='candidate6pre-grid-grid'
r=json.load(open(P/'drc6pre-finish.json'))
assert len(r['unconnected_items'])==0 and len(r.get('schematic_parity',[]))==0
assert all(v['type']=='hole_clearance' for v in r['violations'])
b=p.LoadBoard(str(P/(s+'.kicad_pcb')))
pl=json.load(open(D/'placement.json'));pl['placements']={}
for f in b.GetFootprints():
 bb=f.GetBoundingBox(False,False);x,y,w,h=[p.ToMM(v) for v in [bb.GetX(),bb.GetY(),bb.GetWidth(),bb.GetHeight()]]
 pl['placements'][f.GetReference()]={'x':x+w/2-100,'y':y+h/2-100,'side':'B' if f.IsFlipped() else 'F','rotation':f.GetOrientationDegrees(),'bbox':[x-100,y-100,w,h]}
pl.update(status='ROUTED_CONNECTIVITY_VERIFIED_NOT_FOR_ORDER',copper_layers=6,minimum_trace_clearance_mm=.1,via_diameter_mm=.35,via_drill_mm=.15)
pl.pop('seed',None)
for ext in ['kicad_pcb','kicad_pro','kicad_sch']:shutil.copyfile(P/(s+'.'+ext),D/('omi-fit-d1.'+ext))
(D/'placement.json').write_text(json.dumps(pl,indent=2)+'\n')
d=json.load(open(P/'pin-remap/design.json'));d['revision']='D1.1 circular routed engineering draft, 6-layer, MIC_EN PB5'
(D/'design.json').write_text(json.dumps(d,indent=2)+'\n')
parts=json.load(open(D/'parts.json'));pins={x['ref']:x['pins'] for x in d['parts']}
for part in parts:part['pins']=pins[part['ref']]
(D/'parts.json').write_text(json.dumps(parts,indent=2)+'\n')
for name in ['connections.csv','bom.csv','Pendant.kicad_sym','sym-lib-table']:shutil.copyfile(P/'pin-remap'/name,D/name)
shutil.copyfile(P/'drc6pre-finish.json',D/'drc.json')
print('Promoted 6-layer routing; all order gates still apply')
