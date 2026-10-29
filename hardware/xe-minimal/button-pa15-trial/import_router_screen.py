import pcbnew as k,wx,json,shutil,subprocess,hashlib
from pathlib import Path
from collections import Counter
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pa15-button-complete-candidate';dst=O/'pa15-router-screen-candidate'
m=json.loads((O/'router-screen-manifest.json').read_text())
assert hashlib.sha256(src.with_suffix('.kicad_pcb').read_bytes()).hexdigest()==m['source_sha256']
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));movable=set(m['movable_existing_nets'])
def geometry(board):
 rows=[]
 for t in board.GetTracks():
  if t.GetNetname() in movable:continue
  a=t.GetStart();z=t.GetEnd();via=isinstance(t,k.PCB_VIA)
  rows.append((t.GetNetname(),via,t.GetLayer(),a.x,a.y,z.x,z.y,t.GetWidth(k.F_Cu) if via else t.GetWidth(),t.GetDrillValue() if via else 0))
 return sorted(rows)
for t in b.GetTracks():t.SetLocked(t.GetNetname() not in movable)
before=geometry(b)
assert k.ImportSpecctraSES(b,str(O/'pa15-router-screen.ses'))
after=geometry(b)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pa15-router-screen-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'pa15-router-screen-drc.json').read_text());missing=list((Counter(before)-Counter(after)).elements());review={'fixed_existing_copper_preserved':not missing,'missing_fixed_geometry':missing,'added_geometry_on_fixed_nets':list((Counter(after)-Counter(before)).elements()),'fixed_net_geometry_identical':before==after,'violations':r['violations'],'parity':r['schematic_parity'],'unconnected':len(r['unconnected_items']),'adopted':False}
(O/'router-screen-review.json').write_text(json.dumps(review,indent=2)+'\n');print('fixedgeometry',before==after,'violations',len(r['violations']),'parity',len(r['schematic_parity']),'unconnected',len(r['unconnected_items']))
