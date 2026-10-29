from pathlib import Path
import json,wx,shutil,subprocess
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;b=k.LoadBoard(str(P/'usb-inner-parallel.kicad_pcb'));out=P/'power-width-candidate.kicad_pcb';report=P/'power-width-drc.json';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';shutil.copy2(P/'usb-inner-parallel.kicad_pro',out.with_suffix('.kicad_pro'))
def drc():
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
 subprocess.run([cli,'pcb','drc',str(out),'--format','json','-o',str(report)],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True)
 return json.loads(report.read_text())
rows=[]
for t in sorted([t for t in b.GetTracks() if not isinstance(t,k.PCB_VIA) and t.GetNetname()=='/SYS' and k.ToMM(t.GetLength())>=1],key=lambda t:-t.GetLength()):
 old=t.GetWidth();accepted=False
 for width in [.25,.2,.15]:
  if k.FromMM(width)<=old:continue
  t.SetWidth(k.FromMM(width));d=drc()
  if not d['violations'] and not d['unconnected_items']:accepted=True;break
  t.SetWidth(old)
 rows.append(dict(uuid=t.m_Uuid.AsString(),net=t.GetNetname(),length_mm=round(k.ToMM(t.GetLength()),3),old_width_mm=k.ToMM(old),new_width_mm=k.ToMM(t.GetWidth()),changed=accepted));print(rows[-1],flush=True)
d=drc();(P/'power-width-changes.json').write_text(json.dumps(rows,indent=2)+'\n');print('FINAL',len(d['violations']),len(d['unconnected_items']),flush=True)
