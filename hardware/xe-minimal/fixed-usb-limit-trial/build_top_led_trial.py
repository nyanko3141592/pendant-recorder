from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess,hashlib
app=wx.App(False)
D=Path(__file__).resolve().parent;S=D/'buttonless-trial';O=D/'top-led-trial';O.mkdir(exist_ok=True)
name='pendant-xe-minimal'
for p in S.iterdir():
 if p.is_dir() and p.name.endswith('.pretty'):shutil.copytree(p,O/p.name,dirs_exist_ok=True)
for n in ['fp-lib-table','design.json','bom.csv','connections.csv',name+'.kicad_pro',name+'.kicad_sch',name+'.kicad_dru']:shutil.copyfile(S/n,O/n)
b=k.LoadBoard(str(S/(name+'.kicad_pcb')))
f=next(f for f in b.GetFootprints() if f.GetReference()=='D6')
f.Flip(f.GetPosition(),False);f.SetOrientationDegrees(90);f.SetPosition(k.VECTOR2I(k.FromMM(14.125),k.FromMM(5.975)))
removed=[]
for t in list(b.GetTracks()):
 if t.GetNetname()=='/STATUS_LED_A':removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
k.ZONE_FILLER(b).Fill(b.Zones());out=O/(name+'.kicad_pcb');k.SaveBoard(str(out),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drc.json')],check=True,stdout=subprocess.DEVNULL)
x=json.loads((O/'drc.json').read_text())
r={'status':'TOP_LED_PLACEMENT_UNROUTED_NOT_ADOPTED','pcb_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'removed_LED_A_tracks':removed,'checks':{q:len(x[q])for q in ['violations','unconnected_items','schematic_parity']}}
(O/'placement-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r['checks']);print([(v['type'],[i['description'] for i in v['items']]) for v in x['violations']])
