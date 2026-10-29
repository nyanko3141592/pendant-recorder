"""Remove only fully coincident narrower straight segments on the same net/layer."""
import pcbnew as k,wx
app=wx.App(False)
from pathlib import Path
import shutil,json,subprocess
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'deduplicated-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));groups={};removed=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA) or type(t)!=k.PCB_TRACK:continue
 a,c=t.GetStart(),t.GetEnd();key=(t.GetNetname(),t.GetLayer(),tuple(sorted([(a.x,a.y),(c.x,c.y)])))
 groups.setdefault(key,[]).append(t)
for key,tracks in groups.items():
 if len(tracks)<2:continue
 tracks.sort(key=lambda t:t.GetWidth(),reverse=True)
 for t in tracks[1:]:
  removed.append({'net':key[0],'removed_width_mm':k.ToMM(t.GetWidth()),'retained_width_mm':k.ToMM(tracks[0].GetWidth())});b.RemoveNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'deduplicated-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'deduplicated-drc.json').read_text());assert not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==88
(O/'deduplicated-review.json').write_text(json.dumps({'removed':removed,'unconnected_items':88},indent=2)+'\n');print(removed)
