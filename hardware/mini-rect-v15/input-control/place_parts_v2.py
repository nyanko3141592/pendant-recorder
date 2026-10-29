"""Make a separate unrouted input-control placement. Never overwrite source routing."""
from pathlib import Path
import json,uuid,shutil,hashlib,math
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent; S=P.parent/'charger-4v1-candidate.kicad_pcb';O=P/'input-placement-v2.kicad_pcb'
if O.exists():raise RuntimeError('Preserve existing placement; use a new filename for a new revision')
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(S.with_suffix(ext),O.with_suffix(ext))
b=k.LoadBoard(str(S));fs={f.GetReference():f for f in b.GetFootprints()};d=json.loads((P/'design.json').read_text());lib=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints')
def vec(x,y):return k.VECTOR2I(k.FromMM(x),k.FromMM(y))
def rect(bb):return tuple(k.ToMM(v) for v in [bb.GetLeft(),bb.GetTop(),bb.GetRight(),bb.GetBottom()])
def overlap(a,c,m=0):return a[0]<c[2]+m and a[2]>c[0]-m and a[1]<c[3]+m and a[3]>c[1]-m
oldrefs=set(fs);added=[];keepouts=[]
# Through holes affect both sides; acoustic gasket/thermal contact and connector harness allocations also reserved.
for f in fs.values():
 for pad in f.Pads():
  if pad.GetDrillSize().x:keepouts.append(rect(pad.GetBoundingBox()))
reserved_back=[(17.98,15.05,20.28,17.35),(3,1.8,6,4.8),(3.5,14.6,11,23.4)]
new=[]
for part in d['parts']:
 if part['ref'] in fs:continue
 library,name=part['footprint'].split(':');path=P/'Pendant_Input.pretty' if library=='Pendant_Input' else lib/(library+'.pretty')
 f=k.FootprintLoad(str(path),name);assert f,(part['ref'],path,name)
 b.Add(f);f.SetReference(part['ref']);f.SetValue(part['value']);f.SetFPID(k.LIB_ID(library,name));f.Reference().SetVisible(False);f.Value().SetVisible(False)
 bb=rect(f.GetBoundingBox(False,False));new.append(((bb[2]-bb[0])*(bb[3]-bb[1]),part,f))
# USB geometry is immutable in this placement pass; avoid all its surface tracks and vias with new pads.
usb=[t for t in b.GetTracks() if t.GetNetname() in ['/USB_DP','/USB_DM']]
existing=[(f.GetLayer(),rect(f.GetBoundingBox(False,False))) for f in fs.values()]
placements={}
for _,part,f in sorted(new,key=lambda t: (0 if t[1]['ref'].startswith('U') else 1 if t[1]['ref'].startswith('Q') else 2 if t[1]['ref'].startswith('C') else 3,-t[0])):
 best=None
 near={'C31':('U13','5'),'C32':('U14','14'),'C33':('U15','3'),'R44':('U13','3'),'R45':('U13','3'),'R46':('Q5','1'),'R47':('U14','3'),'R48':('U14','1'),'R49':('Q6','1'),'R50':('Q7','1')}
 target=near.get(part['ref'])
 sides=[fs[target[0]].GetLayer()] if target and part['ref'].startswith('C') else [k.B_Cu,k.F_Cu]
 for side in sides:
  if f.GetLayer()!=side:f.Flip(f.GetPosition(),False)
  for angle in [0,90]:
   f.SetOrientationDegrees(angle);f.SetPosition(vec(0,0));local=rect(f.GetBoundingBox(False,False))
   for ix in range(2,103,2):
    x=ix*.25
    for iy in range(2,115,2):
     y=iy*.25;bb=(local[0]+x,local[1]+y,local[2]+x,local[3]+y)
     if bb[0]<.3 or bb[1]<.3 or bb[2]>25.7 or bb[3]>28.7:continue
     if any(overlap(bb,c,.12) for l,c in existing if l==side):continue
     if any(overlap(bb,c,.15) for c in keepouts):continue
     if side==k.B_Cu and any(overlap(bb,c,.15) for c in reserved_back):continue
     f.SetPosition(vec(x,y));padboxes=[p.GetBoundingBox() for p in f.Pads()]
     for pb in padboxes:pb.Inflate(k.FromMM(.18))
     if any(pb.Intersects(t.GetBoundingBox()) for pb in padboxes for t in usb if t.GetLayer()==side or isinstance(t,k.PCB_VIA)):continue
     # Prefer charger vicinity; compact local logic cluster and top side if backside crowded.
     anchor=(4,12) if part['ref'] in ['U13','Q5'] else placements.get('U14',{'x':22,'y':7})
     if target:
      tp=next(p for p in fs[target[0]].Pads() if p.GetNumber()==target[1]).GetPosition();anchor=(k.ToMM(tp.x),k.ToMM(tp.y))
     if isinstance(anchor,dict):anchor=(anchor['x'],anchor['y'])
     score=math.hypot(x-anchor[0],y-anchor[1])+(0 if side==(fs[target[0]].GetLayer() if target else k.B_Cu) else 2)
     if best is None or score<best[0]:best=(score,x,y,side,angle,bb)
 if best is None:raise RuntimeError('No valid footprint-envelope placement for '+part['ref'])
 _,x,y,side,angle,bb=best
 if f.GetLayer()!=side:f.Flip(f.GetPosition(),False)
 f.SetOrientationDegrees(angle);f.SetPosition(vec(x,y));fs[part['ref']]=f;existing.append((side,bb));placements[part['ref']]={'x':x,'y':y,'layer':f.GetLayerName(),'angle':angle,'bbox':bb};print(part['ref'],placements[part['ref']],flush=True)
