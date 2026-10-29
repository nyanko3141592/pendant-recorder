"""Ensure corridor rerouting did not alter USB tracks or vias."""
from pathlib import Path
import json,hashlib
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
paths=[P/'usb-corridor-source.kicad_pcb',P/'usb-pair-connected.kicad_pcb']
def geometry(path):
 b=k.LoadBoard(str(path));rows=[]
 for t in b.GetTracks():
  if t.GetNetname() not in ['/USB_DP','/USB_DM']:continue
  row=[t.GetNetname(),type(t).__name__,t.GetStart().x,t.GetStart().y,t.GetEnd().x,t.GetEnd().y,int(t.GetLayer()),(t.GetWidth(k.F_Cu) if isinstance(t,k.PCB_VIA) else t.GetWidth())]
  if isinstance(t,k.PCB_VIA):row.append(t.GetDrill())
  rows.append(row)
 return sorted(rows)
a,b=[geometry(p) for p in paths];r={'status':'PASS' if a==b else 'FAIL','USB_copper_items':len(b),'source_sha256':hashlib.sha256(paths[0].read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(paths[1].read_bytes()).hexdigest(),'scope':'USB copper unchanged during non-USB rerouting; does not prove SI, reference planes or impedance'};(P/'usb-pair-preserved.json').write_text(json.dumps(r,indent=2)+'\n');print(r);assert a==b
