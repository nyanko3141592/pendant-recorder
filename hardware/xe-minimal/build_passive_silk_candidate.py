"""Local footprint-backed passive silk cleanup; isolated candidate."""
from pathlib import Path
import pcbnew as k,wx,shutil,json,hashlib,subprocess
app=wx.App(False);p=Path(__file__).resolve().parent/'electrical-panel-candidate-v3';d=p/'passive-silk-candidate-v3';d.mkdir(exist_ok=False)
for name in ('panel.kicad_pcb','panel.kicad_pro','panel.kicad_dru','fp-lib-table'):shutil.copyfile(p/name,d/name)
lib=d/'PanelPassives.pretty';lib.mkdir();shutil.copyfile('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Resistor_SMD.pretty/R_0402_1005Metric.kicad_mod',lib/'R_0402_1005Metric.kicad_mod');allowed={'Resistor_SMD:R_0402_1005Metric','Resistor_SMD:R_0603_1608Metric','Capacitor_SMD:C_0402_1005Metric','Capacitor_SMD:C_0603_1608Metric'}
def remove_silk(f):
 items=[g for g in f.GraphicalItems() if g.GetLayer() in (k.F_SilkS,k.B_SilkS)]
 for g in items:f.RemoveNative(g)
 return len(items)
for ident in allowed:
 nick,name=ident.split(':');f=k.FootprintLoad('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/'+nick+'.pretty',name);assert f;remove_silk(f);f.SetFPID(k.LIB_ID('PanelPassives',name));k.FootprintSave(str(lib),f)
t=d/'fp-lib-table';s=t.read_text();idx=s.rfind(')');s=s[:idx]+'  (lib (name "PanelPassives")(type "KiCad")(uri "${KIPRJMOD}/PanelPassives.pretty")(options "")(descr "Passive footprints without production silkscreen outlines"))\n'+s[idx:];t.write_text(s)
b=k.LoadBoard(str(d/'panel.kicad_pcb'));changes=[]
for f in b.GetFootprints():
 ident=str(f.GetFPID().GetLibNickname())+':'+str(f.GetFPID().GetLibItemName())
 if ident not in allowed:continue
 count=remove_silk(f);f.SetFPID(k.LIB_ID('PanelPassives',ident.split(':')[1]));changes.append({'ref':f.GetReference(),'removed_graphics':count})
k.SaveBoard(str(d/'panel.kicad_pcb'),b)
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(d/'panel.kicad_pcb'),'--format','json','--severity-all','-o',str(d/'drc.json')],check=True)
r=json.loads((d/'drc.json').read_text());(d/'review.json').write_text(json.dumps({'status':'ISOLATED_PASSIVE_SILK_REVISION_NOT_ADOPTED','source_pcb_sha256':hashlib.sha256((p/'panel.kicad_pcb').read_bytes()).hexdigest(),'candidate_pcb_sha256':hashlib.sha256((d/'panel.kicad_pcb').read_bytes()).hexdigest(),'changes':changes,'violations':r['violations'],'unconnected_items':r['unconnected_items'],'limitations':['Electrical/manufacturing export equivalence comparison pending.','Nonpassive markings and remaining thin lines still require review.']},indent=2)+'\n');print('changed',len(changes),'violations',len(r['violations']))
