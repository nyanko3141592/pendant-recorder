"""Compare actual USB copper geometry to the last reviewed V15 board."""
from pathlib import Path
from collections import Counter
import json,sys
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
src=P.parent/'charger-4v1-candidate.kicad_pcb';dst=Path(sys.argv[1])
def geometry(path):
 b=k.LoadBoard(str(path));rows=[]
 for t in b.GetTracks():
  if t.GetNetname() not in ['/USB_DP','/USB_DM']:continue
  if isinstance(t,k.PCB_VIA):
   p=t.GetPosition();row=('via',t.GetNetname(),p.x,p.y,t.GetWidth(k.F_Cu),t.GetDrillValue(),t.TopLayer(),t.BottomLayer())
  else:
   a,c=sorted([(t.GetStart().x,t.GetStart().y),(t.GetEnd().x,t.GetEnd().y)]);row=('track',t.GetNetname(),t.GetLayer(),t.GetWidth(),a,c)
  rows.append(row)
 return Counter(rows)
a,c=geometry(src),geometry(dst);r={'status':'PASS' if a==c else 'FAIL','source':str(src),'candidate':str(dst),'source_items':sum(a.values()),'candidate_items':sum(c.values()),'missing':list((a-c).elements()),'added':list((c-a).elements()),'scope':'Copper geometry only; referenceplane coverage andSI require separate review'}
dst.with_suffix('.usb-preserved.json').write_text(json.dumps(r,indent=2)+'\n');print(r['status'],r['source_items'],r['candidate_items']);assert a==c
