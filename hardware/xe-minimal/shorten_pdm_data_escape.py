import pcbnew as k,wx,json,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'pdm-data-short-escape-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
remove={'8cc4f7df-3dde-4d43-938e-f81d8dc026a6','3e868030-54e6-4ee5-8f15-8dfdfd86eeeb','900c98f1-7b0e-41a1-bbaf-8c873520542e','a5d12075-4972-40e1-acff-4522ca4be01c','c8b6ac20-475d-43b6-a0c8-93724395bddb','6b30d304-2794-4900-97d5-bda71933081e','b97fb254-52dc-402a-9bdb-fc8263f12d68'}
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in remove:b.RemoveNative(t)
v=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='87bffccc-3927-4521-8e4a-13b8fa8644ed');tr=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='ba542323-54c7-489f-9083-2a317abdbe7c');pos=v.GetPosition()
p=next(p for f in b.GetFootprints() if f.GetReference()=='U1' for p in f.Pads() if p.GetNumber()=='40')
t=k.PCB_TRACK(b);t.SetStart(p.GetPosition());t.SetEnd(pos);t.SetLayer(k.B_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(p.GetNet());b.AddNative(t);t.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pdm-data-short-escape-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'pdm-data-short-escape-drc.json').read_text());print(json.dumps({'violations':r['violations'],'parity':r['schematic_parity'],'unconnected':len(r['unconnected_items'])},indent=2))
