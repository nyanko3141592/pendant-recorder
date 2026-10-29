"""Conservative pad opening screen; no replacement for Gerber mask intersection."""
from pathlib import Path
import wx,json,sys,hashlib
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;source=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else P/'plane-source.kicad_pcb';src=source.name;b=k.LoadBoard(str(source));rows=[]
pads=[(f.GetReference(),p) for f in b.GetFootprints() for p in f.Pads() if p.GetAttribute()==k.PAD_ATTRIB_SMD]
for v in b.GetTracks():
 if not isinstance(v,k.PCB_VIA):continue
 hits=[]
 for ref,p in pads:
  if not p.HitTest(v.GetPosition(),v.GetDrill()//2+k.FromMM(.05)):continue
  hits.append(dict(ref=ref,pad=p.GetNumber(),net=p.GetNetname(),center_inside=p.HitTest(v.GetPosition()),drill_intersects_copper=p.HitTest(v.GetPosition(),v.GetDrill()//2)))
 if hits:rows.append(dict(uuid=v.m_Uuid.AsString(),net=v.GetNetname(),x_mm=k.ToMM(v.GetPosition().x),y_mm=k.ToMM(v.GetPosition().y),drill_mm=k.ToMM(v.GetDrill()),hits=hits))
r=dict(board=src,board_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),screen_expansion_mm=.05,scope='KiCad pad HitTest expanded by hole radius and extra0.05mm; conservative screen, actual soldermask expansions and Gerber intersection pending. Does not prove selected filling acceptance.',center_inside_count=sum(any(h['center_inside'] for h in v['hits']) for v in rows),drill_copper_overlap_count=sum(any(h['drill_intersects_copper'] for h in v['hits']) for v in rows),potential_mask_overlap_count=len(rows),vias=rows)
source.with_suffix('.via-pad-audit.json').write_text(json.dumps(r,indent=2)+'\n');print({n:v for n,v in r.items() if n!='vias'})
