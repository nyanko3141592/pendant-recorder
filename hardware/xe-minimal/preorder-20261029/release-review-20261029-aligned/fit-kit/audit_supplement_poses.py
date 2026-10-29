from pathlib import Path
import json,hashlib
import wx,pcbnew as k
app=wx.App(False)
w=Path(__file__).resolve().parent;root=w.parents[3];m=w.parent.parent
pcb=root/'hardware/xe-minimal/preorder-20261029/l3-ground-011-trial.kicad_pcb'
b=k.LoadBoard(str(pcb));old=json.loads((m/'board-inventory.json').read_text());rows=[]
for ref in ['U8','J2']:
 f=next(f for f in b.GetFootprints() if f.GetReference()==ref);prior=next(p for p in old['parts'] if p['ref']==ref)
 pos=[k.ToMM(f.GetPosition().x),k.ToMM(f.GetPosition().y)];side='F' if f.GetLayer()==k.F_Cu else 'B';rot=f.GetOrientationDegrees()
 pose_equal=all(abs(a-c)<1e-6 for a,c in zip(pos,prior['position_mm'])) and side==prior['side'] and abs(rot-prior['rotation_deg'])<1e-6
 pads={p.GetNumber():[k.ToMM(p.GetPosition().x),k.ToMM(p.GetPosition().y)] for p in f.Pads() if p.GetNumber()}
 previous={p['number']:p['position_mm'] for p in prior['pads'] if p['number']}
 pads_equal=pads.keys()==previous.keys() and all(all(abs(a-c)<1e-6 for a,c in zip(v,previous[n])) for n,v in pads.items())
 model=m/('u8-body-positioned-study.step' if ref=='U8' else 'j2-header-positioned-study.step');review=json.loads((m/('u8-position-review.json' if ref=='U8' else 'j2-position-review.json')).read_text())
 model_hash=hashlib.sha256(model.read_bytes()).hexdigest();assert model_hash==review['sha256']
 assert pose_equal and pads_equal
 rows.append({'ref':ref,'position_mm':pos,'side':side,'rotation_deg':rot,'pose_matches_original_model_inventory':pose_equal,'pad_positions_match':pads_equal,'supplement_sha256':model_hash,'source_model_review':str(model.with_name('u8-position-review.json' if ref=='U8' else 'j2-position-review.json').relative_to(root)),'source_review_limitations':review['limitations']})
out={'status':'SUPPLEMENT_POSES_MATCH_CURRENT_PCB_NOT_FULL_DIMENSIONAL_APPROVAL','pcb_sha256':hashlib.sha256(pcb.read_bytes()).hexdigest(),'parts':rows,'release_allowed':False}
(w/'supplement-pose-audit.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
