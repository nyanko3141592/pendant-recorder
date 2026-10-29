import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;dst=O/'swd-both-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile((O/'pendant-xe-minimal').with_suffix(ext),dst.with_suffix(ext))
for name in ['swd','swclk']:assert json.loads((O/(name+'-joined-review.json')).read_text())['accepted']
b=k.LoadBoard(str(O/'swd-joined-candidate.kicad_pcb'));other=k.LoadBoard(str(O/'swclk-joined-candidate.kicad_pcb'));original=k.LoadBoard(str(O/'pendant-xe-minimal.kicad_pcb'));ids={t.m_Uuid.AsString() for t in original.GetTracks()};net=next(p.GetNet() for f in b.GetFootprints() if f.GetReference()=='U1' for p in f.Pads() if p.GetNumber()=='37');added=0
for old in other.GetTracks():
 if old.m_Uuid.AsString() in ids:continue
 assert old.GetNetname()=='/SWCLK'
 if isinstance(old,k.PCB_VIA):
  t=k.PCB_VIA(b);t.SetPosition(old.GetPosition());t.SetWidth(old.GetWidth(k.F_Cu));t.SetDrill(old.GetDrillValue());t.SetViaType(k.VIATYPE_THROUGH);t.SetLayerPair(k.F_Cu,k.B_Cu)
 else:
  t=k.PCB_TRACK(b);t.SetStart(old.GetStart());t.SetEnd(old.GetEnd());t.SetLayer(old.GetLayer());t.SetWidth(old.GetWidth())
 t.SetNet(net);b.AddNative(t);t.thisown=False;added+=1
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'swd-both-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'swd-both-drc.json').read_text());out={'accepted':not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==11,'violations':r['violations'],'unconnected_items':len(r['unconnected_items']),'swclk_added_items':added};(O/'swd-both-review.json').write_text(json.dumps(out,indent=2)+'\n');print(out)