# Update all pads against candidate schematic, with deterministic schematic association.
root=str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/mini-rect-v15/root'))
for part in d['parts']:
 f=fs[part['ref']];f.SetValue(part['value']);f.SetPath(k.KIID_PATH('/'+root+'/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/mini-rect-v15/'+part['ref']))));pins={p['number']:p['net'] for p in part['pins']}
 for pad in f.Pads():
  if pad.GetNumber() not in pins:continue
  net=pins[pad.GetNumber()]
  if net is None:pad.SetNetCode(0);continue
  ni=b.FindNet('/'+net)
  if not ni:ni=k.NETINFO_ITEM(b,'/'+net);b.Add(ni)
  pad.SetNet(ni)
removed=[]
# OldVBUS routing no longer describes the split power path. Remove it, never silently relabel mixed branches.
for t in list(b.GetTracks()):
 if t.GetNetname()=='/VBUS':removed.append({'uuid':t.m_Uuid.AsString(),'reason':'VBUSsplit'});b.DeleteNative(t);continue
 bad=False
 for ref in placements:
  f=fs[ref]
  if t.GetLayer()!=f.GetLayer() and not isinstance(t,k.PCB_VIA):continue
  for pad in f.Pads():
   if pad.GetNetCode()==t.GetNetCode():continue
   pb=pad.GetBoundingBox();pb.Inflate(k.FromMM(.16))
   if pb.Intersects(t.GetBoundingBox()):bad=True;break
  if bad:break
 if bad:assert t.GetNetname() not in ['/USB_DP','/USB_DM'];removed.append({'uuid':t.m_Uuid.AsString(),'reason':'newpadclearance'});b.DeleteNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(O),b)
report={'status':'PLACEMENT_ONLY_NOT_ROUTED','source_sha256':hashlib.sha256(S.read_bytes()).hexdigest(),'board_sha256':hashlib.sha256(O.read_bytes()).hexdigest(),'new_parts':placements,'removed_tracks_vias':removed,'part_count':len(fs),'bounds_mm':[26,29],'limits':['Conservative footprint envelope screen only; fullDRC andcasegeometry required','Harness keepout provisional','USBtrace/viageometry preserved; referenceplane coverage must berechecked','Newnets andremovedtracks needrouting']}
(P/'placement-v2-review.json').write_text(json.dumps(report,indent=2)+'\n');print('SAVED',O,flush=True)
