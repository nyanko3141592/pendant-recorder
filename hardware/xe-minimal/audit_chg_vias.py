import pcbnew as k,wx,json,hashlib
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;f=O/'chg-latest-combined-candidate.kicad_pcb';b=k.LoadBoard(str(f));out=[]
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA):continue
 hits=[]
 for fp in b.GetFootprints():
  for p in fp.Pads():
   if p.GetAttribute()==k.PAD_ATTRIB_NPTH:continue
   for layer in [k.F_Cu,k.B_Cu]:
    if not p.IsOnLayer(layer):continue
    shape=p.GetEffectiveShape(layer);radius=t.GetWidth(layer)//2
    if shape.Collide(t.GetPosition(),radius+k.FromMM(.025)):
     hits.append({'ref':fp.GetReference(),'pad':p.GetNumber(),'net':p.GetNetname(),'layer':b.GetLayerName(layer),'copper_overlap':shape.Collide(t.GetPosition(),radius),'hole_overlaps_pad':shape.Collide(t.GetPosition(),t.GetDrillValue()//2)})
 if hits:out.append({'uuid':t.m_Uuid.AsString(),'xy_mm':[k.ToMM(t.GetPosition().x),k.ToMM(t.GetPosition().y)],'hits':hits})
r={'status':'OPEN_MANUFACTURING_REVIEW_REQUIRED','board_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'method':'KiCad effective copper pad shape collision vs via radius and additional0.025mm; F/B layers','flagged_vias':len(out),'vias':out,'limitations':['Solder mask openings, actual drill registration and fabrication capability not qualified.','Resolve by geometry changes or qualified filled/capped process before release.']};(O/'chg-via-audit.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
