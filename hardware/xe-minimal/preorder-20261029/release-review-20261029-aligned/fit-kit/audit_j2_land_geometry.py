from pathlib import Path
import json,hashlib
import wx,pcbnew as k
app=wx.App(False);w=Path(__file__).resolve().parent;root=w.parents[3]
p=root/'hardware/xe-minimal/preorder-20261029/l3-ground-011-trial.kicad_pcb';b=k.LoadBoard(str(p));f=next(f for f in b.GetFootprints() if f.GetReference()=='J2')
rows=[{'number':a.GetNumber(),'x':k.ToMM(a.GetPosition().x),'y':k.ToMM(a.GetPosition().y),'width':k.ToMM(a.GetSize().x),'height':k.ToMM(a.GetSize().y)} for a in f.Pads()]
sig=sorted([a for a in rows if a['number']!='MP'],key=lambda a:a['x']);mp=sorted([a for a in rows if a['number']=='MP'],key=lambda a:a['x'])
checks=[]
def check(name,actual,target,tol=1e-6):
 ok=abs(actual-target)<=tol;checks.append({'dimension':name,'actual_mm':actual,'drawing_nominal_mm':target,'nominal_matches':ok});assert ok,name
check('signal_pitch',sig[1]['x']-sig[0]['x'],1.2);check('DIM_A',sig[2]['x']-sig[0]['x'],2.4)
for a in sig:check('signal_width_'+a['number'],a['width'],.6);check('signal_height_'+a['number'],a['height'],.85)
for i,a in enumerate(mp):check('mount_width_'+str(i),a['width'],.7);check('mount_height_'+str(i),a['height'],.8)
check('signal_bottom_to_mount_bottom',mp[0]['y']+.4-(sig[0]['y']+.425),3.75)
check('outer_signal_center_to_mount_inner_edge',mp[1]['x']-.35-sig[2]['x'],.8)
pdf=root/'mechanical/xe-minimal/connector-reference-drawings/molex-sd-78171-008-rev-g-mirror.pdf'
out={'status':'RECOMMENDED_LAND_DIMENSIONS_MATCH_BODY_DATUM_UNRESOLVED','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'drawing_sha256':hashlib.sha256(pdf.read_bytes()).hexdigest(),'drawing':'SD-78171-008 Rev G sheet2, visually reviewed','pads':rows,'checks':checks,'interpretation':['Drawing .60 MIN signal width is met at .60 nominal; dimensions do not certify fabrication tolerance','Drawing 3.75 is signal-pad lower edge to mounting-pad lower edge, not row center distance','Drawing connector outline lacks a directly dimensioned longitudinal pad-to-body offset; do not infer a certified datum from rendered pixels','Existing body Y offset .27 remains library-derived provisional geometry'],'release_allowed':False}
(w/'j2-land-geometry-audit.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
