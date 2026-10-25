from pathlib import Path
import wx,json
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;fn=P/'pendant-compact-100-v5.kicad_pcb';b=k.LoadBoard(str(fn));ts=list(b.GetTracks())
def mm(p):return [round(k.ToMM(p.x),6),round(k.ToMM(p.y),6)]
for t in ts:
 if t.GetNetname()=='/PDM_DATA':print('PDM',t.m_Uuid.AsString(),mm(t.GetStart()),mm(t.GetEnd()),t.GetLayerName())
for f in b.GetFootprints():
 for p in f.Pads():
  if p.GetNetname()=='/PDM_DATA':print('PAD',f.GetReference(),p.GetNumber(),mm(p.GetPosition()))
def point(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def shift_at(x,y,dx,dy):
 old=point(x,y);new=point(x+dx,y+dy)
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA):
   if t.GetPosition()==old:t.SetPosition(new)
  else:
   if t.GetStart()==old:t.SetStart(new)
   if t.GetEnd()==old:t.SetEnd(new)
shift_at(15.6662,14.6259,0,.02)
shift_at(2.8831,1.1259,0,-.03);shift_at(2.8246,1.1259,0,-.03)

import subprocess,hashlib
for t in list(b.GetTracks()):
 if t.GetNetname()=='/PDM_DATA':b.Delete(t)
k.SaveBoard(str(fn),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(fn),'--format','json','--schematic-parity','-o',str(P/'drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
x=json.loads((P/'drc.json').read_text());d=json.loads((P/'order-status.json').read_text());d.update(drc_violations=len(x['violations']),unconnected_items=len(x['unconnected_items']),schematic_parity=len(x['schematic_parity']),tracks_and_vias=len(list(b.GetTracks())),pcb_sha256=hashlib.sha256(fn.read_bytes()).hexdigest());d['blockers'].insert(0,'PDM_DATA connection U1.40 to U9.8 remains unrouted; not manufacturing-ready');(P/'order-status.json').write_text(json.dumps(d,indent=2)+'\n');print(d)
