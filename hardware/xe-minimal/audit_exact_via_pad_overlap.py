import pcbnew as k,wx,json,hashlib
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;f=O/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(f));out=[]
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
hole_count=sum(any(h['hole_overlaps_pad'] for h in row['hits']) for row in out)
r={'status':'OPEN_MANUFACTURING_REVIEW_REQUIRED' if hole_count else 'NO_HOLE_OVER_PAD_VIAS','board_sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'method':'KiCad effective copper pad shape collision vs via radius and additional0.025mm; F/B layers','copper_proximity_vias':len(out),'hole_over_pad_vias':hole_count,'flagged_vias':hole_count,'vias':out,'limitations':['Copper overlap alone is a normal dogbone connection; hole_overlaps_pad is the special-process discriminator.','Solder mask openings, actual drill registration and fabrication capability not qualified.','Resolve hole overlaps by geometry changes or qualified filled/capped process before release.']};(O/'exact-via-pad-overlap-audit.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
