"""XE placement revision; deliberately unrouted and never a manufacturing input."""
from pathlib import Path
import json,shutil,hashlib
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'xe-placement-seed.kicad_pcb';out=P/'xe-usb-placement.kicad_pcb'
b=k.LoadBoard(str(src));fs={f.GetReference():f for f in b.GetFootprints()}
def v(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
moves={'J1':(0,6),'U2':(0,7),'R7':(0,6)}
positions={'R6':(3,23),'J3':(23,16),'R21':(22.5,21),'R37':(22.5,23),'TP6':(23,25.5)}
old={r:[k.ToMM(fs[r].GetPosition().x),k.ToMM(fs[r].GetPosition().y)] for r in list(moves)+list(positions)}
# Disconnect tracks directly under relocated terminals to avoid retaining false shorts.
# Preserve other original routing; all remaining connectivity is audited by DRC.
padboxes=[]
for ref in old:
 for pad in fs[ref].Pads():
  box=pad.GetBoundingBox();box.Inflate(k.FromMM(.05));padboxes.append(box)
removed=[]
for t in list(b.GetTracks()):
 if any(box.Contains(t.GetStart()) or box.Contains(t.GetEnd()) for box in padboxes):
  removed.append(t.m_Uuid.AsString());b.DeleteNative(t)
for r,delta in moves.items():fs[r].Move(v(*delta))
for r,xy in positions.items():fs[r].SetPosition(v(*xy))
fs['J2'].Reference().SetVisible(False)
# Include exact fabrication/courtyard screen for same-side bodies, excluding text.
overlaps=[]
for r in old:
 a=fs[r];bb=a.GetBoundingBox(False,False)
 for q,c in fs.items():
  if q!=r and a.GetLayer()==c.GetLayer() and bb.Intersects(c.GetBoundingBox(False,False)):
   pair=sorted([r,q])
   if pair not in overlaps:overlaps.append(pair)
k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
report={'status':'PLACEMENT_ONLY_UNROUTED_NOT_RELEASED','board_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'board_mm':[26,29],'old_positions':old,'new_positions':{r:[k.ToMM(fs[r].GetPosition().x),k.ToMM(fs[r].GetPosition().y)] for r in old},'removed_terminal_tracks_vias':len(removed),'remaining_moved_part_bbox_overlaps':overlaps,'limitations':['USB ESD moved 7mm versus socket6mm; local fanout must be rebuilt','All relocated components require reconnection','Planes and old dangling tracks require cleanup','J3 service-access and thermal/acoustic/case clearances not qualified']}
(P/'xe-usb-placement-review.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
