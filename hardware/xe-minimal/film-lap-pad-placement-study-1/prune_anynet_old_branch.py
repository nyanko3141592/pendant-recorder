from pathlib import Path
import pcbnew as k,wx,json,hashlib,shutil,subprocess,collections
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-film-lap-power-guarded-anynet-trial.kicad_pcb';b=k.LoadBoard(str(src))
def xy(p):return(p.x,p.y)
tracks=[t for t in b.GetTracks()if t.GetNetname()=='/BAT_TS'and not isinstance(t,k.PCB_VIA)]
vias={xy(t.GetPosition()):t for t in b.GetTracks()if t.GetNetname()=='/BAT_TS'and isinstance(t,k.PCB_VIA)}
def node(p,l):return(xy(p),None if xy(p)in vias else l)
adj=collections.defaultdict(list)
for t in tracks:
 for p in [t.GetStart(),t.GetEnd()]:adj[node(p,t.GetLayer())].append(t)
start=((k.FromMM(21.3),k.FromMM(1.9)),None);stop=((k.FromMM(19.913604),k.FromMM(20.351396)),None)
pads=[p for f in b.GetFootprints()for p in f.Pads()if p.GetNetname()=='/BAT_TS']
padcoords={xy(p.GetPosition())for p in pads}
assert len(adj[start])==1
removed=[];q=start;walk_nodes=[q]
while True:
 options=[t for t in adj[q]if t not in removed]
 if len(options)!=1:break
 t=options[0];removed.append(t);ends=[node(t.GetStart(),t.GetLayer()),node(t.GetEnd(),t.GetLayer())];q=ends[1]if q==ends[0]else ends[0];walk_nodes.append(q)
 if len(adj[q])!=2 or q[0]in padcoords:break
assert q[0]in padcoords,(q,padcoords)
stop=q
pads=[p for f in b.GetFootprints()for p in f.Pads()if p.GetNetname()=='/BAT_TS']
for t in removed:
 assert not any(xy(p.GetPosition())!=stop[0]and p.IsOnLayer(t.GetLayer())and t.GetEffectiveShape(t.GetLayer()).Collide(p.GetEffectiveShape(t.GetLayer()),0)for p in pads),'Removed branch contacts a circuit pad: '+t.m_Uuid.AsString()
removed_vias=[]
for coord,_ in walk_nodes:
 if coord not in vias:continue
 remaining=[t for t in tracks if t not in removed and coord in [xy(t.GetStart()),xy(t.GetEnd())]]
 if len(set(t.GetLayer()for t in remaining))<2:removed_vias.append(vias[coord])
records=[{'uuid':t.m_Uuid.AsString(),'kind':type(t).__name__,'layer':b.GetLayerName(t.GetLayer()),'start_mm':[k.ToMM(t.GetStart().x),k.ToMM(t.GetStart().y)],'end_mm':[k.ToMM(t.GetEnd().x),k.ToMM(t.GetEnd().y)]}for t in removed+removed_vias]
for t in removed+removed_vias:b.RemoveNative(t);t.thisown=False
out=O/'pendant-xe-film-lap-anynet-pruned-trial.kicad_pcb'
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
f=O/'anynet-pruned-trial-drc.json';subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(out),'--format','json','--severity-all','-o',str(f)],check=True,capture_output=True)
d=json.loads(f.read_text());r={'status':'PRUNED_DEAD_BRANCH_CANDIDATE_NOT_RELEASE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'removed':records,'unconnected':len(d['unconnected_items']),'violation_types':dict(collections.Counter(x['type']for x in d['violations'])),'limits':['Endpoint topology plus same-net pad collision check used to identify the obsolete branch.','Schematic parity, circuit adoption, plane-reference and physical qualification remain incomplete.']}
(O/'anynet-pruned-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({x:y for x,y in r.items()if x!='removed'},indent=2));print('removed',len(removed),'tracks',len(removed_vias),'vias')
