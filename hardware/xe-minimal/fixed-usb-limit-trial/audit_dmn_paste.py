"""Compare explicit X2 rectangular flashes for Q6/Q7 with saved board pads."""
from pathlib import Path
import re,json,hashlib,pcbnew as k,wx
app=wx.App(False);D=Path(__file__).resolve().parent/'dmn-land-trial';board=D/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(board));rows=[]
for ref,filename in [('Q6','pendant-xe-minimal-B_Paste.gbp'),('Q7','pendant-xe-minimal-F_Paste.gtp')]:
 p=D/'paste-review'/filename;s=p.read_text();assert '%FSLAX46Y46*%' in s and '%MOMM*%' in s
 apertures={m[1]:(float(m[2]),float(m[3])) for m in re.finditer(r'%ADD(\d+)R,([\d.]+)X([\d.]+)\*%',s)}
 component=None;selected=None;flashes=[]
 for line in s.splitlines():
  m=re.fullmatch(r'D(\d+)\*',line)
  if m:selected=m[1]
  m=re.fullmatch(r'%TO.C,([^*]+)\*%',line)
  if m:component=m[1]
  if line=='%TD*%':component=None
  m=re.fullmatch(r'X(-?\d+)Y(-?\d+)D03\*',line)
  if m and component==ref:
   assert selected in apertures
   flashes.append({'xy_mm':[int(m[1])/1e6,-int(m[2])/1e6],'size_mm':list(apertures[selected])})
 fp=next(f for f in b.GetFootprints() if f.GetReference()==ref)
 expected=sorted((round(k.ToMM(p.GetPosition().x),6),round(k.ToMM(p.GetPosition().y),6)) for p in fp.Pads())
 assert len(flashes)==3
 assert sorted(tuple(f['xy_mm']) for f in flashes)==expected
 assert all(f['size_mm']==[.9,.8] for f in flashes)
 rows.append({'ref':ref,'gerber':filename,'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'flashes':flashes,'aperture_area_mm2':.72})
r={'status':'Q6_Q7_EXPORTED_PASTE_GEOMETRY_VERIFIED','board_sha256':hashlib.sha256(board.read_bytes()).hexdigest(),'rows':rows,'limits':['Verification covers Q6/Q7 rectangular flashes only, not entire stencil CAM','No aperture reduction observed; stencil thickness and paste transfer process not qualified','Gerber creation does not approve transistor electrical behavior or manufacturing release']};(D/'paste-review'/'review.json').write_text(json.dumps(r,indent=2)+'\n');print('Verified 6 rectangular paste flashes: 0.9 x 0.8 mm, exact board centers, correct sides.')
