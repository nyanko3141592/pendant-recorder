from pathlib import Path
import wx,json,shutil,subprocess
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;name='pofv-final-trial';b=k.LoadBoard(str(P/'pofv-connected.kicad_pcb'));d=json.loads((P/'pofv-connected-pad-audit.json').read_text());ids={v['uuid'] for v in d['vias'] if v['drill_mm']<.2}
assert len(ids)==1
for t in b.GetTracks():
 if t.m_Uuid.AsString() in ids:t.SetWidth(k.FromMM(.4));t.SetDrill(k.FromMM(.2))
for ext in ['kicad_pro','kicad_sch']:shutil.copy2(P/('pofv-connected.'+ext),P/(name+'.'+ext))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(P/(name+'.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(P/(name+'.kicad_pcb')),'--schematic-parity','--format','json','-o',str(P/(name+'-drc.json'))],check=True)
