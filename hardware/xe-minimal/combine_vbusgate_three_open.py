import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;dst=O/'vbusgate-three-open-escapes-candidate';base=O/'pendant-xe-minimal'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(base.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(base.with_suffix('.kicad_pcb')));ids={t.m_Uuid.AsString() for t in b.GetTracks()};removed='4bdad978-365b-492a-9c0f-38b17b91233a'
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString()==removed:assert t.GetNetname()=='/VBUS';b.RemoveNative(t)
nets={p.GetNetname():p.GetNet() for f in b.GetFootprints() for p in f.Pads()};added=[]
for name in ['vbusgate-vbus-restored-candidate','vbusgate-r14-rounded-escape-candidate','vbusgate-q3-escape-candidate']:
 other=k.LoadBoard(str(O/(name+'.kicad_pcb')))
 for old in other.GetTracks():
  if old.m_Uuid.AsString() in ids or old.GetNetname() not in ['/VBUS_GATE','/VBUS']:continue
  assert old.GetNetname() in ['/VBUS_GATE','/VBUS'],old.GetNetname()
  if isinstance(old,k.PCB_VIA):
   t=k.PCB_VIA(b);t.SetPosition(old.GetPosition());t.SetWidth(old.GetWidth(k.F_Cu));t.SetDrill(old.GetDrillValue());t.SetViaType(k.VIATYPE_THROUGH);t.SetLayerPair(k.F_Cu,k.B_Cu);t.SetFillingMode(old.GetFillingMode());t.SetCappingMode(old.GetCappingMode())
  else:
   t=k.PCB_TRACK(b);t.SetStart(old.GetStart());t.SetEnd(old.GetEnd());t.SetLayer(old.GetLayer());t.SetWidth(old.GetWidth())
  t.SetNet(nets[old.GetNetname()]);b.AddNative(t);t.thisown=False;added.append(old.GetNetname())
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'vbusgate-three-open-escapes-drc.json')],check=True,stdout=subprocess.DEVNULL)
r=json.loads((O/'vbusgate-three-open-escapes-drc.json').read_text());out={'violations':r['violations'],'parity':r['schematic_parity'],'unconnected_items':len(r['unconnected_items']),'added':added};(O/'vbusgate-three-open-escapes-review.json').write_text(json.dumps(out,indent=2)+'\n');print(out)
