import pcbnew as k,wx,json,hashlib,shutil,subprocess
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'pad-via-removal-candidate'
a=json.loads((O/'active-design.json').read_text())
for n,h in a['sha256'].items():assert hashlib.sha256((O/n).read_bytes()).hexdigest()==h
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));audit=json.loads((O/'exact-via-pad-overlap-audit.json').read_text());assert audit['board_sha256']==a['sha256']['pendant-xe-minimal.kicad_pcb'];out=[]
for v in audit['vias']:
 t=next(t for t in b.GetTracks() if t.m_Uuid.AsString()==v['uuid']);b.RemoveNative(t)
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pad-via-removal-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'pad-via-removal-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==a['unconnected_items'];out.append({'uuid':v['uuid'],'xy_mm':v['xy_mm'],'accepted':ok,'violations':r['violations'],'unconnected_items':len(r['unconnected_items'])});print(v['xy_mm'],ok,len(r['violations']),len(r['unconnected_items']),flush=True)
 if not ok:b.AddNative(t);t.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'pad-via-removal-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
(O/'pad-via-removal-review.json').write_text(json.dumps({'source_sha256':a['sha256']['pendant-xe-minimal.kicad_pcb'],'trials':out,'scope':'Connectivity and physical DRC only; current distribution and return paths still require qualification.'},indent=2)+'\n')
