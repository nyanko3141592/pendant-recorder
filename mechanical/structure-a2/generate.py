import json,math
from pathlib import Path
P=Path(__file__).resolve().parent
D=json.loads((P/'footprint-bounds.json').read_text())
W,H=22,38.5
used=[];pos={}
def hit(a,b):return a[0]<b[0]+b[2]-.00001 and a[0]+a[2]>b[0]+.00001 and a[1]<b[1]+b[3]-.00001 and a[1]+a[3]>b[1]+.00001
def put(r,x,y,w,h,rot=0):used.append((x-.05,y-.05,w+.1,h+.1));pos[r]=(x+w/2-W/2,y+h/2-H/2,w,h,rot)
w,h=D['J1'];put('J1',(W-w)/2,H-h-.2,w,h)
w,h=D['U1'];put('U1',(W-w)/2,11,w,h)
for r in sorted((r for r in D if r not in ['J1','U1','J2','TH1']),key=lambda r:-D[r][0]*D[r][1]):
 options=[]
 for rot in [0,90]:
  w,h=D[r] if rot==0 else D[r][::-1]
  for y in sorted({.2}|{b[1]+b[3]+.05 for b in used}):
   for x in sorted({.2}|{b[0]+b[2]+.05 for b in used}):
    box=(x-.05,y-.05,w+.1,h+.1)
    if x+w<=W-.2 and y+h<=H-.2 and not any(hit(box,b) for b in used):options.append((y+h,x+w,x,y,w,h,rot))
 if not options:raise Exception('No fit '+r)
 _,_,x,y,w,h,rot=min(options);put(r,x,y,w,h,rot)
parts=[]
def add(n,x,y,z,w,d,h,c,g):parts.append(dict(name=n,x=x,y=y,z=z,w=w,d=d,h=h,color=c,group=g))
add('ケース底',0,0,0,24.8,41.5,1.2,'#64748b',0)
for x in [-11.8,11.8]:add('側壁',x,0,1.2,1.2,41.5,10.4,'#64748b',0)
add('上端壁',0,-20.15,1.2,22.4,1.2,10.4,'#64748b',0)
add('電池 DTP401525 / 最大寸法',0,5,1.5,15.5,27,4.2,'#d4ac50',1)
add('PCB 22 × 38.5 × 0.8',0,0,6.9,22,38.5,.8,'#17876d',2)
add('蓋 / 固定方法未設計',0,0,11.6,24.8,41.5,1.2,'#94a3b8',3)
# PH below the board, beyond the battery end; full mated plug envelope still requires audit.
add('J2 PH / 下面へ移動',0,-13.9,1.9,9.25,10.25,5,'#eee8db',2)
add('TH1 接触位置候補',6,12,6.1,1,.5,.8,'#ee9977',2)
for r,(x,y,w,d,rot) in pos.items():
 if r.startswith('TP') or r=='J3':continue
 # Show bodies smaller than allocated courtyard; heights are provisional.
 bh=.6;c='#c4b49b';bw=min(w-.35,1.6);bd=min(d-.35,.8)
 if r.startswith('U'):bw=w-.55;bd=d-.55;bh=1;c='#303746'
 if r=='U1':bw=bd=10;bh=1.6
 if r=='U8':bw,bd,bh=3.5,2.65,.98;c='#bdc7d4'
 if r=='U11':bw,bd,bh=8,6.2,1
 if r=='J1':bw,bd,bh=9,7.5,3.2;c='#bbc8d7'
 if r=='SW1':bw,bd,bh=3,2.5,1.6
 if r.startswith('Q'):bw,bd,bh=3,1.4,1
 if r.startswith('D') and r!='D2':c='#a3e635'
 if rot and r in ['U8','U11','SW1']:bw,bd=bd,bw
 add(r,x,y,7.7,bw,bd,bh,c,2)
# Illustrative side-channel reservations, not a routed cable. Retain factory lead length.
add('配線収納予約 / 容量未検証',9.2,3.5,1.5,2.2,27,4.2,'#f47c48',1)
(P/'structure.json').write_text(json.dumps(parts,ensure_ascii=False,indent=2))
(P/'layout-budget.json').write_text(json.dumps({'status':'MECHANICAL CONCEPT ONLY - NOT PCB PLACEMENT','board_mm':[W,H,.8],'enclosure_mm':[24.8,41.5,12.8],'allocated_top_footprints':pos,'bottom_refs':['J2','TH1'],'limitations':['No routing or electrical placement validation','Mated PH plug and 100mm wires not verified','Microphone acoustic corridor, LEDs, button, SWD need repositioning','Component height assumptions need manufacturer audit']},indent=2))
for mode in ['assembled','exploded','interior']:
 cmds=[]
 for i,p in enumerate(parts):
  if mode=='interior' and p['group'] in [0,3]:continue
  z=p['z']+([0,7,16,27][p['group']] if mode=='exploded' else 0);n=f'{i:02d}_{p["name"]}'
  cmds.extend([{'command':'sketch.create','params':{'plane':'XY','offset':z,'name':n+'_profile'}},{'command':'sketch.rectangle.rounded','params':{'p0':[p['x']-p['w']/2,p['y']-p['d']/2],'p1':[p['x']+p['w']/2,p['y']+p['d']/2],'radius':min(.25,p['w']/5,p['d']/5)}},{'command':'sketch.finish','params':{}},{'command':'solid.extrude','params':{'distance':p['h'],'operation':'new','body_name':n}},{'command':'appearance.assign','params':{'bodies':[n],'color':p['color']}}])
 (P/(mode+'.json')).write_text(json.dumps({'commands':cmds},ensure_ascii=False))
print('Packed',len(pos),'top footprints; 2 bottom; thickness 12.8mm concept')
