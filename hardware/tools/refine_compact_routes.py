"""Isolated route import/metrics. Does not promote into released board paths."""
from pathlib import Path
import json,sys,shutil,math,subprocess
import wx
app=wx.App(False)
import pcbnew as k
R=Path(__file__).resolve().parents[2];cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
mode=sys.argv[1]
if mode not in ('v2','v3'):raise SystemExit('Expected v2 or v3')
P=R/'hardware/compact-b'/('routing-v2' if mode=='v2' else 'electrical-placement-v3')
if mode=='v2':
 for ext in ['kicad_pro','kicad_sch']:shutil.copy(R/f'hardware/compact-b/compact-b.{ext}',P/f'compact-b.{ext}')
 for name in ['fp-lib-table','sym-lib-table','Pendant.kicad_sym']:shutil.copy(R/'hardware/compact-b'/name,P/name)
 shutil.copytree(R/'hardware/compact-b/PendantD1.pretty',P/'PendantD1.pretty',dirs_exist_ok=True)
 b=k.LoadBoard(str(R/'hardware/compact-b/compact-b.kicad_pcb'))
else:b=k.LoadBoard(str(P/'compact-b.kicad_pcb'))
p=P/'fp-lib-table';p.write_text(p.read_text().replace('${KIPRJMOD}/../rev-c/','${KIPRJMOD}/../../rev-c/'))
for t in list(b.GetTracks()):b.Delete(t)
ses=P/('output.ses' if mode=='v2' else 'route-noopt.ses')
assert ses.is_file(), ses
assert k.ImportSpecctraSES(b,str(ses))
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):t.SetWidth(k.FromMM(.1))
board=P/'compact-b.kicad_pcb';k.SaveBoard(str(board),b)
subprocess.run([cli,'pcb','drc',str(board),'--format','json','--schematic-parity','-o',str(P/'drc.json')],check=True)
d=json.loads((P/'drc.json').read_text());bad={i['uuid'] for x in d['violations'] if x['type']=='via_dangling' for i in x['items']}
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in bad and isinstance(t,k.PCB_VIA):b.Delete(t)
k.SaveBoard(str(board),b)
subprocess.run([cli,'pcb','drc',str(board),'--format','json','--schematic-parity','-o',str(P/'drc.json')],check=True)
metrics=[]
for name,path in [('original',R/'hardware/compact-b/compact-b.kicad_pcb'),(mode,board)]:
 bb=k.LoadBoard(str(path));fs={f.GetReference():f for f in bb.GetFootprints()}
 for ref,target,pin in [('C1','U1','24'),('C2','U1','36'),('C3','U1','48'),('C5','U1','22'),('C6','U1','9'),('C11','Y1','1'),('C12','Y1','2')]:
  src=list(fs[ref].Pads());dst=next(p for p in fs[target].Pads() if p.GetNumber()==pin);same=[p for p in src if p.GetNetCode()==dst.GetNetCode()];dist=min(math.hypot(k.ToMM(p.GetPosition().x-dst.GetPosition().x),k.ToMM(p.GetPosition().y-dst.GetPosition().y)) for p in same)
  metrics.append(dict(board=name,ref=ref,target=target+'.'+pin,distance_mm=round(dist,3),kind='straight-line pad distance, not loop length'))
(P/'electrical-distances.json').write_text(json.dumps(metrics,indent=2))
print(json.dumps(metrics,indent=2))
