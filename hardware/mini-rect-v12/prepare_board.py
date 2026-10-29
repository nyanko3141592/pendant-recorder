"""USB-focused placement candidate. Preserve prior routed board."""
from pathlib import Path
import shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
name='pendant-mini-rect-v12'
existing=P/(name+'.kicad_pcb')
if existing.exists() and len(k.LoadBoard(str(existing)).GetTracks()):
 raise RuntimeError('Refusing to overwrite routed board')

b=k.LoadBoard(str(P.parent/'mini-rect-v11/plane6-trial.kicad_pcb'))
assert not list(b.GetTracks())
f={f.GetReference():f for f in b.GetFootprints()}
def move(ref,x,y,rot=None,back=None):
 a=f[ref]
 if back is not None and (a.GetLayer()==k.B_Cu)!=back:a.Flip(a.GetPosition(),False)
 a.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)))
 if rot is not None:a.SetOrientationDegrees(rot)
move('U2',10.85,16.45)
move('TP1',18.75,17.15)
move('TP3',18.75,19.3)
move('R14',16.5,21.5)
move('R6',8.75,16.0)
for ref in ['R8','R9']:b.DeleteNative(f[ref])
import uuid
for a in b.GetFootprints():
 a.SetPath(k.KIID_PATH('/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/mini-rect-v12/root'))+'/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/mini-rect-v12/'+a.GetReference()))))
 for pad in a.Pads():
  if pad.GetNetname() in ['/USB_DP_MCU','/USB_DM_MCU']:
   pad.SetNet(b.FindNet(pad.GetNetname().removesuffix('_MCU')))

k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
print('saved placement candidate; geometry/clearance review required')
