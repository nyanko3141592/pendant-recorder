from pathlib import Path
import wx,json,shutil,subprocess
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;src='lse-inset-repair';name='pofv-pad-only';b=k.LoadBoard(str(P/(src+'.kicad_pcb')))
for ext in ['kicad_pro','kicad_sch']:shutil.copy2(P/(src+'.'+ext),P/(name+'.'+ext))
rows=[]
pads=[p for f in b.GetFootprints() for p in f.Pads() if p.GetAttribute()==k.PAD_ATTRIB_SMD]
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA):continue
 if not any(p.HitTest(t.GetPosition()) for p in pads):continue
 t.SetWidth(k.FromMM(.4))
 rows.append(dict(uuid=t.m_Uuid.AsString(),net=t.GetNetname(),x_mm=k.ToMM(t.GetPosition().x),y_mm=k.ToMM(t.GetPosition().y),outer_mm=k.ToMM(t.GetWidth(k.F_Cu)),old_drill_mm=k.ToMM(t.GetDrill()),new_drill_mm=.2));t.SetDrill(k.FromMM(.2))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(P/(name+'.kicad_pcb')),'--schematic-parity','--format','json','-o',str(P/(name+'-drc.json'))],check=True)
(P/'pofv-pad-only-inventory.json').write_text(json.dumps(rows,indent=2)+'\n')
