"""Four-layer same-BOM placement-only study; no routing/release claim."""
import pcbnew as k,wx,json,hashlib,shutil
from pathlib import Path
app=wx.App(False);H=Path(__file__).resolve().parent
src=H/'costdown/HW-V1.4-EVT-4LAYER-27P5/route/hw-v1.4-evt-4layer-27p5-routed-candidate.kicad_pcb'
D=H/'costdown/HW-V1.4-TOP-BATTERY-STUDY';D.mkdir(exist_ok=True);out=D/'placement-only.kicad_pcb'
b=k.LoadBoard(str(src));fps={f.GetReference():f for f in b.GetFootprints()}
def bounds(f):
 items=[g for g in f.GraphicalItems() if g.GetLayer() in [k.F_CrtYd,k.B_CrtYd]];pts=[p for g in items for p in [g.GetStart(),g.GetEnd()]]
 if not pts:pts=[p.GetPosition() for p in f.Pads()]
 return [min(k.ToMM(p.x) for p in pts),max(k.ToMM(p.x) for p in pts),min(k.ToMM(p.y) for p in pts),max(k.ToMM(p.y) for p in pts)]
def overlap(a,z):return min(a[1],z[1])>max(a[0],z[0])+1e-6 and min(a[3],z[3])>max(a[2],z[2])+1e-6
moves=[]
for ref,preferred,xs,ys in [('SW1',(3.5,20),[2+i*.25 for i in range(17)],[18+i*.25 for i in range(25)]),('U8',(22,19),[19+i*.25 for i in range(25)],[17+i*.25 for i in range(29)])]:
 f=fps[ref];orig=[k.ToMM(f.GetPosition().x),k.ToMM(f.GetPosition().y)];found=None
 for x,y in sorted([(x,y) for x in xs for y in ys],key=lambda p:(p[0]-preferred[0])**2+(p[1]-preferred[1])**2):
  f.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)));bb=bounds(f)
  if bb[0]<.25 or bb[1]>27.25 or bb[2]<16.25 or bb[3]>26.75:continue
  if any(overlap(bb,bounds(g)) for g in b.GetFootprints() if g.GetReference()!=ref and g.GetLayer()==f.GetLayer()):continue
  found=[x,y];break
 assert found,ref
 moves.append({'ref':ref,'from_mm':orig,'to_mm':found,'side':'F.Cu','courtyard_bbox_mm':bounds(f),'nets':sorted(set(str(p.GetNetname()) for p in f.Pads()))})
tracks=list(b.GetTracks());zones=list(b.Zones())
for t in tracks:b.Remove(t)
for z in zones:b.Remove(z)
k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
report={'status':'PLACEMENT_ONLY_REQUIRES_FULL_4_LAYER_REROUTE','copper_layers':b.GetCopperLayerCount(),'board_mm':[27.5,27.5],'assembly_sides':2,'bom_changes':0,'moves':moves,'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'placement_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'release_allowed':False,'manufacturing_constraints':['Maximum four copper layers','Same exact MPNs and assembly sides; no HDI/blind-via/filled-via cost escalation','Reserve uninterrupted ground reference during reroute, not after autorouting'],'remaining':['Battery factory harness reach and mating clearance','Maximum package envelopes and insulating retention','Full routing, ERC/DRC/parity, current and USB review','JLC exact stock and Standard-only storage cost qualification']}
(D/'review.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
