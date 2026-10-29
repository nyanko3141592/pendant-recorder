"""Two-via local MOSI bypass candidate; full DRC decides geometric acceptance."""
from pathlib import Path
import wx,pcbnew as k,json,math,shutil,subprocess,hashlib,argparse
parser=argparse.ArgumentParser();parser.add_argument("--existing-via",action="store_true");parser.add_argument("--radius",type=float,default=1.2);args=parser.parse_args()
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-film-lap-route-trial.kicad_pcb';b=k.LoadBoard(str(src));net=b.FindNet('/SD_MOSI')
if args.existing_via:
 for t in list(b.GetTracks()):
  if not isinstance(t,k.PCB_VIA) and t.GetNetname()=='/SD_MOSI' and t.GetLayer()==k.B_Cu and max(k.ToMM(t.GetStart().y),k.ToMM(t.GetEnd().y))<4.4:b.RemoveNative(t);t.thisown=False
layers=[k.F_Cu,k.In1_Cu,k.In2_Cu,k.In3_Cu,k.In4_Cu,k.B_Cu];obs={l:[]for l in layers};pads=[]
for f in b.GetFootprints():
 for q in f.Pads():
  for l in layers:
   if q.IsOnLayer(l):
    shape=q.GetEffectiveShape(l);pads.append((l,shape))
    if q.GetNetname()!='/SD_MOSI':obs[l].append(shape)
for t in b.GetTracks():
 if t.GetNetname()=='/SD_MOSI':continue
 for l in layers:
  if t.IsOnLayer(l):obs[l].append(t.GetEffectiveShape(l))
def vec(p):return k.VECTOR2I(*(k.FromMM(x)for x in p))
def track(a,c,l):
 t=k.PCB_TRACK(b);t.SetStart(vec(a));t.SetEnd(vec(c));t.SetLayer(l);t.SetWidth(k.FromMM(.15));t.SetNet(net);return t
def clear(t,l):return not any(t.GetEffectiveShape(l).Collide(s,k.FromMM(.105))for s in obs[l])
def via(p):
 v=k.PCB_VIA(b);v.SetPosition(vec(p));v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(net);return v
via_stages=[]
def candidates(a):
 out=[];counts={"within_edge_bounds":0,"bottom_trace_clear":0,"all_layer_via_clear":0,"outside_pads":0}
 for ix in range(-round(args.radius*10),round(args.radius*10)+1):
  for iy in range(-round(args.radius*10),round(args.radius*10)+1):
   p=(round(a[0]+ix*.1,6),round(a[1]+iy*.1,6))
   if not .4<=p[0]<=23.6 or not .4<=p[1]<=26.6:continue
   counts["within_edge_bounds"]+=1
   if not clear(track(a,p,k.B_Cu),k.B_Cu):continue
   counts["bottom_trace_clear"]+=1
   v=via(p)
   if any(not clear(v,l)for l in layers):continue
   counts["all_layer_via_clear"]+=1
   if any(v.GetEffectiveShape(l).Collide(s,k.FromMM(.1))for l,s in pads):continue
   counts["outside_pads"]+=1
   out.append(p)
 via_stages.append({"start_mm":a,"counts":counts})
 print("via rejection stages",a,counts,flush=True)
 return sorted(out,key=lambda p:math.dist(a,p))
a=(16.1025,4.33)if args.existing_via else(16.,2.2);z=(11.7,2.7)if args.existing_via else(15.1,.4);A=candidates(a);Z=[z]if args.existing_via else candidates(z);print('via candidates',len(A),len(Z),flush=True);candidates=[]
for v in A:
 for w in Z:
  for l in [k.In4_Cu,k.In2_Cu,k.In3_Cu,k.In1_Cu,k.F_Cu]:
   if clear(track(v,w,l),l):candidates.append((math.dist(a,v)+math.dist(v,w)+math.dist(w,z),v,w,l))
candidates.sort(key=lambda row:row[0]);accepted=None;attempts=[];out=O/('pendant-xe-film-lap-mosi-existing-via-trial.kicad_pcb' if args.existing_via else 'pendant-xe-film-lap-mosi-trial.kicad_pcb')
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
for length,v,w,l in candidates[:30]:
 items=[via(v),track(a,v,k.B_Cu),track(v,w,l)] if args.existing_via else [via(v),via(w),track(a,v,k.B_Cu),track(v,w,l),track(w,z,k.B_Cu)]
 for item in items:b.AddNative(item);item.thisown=False
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--format','json','--severity-all','-o',str(O/('mosi-existing-via-drc.json'if args.existing_via else 'mosi-layer-drc.json'))],check=True,capture_output=True)
 r=json.loads((O/('mosi-existing-via-drc.json'if args.existing_via else 'mosi-layer-drc.json')).read_text());bad=[x for x in r['violations']if x['type']not in ['lib_footprint_issues','missing_courtyard','silk_edge_clearance','silk_over_copper','silk_overlap']];row={'vias_mm':[v,w],'layer':b.GetLayerName(l),'added_length_mm':length,'unconnected':len(r['unconnected_items']),'non_library_courtyard_silk_violations':[x['type']for x in bad]};attempts.append(row)
 if not bad and not r['unconnected_items']:accepted=row;break
 for item in items:b.RemoveNative(item)
 print('rejected',row,flush=True)
r={'status':'BYPASS_CANDIDATE_NOT_MANUFACTURING_RELEASE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'search_radius_mm':args.radius,'via_search_stages':via_stages,'via_candidates_at_ends':[len(A),len(Z)],'straight_inner_candidates':len(candidates),'accepted_geometrically':accepted,'attempts':attempts,'limits':['Acceptance excludes documented footprint-library/courtyard/silk issues, which still require repair.','New through vias are standard design hypotheses; no supplier approval or SI qualification.','No schematic/BOM substitution, real solder process, harness or runtime qualification.']};(O/('mosi-existing-via-review.json'if args.existing_via else 'mosi-layer-review.json')).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2),flush=True)
