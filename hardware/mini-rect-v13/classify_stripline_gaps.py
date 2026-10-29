"""Classify missing plane samples and nearest unrelated In2 copper; diagnostic only."""
from pathlib import Path
import wx,pcbnew as k,json,math,hashlib,collections,sys
app=wx.App(False);P=Path(__file__).resolve().parent;src=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else P/'usb-stripline-pair-candidate.kicad_pcb';b=k.LoadBoard(str(src));r=json.loads(src.with_suffix('.both-reference-review.json').read_text());assert r['source_sha256']==hashlib.sha256(src.read_bytes()).hexdigest()
vias=[v for v in b.GetTracks() if isinstance(v,k.PCB_VIA) and v.GetNetname()!='/GND'];classified=[];counts=collections.Counter()
for row in r['rows']:
 for s in row['not_both']:
  x,y=s['xy_mm'];hits=[]
  # Include trace half-width since the reference screen checked both copper edges.
  for v in vias:
   radius=max(k.ToMM(v.GetWidth(l))/2 for l in [k.In1_Cu,k.In3_Cu])+.15+.1171/2
   if math.hypot(x-k.ToMM(v.GetPosition().x),y-k.ToMM(v.GetPosition().y))<=radius:
    hits.append({'net':v.GetNetname(),'uuid':v.m_Uuid.AsString()})
  kind='own_via' if any(h['net']==row['net'] for h in hits) else 'other_via' if hits else 'unexplained';counts[kind]+=1;classified.append({'net':row['net'],'xy_mm':[x,y],'kind':kind,'via_hits':hits})
out={'status':'GEOMETRIC_CLASSIFICATION_NOT_RETURN_PATH_APPROVAL','source_sha256':r['source_sha256'],'counts':dict(counts),'samples':classified,'limitations':['Via discs are conservative bounds, not an exact antipad union proof','Own via antipad is expected but return-via placement still needs evaluation','Other via interruptions must not be waived solely because overall routing is short']}
src.with_suffix('.gap-classification.json').write_text(json.dumps(out,indent=2)+'\n');print(dict(counts));print([s for s in classified if s['kind']!='own_via'])
