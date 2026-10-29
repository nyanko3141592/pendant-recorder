from pathlib import Path
import json,shutil,subprocess,hashlib
import pcbnew as k,wx
app=wx.App(False)
d=Path(__file__).resolve().parent;s=d.parent
base='pendant-xe-minimal'
remove={'Q5','R45','R46'};nets={'/USB_HIGH_BUDGET','/USB_HIGH_BUDGET_DRAIN'}
spec=json.loads((s/'design.json').read_text());spec['parts']=[p for p in spec['parts'] if p['ref'] not in remove]
for p in spec['parts']:
 for pin in p['pins']:
  if '/'+str(pin['net']) in nets:pin['net']=None
spec['status']='FIXED_USB_LIMIT_CANDIDATE_NOT_ADOPTED'
(d/'design.json').write_text(json.dumps(spec,indent=2)+'\n')
for ext in ['kicad_pro','kicad_dru']:shutil.copyfile(s/(base+'.'+ext),d/(base+'.'+ext))
for name in ['PendantMinimal.pretty','PendantXE.pretty']:
 if (s/name).exists():shutil.copytree(s/name,d/name,dirs_exist_ok=True)
(d/'fp-lib-table').write_text((s/'fp-lib-table').read_text().replace('${KIPRJMOD}/../mini-rect-v15','${KIPRJMOD}/../../mini-rect-v15'))
subprocess.run(['python3',str(s/'generate_schematic.py'),'xe-minimal',str(d)],check=True)
b=k.LoadBoard(str(s/(base+'.kicad_pcb')))
for f in list(b.GetFootprints()):
 if f.GetReference() in remove:b.RemoveNative(f)
 else:
  for pad in f.Pads():
   if pad.GetNetname() in nets:
    nc=k.NETINFO_ITEM(b,'unconnected-(U1-PB6-Pad42)');b.Add(nc);pad.SetNet(nc)
removed=0
for t in list(b.GetTracks()):
 if t.GetNetname() in nets or t.m_Uuid.AsString() in {'0ff06f05-21c9-4998-b4a9-3933e02de76f','be74a202-425e-434e-a9f7-e1eaf190213d'}:b.RemoveNative(t);removed+=1
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(d/(base+'.kicad_pcb')),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(d/(base+'.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(d/'drc.json')],check=True)
q=json.loads((d/'drc.json').read_text())
review={'status':'CANDIDATE_NOT_ADOPTED','source_sha256':hashlib.sha256((s/(base+'.kicad_pcb')).read_bytes()).hexdigest(),'removed_parts':sorted(remove),'removed_tracks_or_vias':removed,'footprints':len(list(b.GetFootprints())),'checks':{x:len(q[x])for x in ['violations','unconnected_items','schematic_parity']},'limitations':['Fixed-limit power-path dynamics unqualified','Firmware still requires variant support','Board outline unchanged; reclaimed space is not a smaller finished product']}
(d/'review.json').write_text(json.dumps(review,indent=2)+'\n');print(review)
