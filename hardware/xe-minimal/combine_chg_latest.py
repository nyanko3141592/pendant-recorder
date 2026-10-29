import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;dst=O/'chg-latest-combined-candidate';base=O/'pendant-xe-minimal'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(base.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(base.with_suffix('.kicad_pcb')));ids={t.m_Uuid.AsString() for t in b.GetTracks()};removed={'460a10b4-3910-4850-a69d-06009218597e','de2cedad-0c98-453e-891b-f1efe531b7d8','b54ba836-447b-40f8-b50c-2f7a05ebad15'}
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in removed:b.RemoveNative(t)
nets={p.GetNetname():p.GetNet() for f in b.GetFootprints() for p in f.Pads()};added=[]
for name in ['chg-r11-joined-candidate']:
 other=k.LoadBoard(str(O/(name+'.kicad_pcb')))
 for old in other.GetTracks():
  if old.m_Uuid.AsString() in ids or old.GetNetname() not in ['/CHG_N','/BAT_TS','/V3V3']:continue
  assert old.GetNetname() in ['/CHG_N','/BAT_TS','/V3V3'],old.GetNetname()
  if isinstance(old,k.PCB_VIA):
   t=k.PCB_VIA(b);t.SetPosition(old.GetPosition());t.SetWidth(old.GetWidth(k.F_Cu));t.SetDrill(old.GetDrillValue());t.SetViaType(k.VIATYPE_THROUGH);t.SetLayerPair(k.F_Cu,k.B_Cu);t.SetFillingMode(old.GetFillingMode());t.SetCappingMode(old.GetCappingMode())
  else:
   t=k.PCB_TRACK(b);t.SetStart(old.GetStart());t.SetEnd(old.GetEnd());t.SetLayer(old.GetLayer());t.SetWidth(old.GetWidth())
  t.SetNet(nets[old.GetNetname()]);b.AddNative(t);t.thisown=False;added.append(old.GetNetname())
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'chg-latest-combined-drc.json')],check=True,stdout=subprocess.DEVNULL)
r=json.loads((O/'chg-latest-combined-drc.json').read_text());out={'violations':r['violations'],'parity':r['schematic_parity'],'unconnected_items':len(r['unconnected_items']),'added':added};(O/'chg-latest-combined-review.json').write_text(json.dumps(out,indent=2)+'\n');print(out)
