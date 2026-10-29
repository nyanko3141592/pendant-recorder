from pathlib import Path
import json,shutil,subprocess,pcbnew as k,wx
app=wx.App(False);D=Path(__file__).resolve().parent/'tps22950-placement';src='on-routed';dst='pdm-clear'
for ext in ['kicad_pro','kicad_sch','kicad_dru']:shutil.copyfile(D/(src+'.'+ext),D/(dst+'.'+ext))
b=k.LoadBoard(str(D/(src+'.kicad_pcb')));old=next(t for t in b.GetTracks()if t.m_Uuid.AsString()=='393caa2d-deae-4e5d-aa84-f5d37884e69c');net=old.GetNet();b.RemoveNative(old)
path=[(12.2,.5),(12.5,.35),(17.1,.35),(17.4,.6)]
for a,c in zip(path,path[1:]):
 t=k.PCB_TRACK(b);t.SetStart(k.VECTOR2I(k.FromMM(a[0]),k.FromMM(a[1])));t.SetEnd(k.VECTOR2I(k.FromMM(c[0]),k.FromMM(c[1])));t.SetWidth(k.FromMM(.15));t.SetLayer(k.F_Cu);t.SetNet(net);b.AddNative(t);t.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(D/(dst+'.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(D/(dst+'.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(D/(dst+'-drc.json'))],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
x=json.loads((D/(dst+'-drc.json')).read_text());print({a:len(x[a])for a in ['violations','unconnected_items','schematic_parity']});print([v['type']for v in x['violations']])
