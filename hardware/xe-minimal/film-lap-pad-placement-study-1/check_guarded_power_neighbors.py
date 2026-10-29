import pcbnew as k,json,wx,hashlib
from pathlib import Path
app=wx.App(False)
b=k.LoadBoard('/Users/takahashinaoki/Dev/pendant-recorder/hardware/xe-minimal/film-lap-pad-placement-study-1/pendant-xe-film-lap-guarded-footprint-trial.kicad_pcb')
fps=[]
for f in b.GetFootprints():
 x,y=k.ToMM(f.GetPosition().x),k.ToMM(f.GetPosition().y)
 if 18<x<24 and y<5:fps.append({'ref':f.GetReference(),'value':f.GetValue(),'xy':[x,y],'pads':[{'n':p.GetNumber(),'net':p.GetNetname(),'xy':[k.ToMM(p.GetPosition().x),k.ToMM(p.GetPosition().y)]}for p in f.Pads()]})
vias=[]
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA)and t.GetNetname()=='/GND':
  x,y=k.ToMM(t.GetPosition().x),k.ToMM(t.GetPosition().y)
  if 18<x<24 and y<5:vias.append([x,y])
src=Path(__file__).resolve().parent/'pendant-xe-film-lap-guarded-footprint-trial.kicad_pcb'
r={'status':'POWER_NEIGHBOR_INVENTORY_NOT_PDN_ACCEPTANCE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'components':fps,'ground_vias':vias,'limits':['Local coordinate inventory only; no return-path connectivity, capacitor impedance or transient analysis.']}
(Path(__file__).resolve().parent/'guarded-power-neighbors-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'component_refs':[x['ref']for x in fps],'ground_vias':vias},indent=2))
