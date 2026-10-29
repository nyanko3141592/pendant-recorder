"""Four-layer microSD staging board; intentionally unrouted, not a placement result."""
from pathlib import Path
import json,uuid
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent
src=P.parent/'mini-rect-v12/storage-4gb-4u7-candidate.kicad_pcb'
out=P/'pendant-mini-rect-v13.kicad_pcb'
if out.exists() and list(k.LoadBoard(str(out)).GetTracks()):raise RuntimeError('Refuse to overwrite routed board')
b=k.LoadBoard(str(src))
for t in list(b.GetTracks()):b.DeleteNative(t)
for z in list(b.Zones()):b.DeleteNative(z)
f={a.GetReference():a for a in b.GetFootprints()}
b.DeleteNative(f['U11']);del f['U11']
b.SetCopperLayerCount(4)
u=f['U1'];u.Flip(u.GetPosition(),False)
socket=k.FootprintLoad(str(P/'Pendant.pretty'),'DM3D_SF_reviewed_candidate')
socket.SetReference('J4');socket.SetValue('DM3D-SF candidate');socket.SetFPID(k.LIB_ID('Pendant','DM3D_SF_reviewed_candidate'))
b.Add(socket);socket.SetPosition(k.VECTOR2I(k.FromMM(10.5),k.FromMM(8.0)))
f['J4']=socket
for ref,x in [('R29',2),('R30',4)]:
 a=k.FOOTPRINT(f['R24']);a.SetReference(ref);b.Add(a);a.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(2)));f[ref]=a
# Assign every physical pad from authoritative candidate schematic data.
d=json.loads((P/'design.json').read_text())
for part in d['parts']:
 a=f[part['ref']]
 a.SetPath(k.KIID_PATH('/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/mini-rect-v13/root'))+'/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/mini-rect-v13/'+part['ref']))))
 pinmap={p['number']:p['net'] for p in part['pins']}
 for pad in a.Pads():
  number=pad.GetNumber()
  if not number:continue
  if number not in pinmap:
   assert number=='MP' and not pad.GetNetname(),(part['ref'],number,pad.GetNetname())
   continue
  net=pinmap[number]
  if net is None:pad.SetNetCode(0);continue
  full='/'+net
  ni=b.FindNet(full)
  if not ni:
   ni=k.NETINFO_ITEM(b,full);b.Add(ni)
  pad.SetNet(ni)
from fix_clone_ids import fix
fix(b)
k.SaveBoard(str(out),b)
print(f'{len(f)} footprints; four copper layers; no tracks. Placement collisions expected.')
