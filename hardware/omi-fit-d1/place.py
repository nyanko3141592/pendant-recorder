import sys
if '--discard-routing' not in sys.argv:
 raise SystemExit('Historical placement/router utility. Refusing to overwrite routed D1; use an isolated copy or explicitly pass --discard-routing.')
"""Actual KiCad footprint packing study. No routing/manufacturing release."""
import json, math, random
from pathlib import Path
import pcbnew as pcb
import numpy as np
P=Path(__file__).resolve().parent;ROOT=P.parents[1];SRC=ROOT/'hardware/rev-c'
SYS=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints')
parts=json.loads((SRC/'design.json').read_text())['parts']
for p in parts:
 if p['ref']=='J2':
  p['footprint']='Connector_JST:JST_SH_SM02B-SRSS-TB_1x02-1MP_P1.00mm_Horizontal'
  p['value']='SM02B-SRSS-TB / factory protected round 150mAh pack TBD'
  p['note']='SH 2-pin assembly study. Completed protected pack and factory harness/polarity TBD. PCB NTC TH1 retained; validate insulated thermal coupling.'
for p in parts:
 if p['ref']=='U9':
  p['value']='TXS0104ERUTR'
  p['footprint']='Package_DFN_QFN:Texas_R-PUQFN-N12'
  mapping={'1':'1','2':'2','3':'3','4':'4','5':'5','7':'6','8':'12','10':'7','11':'8','12':'9','13':'10','14':'11'}
  p['pins']=[dict(q,number=mapping[q['number']]) for q in p['pins'] if q['number'] in mapping]
  p['note']='TI SCES651K Table 5-4 RUT pinout. UQFN procurement and PCBA acceptance pending.'
 if p['ref'].startswith('TP'):p['footprint']='TestPoint:TestPoint_Pad_D1.0mm'
mm=pcb.FromMM
def pt(x,y):return pcb.VECTOR2I(mm(x),mm(y))
b=pcb.BOARD(); b.SetCopperLayerCount(4);b.GetDesignSettings().SetBoardThickness(mm(.8))
fps={};sizes={};nets={}
for p in parts:
 lib,name=p['footprint'].split(':');f=pcb.FootprintLoad(str(SRC/'Pendant.pretty' if lib=='Pendant' else SYS/(lib+'.pretty')),name)
 f.SetReference(p['ref']);f.SetValue(p['value']);f.SetFPID(pcb.LIB_ID(lib,name));f.Reference().SetVisible(False);f.Value().SetVisible(False)
 pins={q['number']:q for q in p['pins']}
 for pad in f.Pads():
  n=pad.GetNumber()
  if not n or n=='MP':continue
  net=pins[n]['net'] or 'unconnected-'+p['ref']+'-'+n
  if net not in nets:nets[net]=pcb.NETINFO_ITEM(b,net);b.Add(nets[net])
  pad.SetNet(nets[net])
 b.Add(f);fps[p['ref']]=f
 bb=f.GetBoundingBox(False,False);sizes[p['ref']]=(pcb.ToMM(bb.GetWidth()),pcb.ToMM(bb.GetHeight()))
# Reserve mating plug + initial wire bend beyond the PCB header footprint.
sizes['J2']=(sizes['J2'][0],max(sizes['J2'][1],8.4))
# Conservative rectangular envelopes include pads/courtyards. 0.02mm added beyond existing courtyard bounds on each side.
R=11.5;grid=np.array([(x,y) for x in np.arange(-10.8,10.81,.3) for y in np.arange(-10.8,10.81,.3)])
candidates={}
for ref,(w0,h0) in sizes.items():
 for rot in [0,90]:
  w,h=(w0,h0) if rot==0 else (h0,w0); w+=.04;h+=.04
  ok=((abs(grid[:,0])+w/2)**2+(abs(grid[:,1])+h/2)**2)<=(R-.15)**2
  candidates[ref,rot]=grid[ok]
