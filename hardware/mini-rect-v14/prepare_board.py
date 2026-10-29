"""Preserve V13 routing in an explicitly incomplete larger domestic-pack board."""
import json,hashlib,uuid,shutil
from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;S=P.parent/'mini-rect-v13'
src=S/'mic-jlc-overlap-candidate.kicad_pcb';out=P/'domestic-pack-placement-seed.kicad_pcb'
if out.exists():raise RuntimeError('Refusing overwrite: preserve any subsequent routing work')
b=k.LoadBoard(str(src));f={x.GetReference():x for x in b.GetFootprints()}
base={r:(x.GetPosition().x,x.GetPosition().y,x.GetLayer(),x.GetOrientationDegrees()) for r,x in f.items()}
tracks=len(list(b.GetTracks()));b.DeleteNative(f['J2'])
lib=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints')
for ref,library,name,x,y,rot in [('J2','Connector_JST','JST_PH_S2B-PH-SM4-TB_1x02-1MP_P2.00mm_Horizontal',25,31,90),('TH1','Resistor_SMD','R_0603_1608Metric',10.5,31,0)]:
 fp=k.FootprintLoad(str(lib/(library+'.pretty')),name);assert fp
 b.Add(fp);fp.SetReference(ref);fp.SetFPID(k.LIB_ID(library,name));fp.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));fp.SetOrientationDegrees(rot);f[ref]=fp
# Physical outline is a placement study, not a case or release decision.
for a in list(b.GetDrawings()):
 if a.GetLayer()==k.Edge_Cuts:b.DeleteNative(a)
for a,c in [((0,0),(30,0)),((30,0),(30,40)),((30,40),(0,40)),((0,40),(0,0))]:
 s=k.PCB_SHAPE();s.SetShape(k.SHAPE_T_SEGMENT);s.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));s.SetEnd(k.VECTOR2I(k.FromMM(c[0]),k.FromMM(c[1])));s.SetLayer(k.Edge_Cuts);s.SetWidth(k.FromMM(.05));b.Add(s)
d=json.loads((P/'design.json').read_text());root=str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/mini-rect-v14/root'))
for part in d['parts']:
 fp=f[part['ref']];fp.SetValue(part['value'])
 # Keep U8's reviewed JLC SMD footprint from actual board, rather than downgrade to old schematic lands.
 if part['ref']=='U8':part['footprint']=str(fp.GetFPID().GetLibNickname())+':'+str(fp.GetFPID().GetLibItemName())
 fp.SetPath(k.KIID_PATH('/'+root+'/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/mini-rect-v14/'+part['ref']))))
 pins={p['number']:p['net'] for p in part['pins']}
 for pad in fp.Pads():
  num=pad.GetNumber()
  if num not in pins:
   assert not num or num=='MP',(part['ref'],num)
   continue
  net=pins[num]
  if net is None:pad.SetNetCode(0);continue
  ni=b.FindNet('/'+net)
  if not ni:ni=k.NETINFO_ITEM(b,'/'+net);b.Add(ni)
  pad.SetNet(ni)
assert len(list(b.GetTracks()))==tracks
for r,v in base.items():
 if r=='J2':continue
 x=f[r];assert v==(x.GetPosition().x,x.GetPosition().y,x.GetLayer(),x.GetOrientationDegrees())
k.SaveBoard(str(out),b)
shutil.copyfile(S/'mic-jlc-overlap-candidate.kicad_pro',out.with_suffix('.kicad_pro'))
shutil.copyfile(S/'mic-jlc-overlap-candidate.kicad_dru',out.with_suffix('.kicad_dru'))
(P/'design.json').write_text(json.dumps(d,indent=2)+'\n')
r=dict(status='PLACEMENT_SEED_INCOMPLETE_NOT_FOR_MANUFACTURE',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),board_sha256=hashlib.sha256(out.read_bytes()).hexdigest(),board_mm=[30,40],layers=b.GetCopperLayerCount(),retained_tracks_and_vias=tracks,unchanged_footprint_positions=len(base)-1,footprints=len(f),replaced=['J2'],added=['TH1'],unresolved=['PH pinout unqualified','J2 and TH1 unrouted; old J2 track stubs retained for rework','Copper zones still cover old board area; do not infer full new planes','30x40 outline provisional; battery20.5x37x5.2, leads100mm, connector5.5mm height, acoustic path and closure need actual fit','No DRC claim or case compatibility; not a manufacturing input'])
(P/'placement-seed-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
