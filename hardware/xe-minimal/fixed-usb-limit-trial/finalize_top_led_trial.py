from pathlib import Path
import pcbnew as k,wx,shutil,json,subprocess,hashlib
app=wx.App(False);O=Path(__file__).resolve().parent/'top-led-trial';src=O/'ground-escape-candidate';dst=O/'final-routed';cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
def xy(p):return [round(k.ToMM(p.x),6),round(k.ToMM(p.y),6)]
end=k.VECTOR2I(k.FromMM(12.775),k.FromMM(7.1925))
assert any(isinstance(t,k.PCB_VIA) and xy(t.GetPosition())==[12.775,7.1925] and t.GetNetname()=='/GND' for t in b.GetTracks())
for t in list(b.GetTracks()):
 if t.GetNetname()!='/GND':continue
 if isinstance(t,k.PCB_VIA) and xy(t.GetPosition())==[12.65,7.1]:b.RemoveNative(t)
 elif not isinstance(t,k.PCB_VIA):
  if xy(t.GetStart())==[12.65,7.1]:t.SetStart(end)
  if xy(t.GetEnd())==[12.65,7.1]:t.SetEnd(end)
removed=[]
for attempt in range(15):
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'final-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'final-drc.json').read_text());ids={i['uuid'] for v in r['violations'] if v['type']=='track_dangling' for i in v['items']}
 if not ids:break
 victims=[t for t in b.GetTracks() if t.m_Uuid.AsString() in ids];assert all(t.GetNetname()=='/GND' for t in victims)
 for t in victims:removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
report={'status':'ROUTED_TOP_LED_CANDIDATE_NOT_ADOPTED','checks':{q:len(r[q]) for q in ['violations','unconnected_items','schematic_parity']},'pcb_sha256':hashlib.sha256(dst.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'D6_position_rotation':[14.125,5.975,90],'removed_ground_stubs':removed,'limitations':['LED MPN unselected','New through via and inner-plane route need manufacturing and signal return review','Updated complete 3D and optical validation pending','Not production release']}
(O/'final-review.json').write_text(json.dumps(report,indent=2)+'\n');print(report);print([(v['type'],v['items'])for v in r['violations']])
