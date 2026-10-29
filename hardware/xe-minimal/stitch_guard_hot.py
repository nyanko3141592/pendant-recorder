import pcbnew as k
import wx
app=wx.App(False)
import json,subprocess,shutil,hashlib,math,sys
from pathlib import Path
O=Path(__file__).resolve().parent;cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';src=O/'guard-hot-cluster-candidate';out=O/'guard-hot-cluster-ground-candidate';trial=O/'guard-hot-cluster-ground-trial'
remaining=len(sys.argv)>1 and sys.argv[1]=='remaining'
if remaining:
 src=O/'pendant-xe-minimal';out=O/'remaining-ground-candidate';trial=O/'remaining-ground-trial'
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
for base in [out,trial]:
 for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),base.with_suffix(ext))
# Include every capacitor on GND, including RTC and input bypass parts.
jobs=[(f,p) for f in b.GetFootprints() if f.GetReference()=='R41' for p in f.Pads() if p.GetNetname()=='/GND']
if remaining:
 drc=json.loads((O/'current-drc.json').read_text());wanted={i['uuid'] for v in drc['unconnected_items'] for i in v['items'] if '[/GND]' in i['description']}
 jobs=[(f,p) for f in b.GetFootprints() for p in f.Pads() if p.GetNetname()=='/GND' and p.m_Uuid.AsString() in wanted and not p.GetDrillSize().x]
accepted=[];deferred=[]
for index,(f,p) in enumerate(jobs):
 pos=p.GetPosition();success=False
 for radius in [.8,1.1]:
  for dx,dy in [(radius,0),(-radius,0),(0,radius),(0,-radius)]:
   vpos=k.VECTOR2I(pos.x+k.FromMM(dx),pos.y+k.FromMM(dy))
   # Conservative no-via-in-pad check against ALL pad bounds on BOTH sides.
   def near_pad(q):
    bb=q.GetBoundingBox();x,y=vpos.x,vpos.y
    gap=math.hypot(max(bb.GetX()-x,0,x-bb.GetRight()),max(bb.GetY()-y,0,y-bb.GetBottom()))
    return gap<k.FromMM(.2)
   if any(near_pad(q) for fp in b.GetFootprints() for q in fp.Pads()):continue
   via=k.PCB_VIA(b);via.SetPosition(vpos);via.SetWidth(k.FromMM(.35));via.SetDrill(k.FromMM(.15));via.SetViaType(k.VIATYPE_THROUGH);via.SetLayerPair(k.F_Cu,k.B_Cu);via.SetNet(p.GetNet());b.AddNative(via);via.thisown=False
   track=k.PCB_TRACK(b);track.SetStart(pos);track.SetEnd(vpos);track.SetWidth(k.FromMM(.15));track.SetLayer(k.B_Cu if f.IsFlipped() else k.F_Cu);track.SetNet(p.GetNet());b.AddNative(track);track.thisown=False
   k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(trial.with_suffix('.kicad_pcb')),b)
   subprocess.run([cli,'pcb','drc',str(trial.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/('remaining-ground-trial-drc.json' if remaining else 'guard-hot-cluster-ground-trial-drc.json'))],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
   report=json.loads((O/('remaining-ground-trial-drc.json' if remaining else 'guard-hot-cluster-ground-trial-drc.json')).read_text())
   if not report['violations']:
    accepted.append({'ref':f.GetReference(),'pin':p.GetNumber(),'via_mm':[k.ToMM(vpos.x),k.ToMM(vpos.y)],'stub_mm':radius});success=True;break
   b.RemoveNative(track);b.RemoveNative(via)
  if success:break
 if not success:deferred.append({'ref':f.GetReference(),'pin':p.GetNumber()})
 if index%5==4:print('processed',index+1,'accepted',len(accepted),flush=True)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out.with_suffix('.kicad_pcb')),b)
subprocess.run([cli,'pcb','drc',str(out.with_suffix('.kicad_pcb')),'--format','json','--severity-all','-o',str(O/('remaining-ground-drc.json' if remaining else 'guard-hot-cluster-ground-drc.json'))],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/('remaining-ground-drc.json' if remaining else 'guard-hot-cluster-ground-drc.json')).read_text());assert not r['violations']
(O/('remaining-ground-review.json' if remaining else 'guard-hot-cluster-ground-review.json')).write_text(json.dumps({'status':'PARTIAL_GROUND_STITCHING_NOT_RELEASED','accepted':accepted,'deferred':deferred,'physical_drc_violations':0,'unconnected_items':len(r['unconnected_items']),'via_mm':{'diameter':.35,'drill':.15},'board_sha256':hashlib.sha256(out.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'limits':['No full GND connectivity or return-current qualification yet','Via annulus kept clear of every pad bounding rectangle by a nominal0.025mm margin; solder mask web/assembly capability still require review','All signal and power paths still incomplete']},indent=2)+'\n')
print('complete accepted',len(accepted),'deferred',len(deferred),'unconnected',len(r['unconnected_items']),flush=True)
