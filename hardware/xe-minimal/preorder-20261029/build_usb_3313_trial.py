from pathlib import Path
import wx,pcbnew as k,json,shutil,subprocess,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'usb-return-via.kicad_pcb';out=w/'usb-3313-width-trial.kicad_pcb';b=k.LoadBoard(str(p));n=0
for t in b.GetTracks():
 if not isinstance(t,k.PCB_VIA) and t.GetNetname() in ['/USB_DP','/USB_DM']:t.SetWidth(k.FromMM(.124));n+=1
for t in b.GetTracks():
 if t.m_Uuid.AsString()=='f598ce56-dbc0-4160-8130-e2658301cf88':t.SetWidth(k.FromMM(.1172))
k.SaveBoard(str(out),b)
# Retain physical thickness until the mechanical tolerance contract is updated.
s=out.read_text().replace('(thickness 0.1164)','(thickness 0.0994)').replace('(thickness 0.4932)','(thickness 0.5)').replace('FR4 - PROVISIONAL NOT FAB QUALIFIED','FR4 - JLC04081H-3313 CANDIDATE').replace('(epsilon_r 4.5)','(epsilon_r 4.1)');s=s.replace('(type "core")\n\t\t\t\t(thickness 0.5)\n\t\t\t\t(material "FR4 - JLC04081H-3313 CANDIDATE")\n\t\t\t\t(epsilon_r 4.1)','(type "core")\n\t\t\t\t(thickness 0.5)\n\t\t\t\t(material "FR4 - JLC04081H-3313 CANDIDATE")\n\t\t\t\t(epsilon_r 4.6)');out.write_text(s)
for ext in ('.kicad_pro','.kicad_dru','.kicad_sch'):shutil.copy2(p.with_suffix(ext),out.with_suffix(ext))
subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc','--refill-zones','--save-board','--schematic-parity','--severity-all','--format','json','-o',str(w/'usb-3313-width-trial-drc.json'),str(out)],check=True)
d=json.loads((w/'usb-3313-width-trial-drc.json').read_text());r={'status':'WIDTH_STACKUP_TRIAL_NOT_RELEASED','sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'changed_usb_segments':n,'width_mm':.124,'geometric':len([v for v in d['violations'] if v['type']!='lib_footprint_issues']),'unconnected':len(d['unconnected_items']),'parity':len(d['schematic_parity']),'mechanical_board_thickness_pending':True,'finished_thickness_contract_mm':[.7,.9],'stackup_copper_dielectric_sum_mm':.7992,'release_allowed':False};(w/'usb-3313-width-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
