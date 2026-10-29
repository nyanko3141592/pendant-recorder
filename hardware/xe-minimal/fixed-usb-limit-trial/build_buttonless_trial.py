from pathlib import Path
import json,shutil,subprocess,hashlib,pcbnew as k,wx
app=wx.App(False)
D=Path(__file__).resolve().parent;S=D/'screw-hole-trial';O=D/'buttonless-trial';O.mkdir(exist_ok=True);name='pendant-xe-minimal'
for d in S.iterdir():
 if d.is_dir()and d.name.endswith('.pretty'):shutil.copytree(d,O/d.name,dirs_exist_ok=True)
for n in ['fp-lib-table']:shutil.copyfile(S/n,O/n)
for ext in ['kicad_pro','kicad_dru']:shutil.copyfile(S/('hole-18.1.'+ext),O/(name+'.'+ext))
spec=json.loads((D/'tps22950-19k1-candidate/design.json').read_text());spec['parts']=[p for p in spec['parts']if p['ref']not in ['SW1','R4']]
for p in spec['parts']:
 if p['ref']=='U1':
  for pin in p['pins']:
   if pin['number']=='38':pin['net']=None
spec['status']='BUTTONLESS_ROUTED_TRIAL_NOT_ADOPTED';(O/'design.json').write_text(json.dumps(spec,indent=2)+'\n')
subprocess.run(['python3',str(D.parent/'generate_schematic.py'),'xe-minimal',str(O)],check=True)
b=k.LoadBoard(str(S/'hole-18.1.kicad_pcb'));removed=[]
for t in list(b.GetTracks()):
 if t.GetNetname()=='/BUTTON_N' or t.m_Uuid.AsString() in ['9455eae1-0905-4f7b-acc0-46ebbe189680','25f398f6-0551-4b70-a7c1-32d20f8b1b1e','059c2a43-3c4b-4f47-a55d-146a8a4abc09']:removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
for f in list(b.GetFootprints()):
 if f.GetReference()in ['SW1','R4']:b.RemoveNative(f)
nc=k.NETINFO_ITEM(b,'unconnected-(U1-PA15-Pad38)');b.Add(nc)
f=next(f for f in b.GetFootprints()if f.GetReference()=='U1');next(p for p in f.Pads()if p.GetNumber()=='38').SetNet(nc)
k.ZONE_FILLER(b).Fill(b.Zones());out=O/(name+'.kicad_pcb');k.SaveBoard(str(out),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli';subprocess.run([cli,'pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
x=json.loads((O/'drc.json').read_text())
for attempt in range(12):
 dangling=[i['uuid'] for v in x['violations'] if v['type']=='track_dangling' for i in v['items']]
 if not dangling:break
 victims=[t for t in b.GetTracks() if t.m_Uuid.AsString() in dangling and t.GetNetname() in ['/GND','/V3V3']]
 if len(victims)!=len(dangling):raise RuntimeError('Unexpected dangling net; inspect manually')
 for t in victims:removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b)
 subprocess.run([cli,'pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drc.json')],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 x=json.loads((O/'drc.json').read_text())
r={'status':spec['status'],'pcb_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'removed_button_tracks':removed,'checks':{q:len(x[q])for q in ['violations','unconnected_items','schematic_parity']},'firmware_required':'PENDANT_AUTOMATIC_BATTERY_INDICATOR_MS=60000; PA15 analog/no pull','adopted':False};(O/'review.json').write_text(json.dumps(r,indent=2)+'\n');print(r['checks']);print([(v['type'],v['items'])for v in x['violations']])
