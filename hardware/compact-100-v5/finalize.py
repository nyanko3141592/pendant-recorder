from pathlib import Path
import json,subprocess,hashlib
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;bfile=P/'pendant-compact-100-v5.kicad_pcb';b=k.LoadBoard(str(bfile));d=json.loads((P/'design.json').read_text());values={p['ref']:p['value'] for p in d['parts']}
if (P/'route.ses').exists():
 for t in list(b.GetTracks()):b.Delete(t)
 assert k.ImportSpecctraSES(b,str(P/'route.ses'))
for f in b.GetFootprints():f.SetValue(values[f.GetReference()])
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):t.SetWidth(k.FromMM(.1))
k.SaveBoard(str(bfile),b)
mic=next(f for f in b.GetFootprints() if f.GetReference()=='U8');holes=[dict(x=k.ToMM(p.GetPosition().x),y=k.ToMM(p.GetPosition().y),diameter=k.ToMM(p.GetDrillSize().x)) for p in mic.Pads() if p.GetDrillSize().x>0];(P/'mic-port.json').write_text(json.dumps(holes,indent=2)+'\n')
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(bfile),'--format','json','--schematic-parity','-o',str(P/'drc.json')],check=True)
x=json.loads((P/'drc.json').read_text());bad={i['uuid'] for v in x['violations'] if v['type']=='via_dangling' for i in v['items']}
for t in list(b.GetTracks()):
 if isinstance(t,k.PCB_VIA) and t.m_Uuid.AsString() in bad:b.Delete(t)
k.SaveBoard(str(bfile),b)
subprocess.run([cli,'pcb','drc',str(bfile),'--format','json','--schematic-parity','-o',str(P/'drc.json')],check=True)
subprocess.run([cli,'sch','export','pdf',str(P/'pendant-compact-100-v5.kicad_sch'),'-o',str(P/'schematic.pdf')],check=True)
x=json.loads((P/'drc.json').read_text());status=dict(order_ready=False,status='COMPACT_SIZE_AND_ELECTRICAL_PROTOTYPE',pcb_mm=[24,27,.8],case_target_mm=[26,31,14],footprints=87,tracks_and_vias=len(list(b.GetTracks())),drc_violations=len(x['violations']),unconnected_items=len(x['unconnected_items']),schematic_parity=len(x['schematic_parity']),erc_violations=0,pcb_sha256=hashlib.sha256(bfile.read_bytes()).hexdigest(),blockers=['Custom100mAh pack NTC/harness/dimensions/supply unconfirmed','Temperature guard thresholds provisional; charger voltage/termination acceptance pending','PCB electrical review and DFM pending; DRC results are not functional qualification','Component heights assumed; case retention/acoustic seal/supports pending','STM32 recording/power optimization not implemented;16h not demonstrated'])
(P/'order-status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps(status,indent=2))
