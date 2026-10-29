from pathlib import Path
import pcbnew as k,wx,json
app=wx.App(False);w=Path(__file__).resolve().parent
names=set(json.loads((w/'pdm-tp6-preparation.json').read_text())['critical_nets_outer_only'])|{'/USB_DP','/USB_DM'}
def sig(path):
 b=k.LoadBoard(str(path));r={n:[] for n in names}
 for t in b.GetTracks():
  n=str(t.GetNetname())
  if n not in names:continue
  endpoints=sorted([(t.GetStart().x,t.GetStart().y),(t.GetEnd().x,t.GetEnd().y)])
  r[n].append((isinstance(t,k.PCB_VIA),t.GetLayer(),endpoints,t.GetWidth(k.F_Cu) if isinstance(t,k.PCB_VIA) else t.GetWidth()))
 return {n:sorted(v) for n,v in r.items()}
a=sig(w/'ilim-main-connected.kicad_pcb');b=sig(w/'chg-via-ground-neck.kicad_pcb');r={n:{'same_geometry':a[n]==b[n],'source_items':len(a[n]),'trial_items':len(b[n])} for n in names};(w/'chg-neck-critical-comparison.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
