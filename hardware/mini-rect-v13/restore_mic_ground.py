"""Restore local microphone ground branch up to the first existing ground via."""
from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
src=k.LoadBoard(str(P/'plane-clean-candidate.kicad_pcb'));src.BuildConnectivity();c=src.GetConnectivity()
f=next(f for f in src.GetFootprints() if f.GetReference()=='U8');start=next(p for p in f.Pads() if p.GetNumber()=='5')
queue=list(c.GetConnectedTracks(start));seen=set();segments=[];stops=[]
while queue:
 t=queue.pop();uid=t.m_Uuid.AsString()
 if uid in seen:continue
 seen.add(uid)
 assert t.GetNetname()=='/GND'
 if isinstance(t,k.PCB_VIA):stops.append(uid);continue
 segments.append(t);queue.extend(c.GetConnectedTracks(t))
b=k.LoadBoard(str(P/'ground-stitched.kicad_pcb'))
for old in segments:
 t=k.PCB_TRACK(b);t.SetStart(old.GetStart());t.SetEnd(old.GetEnd());t.SetLayer(old.GetLayer());t.SetWidth(old.GetWidth());t.SetNetCode(b.FindNet('/GND').GetNetCode());b.Add(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/'mic-ground-candidate.kicad_pcb'),b)
shutil.copyfile(P/'ground-stitched.kicad_pro',P/'mic-ground-candidate.kicad_pro')
print('Restored',len(segments),'local GND segments, terminating at',len(stops),'existing vias. DRC required.')
