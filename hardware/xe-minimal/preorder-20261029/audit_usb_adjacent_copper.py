import argparse
ap=argparse.ArgumentParser();ap.add_argument("--board",type=__import__("pathlib").Path);ap.add_argument("--output",type=__import__("pathlib").Path);args=ap.parse_args()
from pathlib import Path
import pcbnew as k, wx, json, hashlib, math
app=wx.App(False)
w=Path(__file__).resolve().parent
p=args.board or w/'usb-3313-width-trial.kicad_pcb'; b=k.LoadBoard(str(p))
usb={'/USB_DP','/USB_DM'}
shapes={layer:[] for layer in (k.F_Cu,k.B_Cu)}
for layer in shapes:
 for t in b.GetTracks():
  if t.IsOnLayer(layer) and t.GetNetname() not in usb:
   shapes[layer].append((str(t.GetNetname()),'via' if isinstance(t,k.PCB_VIA) else 'track',t.GetEffectiveShape(layer)))
 for f in b.GetFootprints():
  for pad in f.Pads():
   if pad.IsOnLayer(layer) and pad.GetNetname() not in usb:
    shapes[layer].append((str(pad.GetNetname()),f.GetReference()+'.'+pad.GetNumber(),pad.GetEffectiveShape(layer)))
 for z in b.Zones():
  if z.IsOnLayer(layer) and not z.GetIsRuleArea() and z.GetNetname() not in usb:
   shapes[layer].append((str(z.GetNetname()),'filled_zone',z.GetFilledPolysList(layer)))
rows=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetNetname() not in usb or t.GetLayer() not in shapes:continue
 a,c=t.GetStart(),t.GetEnd(); length=k.ToMM(t.GetLength()); n=max(1,math.ceil(length/.1))
 for i in range(n):
  point=k.VECTOR2I(round(a.x+(c.x-a.x)*(i+.5)/n),round(a.y+(c.y-a.y)*(i+.5)/n))
  d,net,item=min((s.Distance(point),net,item) for net,item,s in shapes[t.GetLayer()])
  rows.append({'net':str(t.GetNetname()),'layer':b.GetLayerName(t.GetLayer()),'xy_mm':[k.ToMM(point.x),k.ToMM(point.y)],'edge_gap_mm':k.ToMM(d)-k.ToMM(t.GetWidth())/2,'adjacent_net':net,'adjacent_item':item,'represented_length_mm':length/n})
summary={}
for net in sorted(usb):
 r=[q for q in rows if q['net']==net]
 summary[net]={'min_sampled_edge_gap_mm':min(q['edge_gap_mm'] for q in r),'sampled_length_with_other_copper_within_3h_mm':sum(q['represented_length_mm'] for q in r if q['edge_gap_mm']<3*.0994)}
out={'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'sampling_pitch_max_mm':.1,'reference_h_mm':.0994,'summary':summary,'samples':rows,'limitations':['3h is a screening distance, not an impedance pass/fail criterion','USB net copper excluded; same-net branches and opposite pair require separate assessment','No field solution, endpoint skew, fabrication tolerance or electrical certification'],'release_allowed':False}
(args.output or w/'usb-adjacent-copper.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(summary))
