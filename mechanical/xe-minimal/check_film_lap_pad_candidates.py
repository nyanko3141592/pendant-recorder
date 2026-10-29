"""Screen larger lap-pad footprints against current bottom-layer copper."""
from pathlib import Path
import wx,pcbnew,json,hashlib
app=wx.App(False);O=Path(__file__).resolve().parent;root=O.parents[1];p=root/'hardware/xe-minimal/fixed-usb-limit-trial/ncu-sensor-trial/pendant-xe-minimal.kicad_pcb';b=pcbnew.LoadBoard(str(p));L=pcbnew.B_Cu
items=[(f.GetReference()+'.'+q.GetNumber(),q,q.GetEffectiveShape(L))for f in b.GetFootprints()for q in f.Pads()if q.IsOnLayer(L)]
items += [('track:'+str(i),q,q.GetEffectiveShape(L))for i,q in enumerate(b.GetTracks())if q.IsOnLayer(L)]
items += [('zone:'+str(i),q,q.GetFilledPolysList(L))for i,q in enumerate(b.Zones())if q.IsOnLayer(L)]
f=next(f for f in b.GetFootprints()if f.GetReference()=='TH1');rows=[]
for width,length in [(.8,1.4),(.8,1.8),(1.,1.8),(1.4,.8),(1.2,.8)]:
 for dy in [-.2,0,.2,.4,.6]:
  checks=[]
  for q in f.Pads():
   pos=q.GetPosition();x,y=pcbnew.ToMM(pos.x),pcbnew.ToMM(pos.y)+dy
   rect=pcbnew.SHAPE_RECT(pcbnew.FromMM(x-width/2),pcbnew.FromMM(y-length/2),pcbnew.FromMM(width),pcbnew.FromMM(length));bad=[]
   for name,item,shape in items:
    if item.GetNetCode()==q.GetNetCode():continue
    if rect.Collide(shape,pcbnew.FromMM(.2)):bad.append({'item':name,'net':item.GetNetname(),'overlap':rect.Collide(shape,0)})
   checks.append({'pad':q.GetNumber(),'net':q.GetNetname(),'pcb_center_mm':[x,y],'assembly_center_mm':[x,-y],'violates_trial_0_2mm_clearance':bad})
  rows.append({'size_mm':[width,length],'dy_pcb_mm':dy,'checks':checks,'both_clear_at_trial_0_2mm':not any(c['violates_trial_0_2mm_clearance']for c in checks)})
r={'status':'LAP_PAD_SPACE_SCREEN_NOT_PCB_CHANGE_OR_PROCESS_APPROVAL','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'trial_clearance_mm':.2,'rows':rows,'limits':['Same-net copper excluded; no zone refill or routing changes performed.','Existing TH1 component is assumed replaced by a wire-attachment footprint only in a future electrical candidate.','Dimensions and clearance are design hypotheses, not solder strength qualification.','No board-edge, mask, courtyard, top-side, inner-layer or mechanical access approval.','Strain relief and actual wire lap length remain unresolved.']}
(O/'film-lap-pad-candidates-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps([{'size':x['size_mm'],'dy':x['dy_pcb_mm'],'clear':x['both_clear_at_trial_0_2mm']}for x in rows],indent=2))