def solve(seed):
 rng=random.Random(seed);placed={};used={'F':[],'B':[]}
 def store(r,x,y,side,rot):
  w,h=sizes[r] if rot==0 else sizes[r][::-1]; box=[x-w/2-.02,y-h/2-.02,w+.04,h+.04]
  used[side].append(box)
  if r in ('J3','U8'):used['B' if side=='F' else 'F'].append(box)
  placed[r]=dict(x=float(x),y=float(y),side=side,rotation=rot,bbox=[float(x-w/2),float(y-h/2),w,h])
 store('J1',0,7.5,'F',0)
 f=fps['J1']; bb=f.GetBoundingBox(False,False);cx=pcb.ToMM(bb.GetCenter().x);cy=pcb.ToMM(bb.GetCenter().y)
 for pad in f.Pads():
  if pad.GetAttribute() in (pcb.PAD_ATTRIB_PTH,pcb.PAD_ATTRIB_NPTH):
   pb=pad.GetBoundingBox();used['B'].append([pcb.ToMM(pb.GetX())-cx-.25,pcb.ToMM(pb.GetY())-cy+7.5-.25,pcb.ToMM(pb.GetWidth())+.5,pcb.ToMM(pb.GetHeight())+.5])
 # Full opposite-face reservation for SWD locating holes and microphone acoustic port.
 order=sorted([r for r in fps if r!='J1'],key=lambda r:-sizes[r][0]*sizes[r][1]*(rng.uniform(.85,1.15)))
 for r in order:
  sides=['F'] if r in ['J2','SW1','D1','D6','U8'] else (['B'] if r=='TH1' else ['B','F'])
  opts=[]; target=(rng.uniform(-7,7),rng.uniform(-7,7))
  for side in sides:
   for rot in [0,90]:
    w,h=sizes[r] if rot==0 else sizes[r][::-1];w+=.04;h+=.04
    xy=candidates[r,rot];valid=np.ones(len(xy),dtype=bool)
    boxes=used[side]+(used['B' if side=='F' else 'F'] if r in ('J3','U8') else [])
    for bx,by,bw,bh in boxes:
     valid &= ~((xy[:,0]-w/2<bx+bw)&(xy[:,0]+w/2>bx)&(xy[:,1]-h/2<by+bh)&(xy[:,1]+h/2>by))
    v=xy[valid]
    if not len(v):continue
    # Compact edge packing with different seeds; no electrical routing quality claimed.
    score=((v[:,0]-target[0])**2+(v[:,1]-target[1])**2) if w*h>15 else -.5*(v[:,0]**2+v[:,1]**2)+.15*((v[:,0]-target[0])**2+(v[:,1]-target[1])**2)
    if r=='TH1':score=(v[:,0]**2+v[:,1]**2)
    i=np.argmin(score);opts.append((score[i],v[i,0],v[i,1],side,rot))
  if not opts:return placed,r
  _,x,y,side,rot=min(opts);store(r,x,y,side,rot)
 return placed,None
best={}
for seed in range(1500):
 placed,failed=solve(seed)
 if len(placed)>len(best):best=placed;print('seed',seed,'placed',len(placed),'failed',failed,flush=True)
 if not failed:break
if failed:raise RuntimeError('No full fit: '+str(len(best)))
for r,v in placed.items():
 f=fps[r]
 if v['side']=='B':f.Flip(pt(0,0),False)
 f.SetOrientationDegrees(v['rotation']);f.SetPosition(pt(0,0));bb=f.GetBoundingBox(False,False)
 f.SetPosition(pt(100+v['x']-pcb.ToMM(bb.GetCenter().x),100+v['y']-pcb.ToMM(bb.GetCenter().y)))
s=pcb.PCB_SHAPE();s.SetShape(pcb.SHAPE_T_CIRCLE);s.SetCenter(pt(100,100));s.SetEnd(pt(111.5,100));s.SetLayer(pcb.Edge_Cuts);s.SetWidth(mm(.05));b.Add(s)
b.BuildListOfNets();pcb.SaveBoard(str(P/'omi-fit-d1.kicad_pcb'),b)
(P/'placement.json').write_text(json.dumps({'status':'FOOTPRINT_PACKING_ONLY_UNROUTED_NOT_FOR_ORDER','seed':seed,'board_mm':[23,23,.8],'board_diameter_mm':23,'board_thickness_mm':.8,'case_target_mm':[25.5,25.5,14.5],'case_shape':'cylinder','placements':placed,'changes_from_rev_c':['J2 JST SH 2pin; finished protected pack not sourced','U9 TXS0104ERUTR UQFN with remapped pins','TP1..6 diameter 1mm'],'all_rev_c_refs_present':set(placed)==set(fps),'limitations':['No routing or schematic parity check','Wire/plug and PCM envelopes provisional','TH1 thermal coupling unresolved','Top connector through-board holes require 3D battery clearance verification','Reference rectangles include courtyard; not detailed body STEP models']},indent=2)+'\n')
(P/'parts.json').write_text(json.dumps(parts,indent=2)+'\n')
print('SUCCESS',len(placed))
