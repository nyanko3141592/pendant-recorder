"""Search two-segment dogbones for remaining hole-over-pad vias.

Existing long routes are not moved.  The old via is relocated and each layer
that terminated there receives a two-segment local stub.  Full KiCad DRC,
parity, and connectivity are authoritative.
"""
from pathlib import Path
import hashlib, json, math, shutil, subprocess, sys, tempfile
import pcbnew as k
import wx

app=wx.App(False); O=Path(__file__).resolve().parent
CLI='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'; SRC=O/'pendant-xe-minimal.kicad_pcb'
targets={
 'd5f838d5':('d5f838d5-49c4-4b63-814d-c51369fbaf3e',(18.1025,11.205),(0,1)),
 'c2faa17a':('c2faa17a-0df5-46e8-b7e0-a5c8f86431a4',(13.415,6.0175),(-1,0)),
 'cd6f76be':('cd6f76be-442e-464d-affc-2baf7a4eb158',(21.485,15.185),(1,0)),
}
key=sys.argv[1]; uuid,pad,outward=targets[key]

def prepared():
 b=k.LoadBoard(str(SRC));v=next(t for t in b.GetTracks() if isinstance(t,k.PCB_VIA) and t.m_Uuid.AsString()==uuid);old=v.GetPosition()
 lw={k.B_Cu:k.FromMM(.15)}
 for t in b.GetTracks():
  if not isinstance(t,k.PCB_VIA) and t.GetNetCode()==v.GetNetCode() and (t.GetStart()==old or t.GetEnd()==old):lw[t.GetLayer()]=t.GetWidth()
 stubs=[]
 for layer,width in lw.items():
  a=k.PCB_TRACK(b);a.SetLayer(layer);a.SetNet(v.GetNet());a.SetWidth(width);a.SetStart(old);a.SetEnd(old);b.Add(a)
  c=k.PCB_TRACK(b);c.SetLayer(layer);c.SetNet(v.GetNet());c.SetWidth(width);c.SetStart(old);c.SetEnd(old);b.Add(c);stubs.append((a,c))
 return b,v,old,stubs

def set_candidate(state,xy,mode):
 b,v,old,stubs=state;new=k.VECTOR2I(k.FromMM(xy[0]),k.FromMM(xy[1]));v.SetPosition(new)
 elbow=k.VECTOR2I(old.x,new.y) if mode=='vertical_first' else k.VECTOR2I(new.x,old.y)
 for a,c in stubs:a.SetEnd(elbow);c.SetStart(elbow);c.SetEnd(new)

def copy_project(td):
 for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(O/f'pendant-xe-minimal{ext}',td/f'candidate{ext}')
 shutil.copyfile(O/'fp-lib-table',td/'fp-lib-table')
 for name,src in [('PendantXE.pretty',O/'PendantXE.pretty'),('PendantMinimal.pretty',O/'PendantMinimal.pretty'),('PendantD1.pretty',O.parent/'mini-rect-v15'/'PendantD1.pretty'),('Pendant_Input.pretty',O.parent/'mini-rect-v15'/'input-control-pa2-pb5'/'Pendant_Input.pretty')]:shutil.copytree(src,td/name)
 p=td/'fp-lib-table';s=p.read_text().replace('${KIPRJMOD}/../mini-rect-v15/PendantD1.pretty','${KIPRJMOD}/PendantD1.pretty').replace('${KIPRJMOD}/../mini-rect-v15/input-control-pa2-pb5/Pendant_Input.pretty','${KIPRJMOD}/Pendant_Input.pretty');p.write_text(s)

state=prepared(); tested=0; best=None; accepted=None
with tempfile.TemporaryDirectory(prefix=f'xe-bent-{key}-') as d:
 td=Path(d);copy_project(td)
 # Search outward first, then sweep +/- tangent.  Distances exceed the pad
 # edge + drill radius and use only the existing 0.15/0.35 mm rules.
 tangent=(-outward[1],outward[0])
 for od in [x/100 for x in range(55,206,10)]:
  tangents=[0]+[s*x/100 for x in range(10,161,10) for s in (1,-1)]
  for tv in tangents:
   xy=(pad[0]+outward[0]*od+tangent[0]*tv,pad[1]+outward[1]*od+tangent[1]*tv)
   if not (.35<xy[0]<27.15 and .35<xy[1]<26.65):continue
   for mode in ('vertical_first','horizontal_first'):
    set_candidate(state,xy,mode);k.SaveBoard(str(td/'candidate.kicad_pcb'),state[0]);tested+=1
    subprocess.run([CLI,'pcb','drc',str(td/'candidate.kicad_pcb'),'--refill-zones','--schematic-parity','--format','json','--severity-all','-o',str(td/'drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
    r=json.loads((td/'drc.json').read_text());score=len(r['violations'])+len(r['unconnected_items'])+len(r.get('schematic_parity',[]))
    row={'score':score,'xy_mm':xy,'mode':mode,'violations':len(r['violations']),'unconnected':len(r['unconnected_items']),'parity':len(r.get('schematic_parity',[]))}
    if best is None or score<best['score']:best=row
    if score==0:
     accepted=row;shutil.copyfile(td/'candidate.kicad_pcb',O/f'{key}-bent-standard-candidate.kicad_pcb');shutil.copyfile(td/'drc.json',O/f'{key}-bent-standard-drc.json');break
   if accepted:break
  if accepted:break
report={'source_sha256':hashlib.sha256(SRC.read_bytes()).hexdigest(),'target':key,'tested':tested,'accepted':accepted,'best':best}
(O/f'{key}-bent-standard-review.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
