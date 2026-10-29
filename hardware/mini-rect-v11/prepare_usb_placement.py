"""USB-focused placement candidate. Preserve prior routed board."""
from pathlib import Path
import shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
name='usb-placement'
shutil.copy2(P/'plane6-fixedvia-repair.kicad_pro',P/(name+'.kicad_pro'))
b=k.LoadBoard(str(P/'plane6-trial.kicad_pcb'))
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
move('R8',4.8,8.0,0,True)
move('R9',4.8,9.3,0,True)
k.ZONE_FILLER(b).Fill(b.Zones())
k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
print('saved placement candidate; geometry/clearance review required')
