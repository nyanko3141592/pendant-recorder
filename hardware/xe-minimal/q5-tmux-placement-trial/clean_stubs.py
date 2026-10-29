from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess,collections
app=wx.App(False);d=Path('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/q5-tmux-placement-trial');src=d/'vbus-multigoal';dst=d/'stub-clean';b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
for ext in ['.kicad_pro','.kicad_sch','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
removed=[]
for t in list(b.GetTracks()):
 old=t.m_Uuid.AsString()=='be74a202-425e-434e-a9f7-e1eaf190213d'
 def near(p):return abs(k.ToMM(p.x)-6.954999)<.00001 and abs(k.ToMM(p.y)-9.7675)<.00001
 if old or (t.GetNetname()=='/VBUS' and (near(t.GetStart()) or near(t.GetEnd()))):
  removed.append({'uuid':t.m_Uuid.AsString(),'net':t.GetNetname(),'kind':type(t).__name__});b.RemoveNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(d/'stub-clean-drc.json')],check=True)
q=json.loads((d/'stub-clean-drc.json').read_text());v={'removed':removed,'types':dict(collections.Counter(x['type'] for x in q['violations'])),'unconnected':len(q['unconnected_items']),'parity':len(q['schematic_parity'])};(d/'stub-clean-review.json').write_text(json.dumps(v,indent=2)+'\n');print(v)
