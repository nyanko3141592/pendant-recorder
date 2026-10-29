"""Isolated LSE omission candidate; canonical files are never overwritten."""
import json,shutil,subprocess,hashlib
from pathlib import Path
import pcbnew as k,wx
app=wx.App(False)
O=Path(__file__).resolve().parent;D=O/'no-lse-candidate';D.mkdir(exist_ok=True)
base=O/'pendant-xe-minimal';dst=D/'pendant-xe-minimal'
(D/'fp-lib-table').write_text((O/'fp-lib-table').read_text().replace('${KIPRJMOD}',str(O)))
d=json.loads((O/'design.json').read_text());d['parts']=[p for p in d['parts'] if p['ref'] not in {'Y1','C11','C12'}]
for part in d['parts']:
 if part['ref']=='U1':
  for pin in part['pins']:
   if pin['number'] in ('3','4'):
    assert pin['net'] in ('LSE_IN','LSE_OUT');pin['net']=None
(D/'design.json').write_text(json.dumps(d,indent=2)+'\n')
for ext in ('.kicad_pro','.kicad_dru'):shutil.copyfile(base.with_suffix(ext),dst.with_suffix(ext))
subprocess.run(['python3',str(O/'generate_schematic.py'),'xe-minimal',str(D)],check=True)
b=k.LoadBoard(str(base.with_suffix('.kicad_pcb')));removed=[]
for t in list(b.GetTracks()):
 if t.GetNetname() in ('/LSE_IN','/LSE_OUT') or t.m_Uuid.AsString() in {'9e60b811-b576-4513-a292-81f7edc16270','ea30af8a-6e80-4bb1-8a22-6a975ebaf31b'}:
  removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
for f in list(b.GetFootprints()):
 if f.GetReference() in {'Y1','C11','C12'}:b.RemoveNative(f)
 elif f.GetReference()=='U1':
  for p in f.Pads():
   if p.GetNumber() in ('3','4'):
    name='PC14' if p.GetNumber()=='3' else 'PC15'
    net=k.NETINFO_ITEM(b,'unconnected-(U1-'+name+'-Pad'+p.GetNumber()+')');b.AddNative(net);net.thisown=False;p.SetNet(net)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(D/'drc.json')],check=True)
subprocess.run([cli,'sch','erc',str(dst.with_suffix('.kicad_sch')),'--format','json','--severity-all','-o',str(D/'erc.json')],check=True)
(D/'change-review.json').write_text(json.dumps({'status':'NOT_ADOPTED','source_pcb_sha256':hashlib.sha256(base.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'removed_parts':['Y1','C11','C12'],'removed_oscillator_copper_uuids':removed,'remaining_footprints':len(list(b.GetFootprints()))},indent=2)+'\n')
