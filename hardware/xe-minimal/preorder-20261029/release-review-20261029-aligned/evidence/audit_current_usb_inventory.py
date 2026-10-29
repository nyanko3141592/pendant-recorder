import wx,pcbnew as k,json,hashlib,collections
from pathlib import Path
app=wx.App(False);p=Path('hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned');src=p/'design/pendant-review.kicad_pcb';b=k.LoadBoard(str(src));out={}
for net in ['/USB_DP','/USB_DM']:
 seg=[];vias=[]
 for t in b.GetTracks():
  if t.GetNetname()!=net:continue
  if isinstance(t,k.PCB_VIA):vias.append({'xy_mm':[k.ToMM(t.GetPosition().x),k.ToMM(t.GetPosition().y)],'drill_mm':k.ToMM(t.GetDrillValue())})
  else:seg.append({'uuid':t.m_Uuid.AsString(),'layer':b.GetLayerName(t.GetLayer()),'width_mm':k.ToMM(t.GetWidth()),'length_mm':k.ToMM(t.GetLength())})
 out[net]={'segments':seg,'vias':vias,'total_branch_inclusive_length_mm':sum(t['length_mm'] for t in seg)}
(p/'evidence/current-usb-inventory.json').write_text(json.dumps({'pcb_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'nets':out,'limit':'Branch-inclusive lengths, not endpoint skew or impedance certification'},indent=2)+'\n');print({n:{'vias':len(x['vias']),'length':x['total_branch_inclusive_length_mm']} for n,x in out.items()})
