import json
from pathlib import Path
P=Path(__file__).resolve().parent
root=P.parents[1]
placements=json.loads((root/'hardware/rev-a/placement-report.json').read_text())['placements']
parts=[]
def add(n,x,y,z,w,d,h,c,group):parts.append(dict(name=n,x=x,y=y,z=z,w=w,d=d,h=h,color=c,group=group))
# Concept enclosure, intentionally generous to show stack. Not manufacturing geometry.
add('ケース底',0,0,0,24,38,1.2,'#64748b',0)
for x in [-11.4,11.4]:add('側壁',x,0,1.2,1.2,38,12.8,'#64748b',0)
add('上端壁',0,-18.4,1.2,21.6,1.2,12.8,'#64748b',0)
# Open end illustrates unresolved USB port integration.
add('電池 DTP401525 / 最大寸法',0,0,1.6,15.5,27,4.2,'#d4ac50',1)
add('PCB 20 × 34 × 0.8',0,0,7.6,20,34,.8,'#17876d',2)
add('蓋 / 固定方法未設計',0,0,14,24,38,1.2,'#94a3b8',3)
for ref,p in placements.items():
 if ref.startswith('TP') or ref=='J3':continue
 w,d,h=1,.5,.5;c='#d0bda0'
 if ref.startswith('U'):w,d,h=2,2,.8;c='#303746'
 if ref=='U1':w,d,h=10,10,1.6
 if ref=='U8':w,d,h=3.5,2.65,.98;c='#cbd5e1'
 if ref=='U11':w,d,h=8,6.2,1
 if ref=='J1':w,d,h=9,7.5,3.2;c='#bbc8d7'
 if ref=='J2':w,d,h=8,7.6,5;c='#eee8db'
 if ref=='SW1':w,d,h=3,2.5,1.6
 if ref.startswith('D') and ref!='D2':c='#a3e635'
 if ref.startswith('Q'):w,d,h=3,1.4,1
 if p['rotation_deg']%180:w,d=d,w
 add(ref,p['x_mm']-10,p['y_mm']-17,8.4 if p['side']=='top' else 7.6-h,w,d,h,c,2)
(P/'structure.json').write_text(json.dumps(parts,ensure_ascii=False,indent=2))
for exploded in [False,True]:
 cmds=[]
 for i,p in enumerate(parts):
  z=p['z']+([0,7,16,27][p['group']] if exploded else 0)
  n=f'{i:02d}_{p["name"]}'
  cmds.extend([{'command':'sketch.create','params':{'plane':'XY','offset':z,'name':n+'_profile'}},{'command':'sketch.rectangle.rounded','params':{'p0':[p['x']-p['w']/2,p['y']-p['d']/2],'p1':[p['x']+p['w']/2,p['y']+p['d']/2],'radius':min(.3,p['w']/5,p['d']/5)}},{'command':'sketch.finish','params':{}},{'command':'solid.extrude','params':{'distance':p['h'],'operation':'new','body_name':n}},{'command':'appearance.assign','params':{'bodies':[n],'color':p['color']}}])
 (P/('exploded.json' if exploded else 'assembled.json')).write_text(json.dumps({'commands':cmds},ensure_ascii=False))
