"""Sample filled reference copper around USB tracks; not a field-solver proof."""
import pcbnew as k
import json,math,hashlib
from pathlib import Path
O=Path(__file__).resolve().parent;p=O/'usb-main-pair-candidate.kicad_pcb';b=k.LoadBoard(str(p));zones=list(b.Zones());rows=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.In2_Cu or t.GetNetname() not in ['/USB_DP','/USB_DM']:continue
 a=t.GetStart();c=t.GetEnd();ax,ay=k.ToMM(a.x),k.ToMM(a.y);cx,cy=k.ToMM(c.x),k.ToMM(c.y);length=math.hypot(cx-ax,cy-ay);count=math.ceil(length/.05);nx=-(cy-ay)/length;ny=(cx-ax)/length
 for layer in [k.In1_Cu,k.In3_Cu]:
  missing=[];tested=0
  for i in range(count+1):
   for offset in [-.15,0.,.15]:
    x=ax+(cx-ax)*i/count+nx*offset;y=ay+(cy-ay)*i/count+ny*offset;pos=k.VECTOR2I(k.FromMM(x),k.FromMM(y));tested+=1
    if not any(z.GetNetname()=='/GND' and z.IsOnLayer(layer) and z.HitTestFilledArea(layer,pos) for z in zones):missing.append([round(x,4),round(y,4),offset])
  rows.append({'net':t.GetNetname(),'from_mm':[ax,ay],'to_mm':[cx,cy],'layer':b.GetLayerName(layer),'tested':tested,'missing':missing})
r={'status':'SAMPLED_REFERENCE_COPPER_NOT_EM_QUALIFICATION','board_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'step_max_mm':.05,'lateral_offsets_mm':[-.15,0,.15],'segments':rows,'missing_samples':sum(len(x['missing']) for x in rows),'limits':['Sampling does not prove uninterrupted full-width return path','Via anti-pads are expected to produce local gaps; return stitching must be reviewed','No electrical impedance, ESD or USB compliance measurement']};(O/'usb-reference-sampling.json').write_text(json.dumps(r,indent=2)+'\n');print('missing',r['missing_samples'],'of',sum(x['tested'] for x in rows))
for row in rows:
 if row['missing']:print(row['net'],row['layer'],row['from_mm'],row['to_mm'],'missing',len(row['missing']),row['missing'][:2])
