"""Build separate electrical candidate; preserves last routed board/design."""
from pathlib import Path
import json,math,shutil,subprocess
P=Path(__file__).resolve().parent; O=P/'input-control'; O.mkdir(exist_ok=True)
d=json.loads((P/'design.json').read_text()); proposal=json.loads((P/'input-control-proposal.json').read_text()); ps={p['ref']:p for p in d['parts']}
for change in proposal['existing_pin_moves']:
 p=next(p for p in ps[change['ref']]['pins'] if p['number']==change['pin']); assert p['net']==change['from'];p['net']=change['to']
for number,net in [('12','USB_SUSPEND_PULSE'),('13','USB_HIGH_BUDGET'),('19','USB_RESUME_PULSE')]:
 p=next(p for p in ps['U1']['pins'] if p['number']==number); assert p['net'] is None;p['net']=net
extent={s:45.72 for s in range(4)}
for p in d['parts']:extent[p['section']]+=max(10.16,(math.ceil(len(p['pins'])/2)+1)*3.81)+12.7

def add(ref,val,fp,pins,note):
 assert ref not in ps
 s=min(extent,key=extent.get); extent[s]+=max(10.16,(math.ceil(len(pins)/2)+1)*3.81)+12.7
 p=dict(ref=ref,value=val,footprint=fp,pins=[dict(number=str(n),name=name,net=net,type=t) for n,name,net,t in pins],section=s,note=note,assembly_status='ENGINEERING_CANDIDATE_NOT_RELEASED')
 d['parts'].append(p);ps[ref]=p

def passive(ref,val,a,b,cap=False):add(ref,val,'Capacitor_SMD:C_0402_1005Metric' if cap else 'Resistor_SMD:R_0402_1005Metric',[(1,'1',a,'passive'),(2,'2',b,'passive')],'Input control candidate; tolerance/assembly/physical layout pending')
def mos(ref,gate,drain):add(ref,'2N7002','Package_TO_SOT_SMD:SOT-23',[(1,'G',gate,'input'),(2,'S','GND','passive'),(3,'D',drain,'passive')],'Ground-referenced gate; verify exact vendor leakage/capacitance and low-current sink at3.3V')
add('U13','MAX4995CAUT+T','Package_TO_SOT_SMD:SOT-23-6',[(1,'OUT','VBUS_LIMITED','power_out'),(2,'GND','GND','power_in'),(3,'SETI','USB_ILIM_SET','input'),(4,'ON','USB_INPUT_ON','input'),(5,'IN','VBUS','power_in'),(6,'FLAG_N',None,'open_collector')],'Continuous input limiter; DC screen3.3V only; FLAG explicitlyNC. Not charging qualification.')
add('U14','SN74HCS74DYYR','Pendant_Input:Texas_DYY0014A',[(1,'1CLR_N','USB_LATCH_CLEAR_N','input'),(2,'1D','VBUS','input'),(3,'1CLK','USB_LATCH_CLOCK','input'),(4,'1PRE_N','VBUS','input'),(5,'1Q',None,'output'),(6,'1Q_N','USB_INPUT_ON','output'),(7,'GND','GND','power_in'),(8,'2Q_N',None,'output'),(9,'2Q',None,'output'),(10,'2PRE_N','VBUS','input'),(11,'2CLK','GND','input'),(12,'2D','GND','input'),(13,'2CLR_N','GND','input'),(14,'VCC','VBUS','power_in')],'RawVBUS retainedOFF latch; Schmitt inputs. POR/resume clearQ=0 =>Q_N enables input. Suspend clocksD=1 =>Q_N disables. UnusedFF heldclear; PRE alwayshigh.')
add('U15','TLV803EB29DBZR','Package_TO_SOT_SMD:SOT-23',[(1,'GND','GND','power_in'),(2,'RESET_N','USB_LATCH_CLEAR_N','open_collector'),(3,'VDD','VBUS','power_in')],'2.93V supervisor;B40us nominal/80us maxunderdatasheetcondition. StandardDBZ pinout, NOT RDBZ or VDBZ. Initializes latch before chargerUVLO; analog startup still needs validation.')
passive('R44','390k 1%','USB_ILIM_SET','GND');passive('R45','100k 1%','USB_ILIM_SET','USB_HIGH_BUDGET_DRAIN');mos('Q5','USB_HIGH_BUDGET','USB_HIGH_BUDGET_DRAIN');passive('R46','100k 1%','USB_HIGH_BUDGET','GND')
passive('R47','10k 1%','VBUS','USB_LATCH_CLOCK');passive('R48','10k 1%','VBUS','USB_LATCH_CLEAR_N')
mos('Q6','USB_SUSPEND_PULSE','USB_LATCH_CLOCK');mos('Q7','USB_RESUME_PULSE','USB_LATCH_CLEAR_N')
passive('R49','100k 1%','USB_SUSPEND_PULSE','GND');passive('R50','100k 1%','USB_RESUME_PULSE','GND')
passive('C31','1u 10V','VBUS','GND',True);passive('C32','100n 10V','VBUS','GND',True);passive('C33','100n 10V','VBUS','GND',True)
d['revision']='mini-rect-v15 input-control electrical candidate NOT ROUTED';d['input_control_status']='CIRCUIT_CANDIDATE_NOT_QUALIFIED'
(O/'design.json').write_text(json.dumps(d,indent=2,ensure_ascii=False)+'\n')
shutil.copyfile(P/'charger-4v1-candidate.kicad_pro',O/'pendant-mini-rect-v15.kicad_pro')
lib=O/'Pendant_Input.pretty';lib.mkdir(exist_ok=True)
lines=['(footprint "Texas_DYY0014A" (version 20241229) (generator "pcbnew") (layer "F.Cu") (descr "TI DYY0014A manufacturer land pattern;14x1.05x0.30;row pitch3;pin pitch0.5") (attr smd)', '(fp_text reference "REF**" (at 0 -2.7) (layer "F.SilkS") (effects (font (size 0.8 0.8) (thickness 0.12))))','(fp_text value "SN74HCS74DYYR" (at 0 2.7) (layer "F.Fab") (effects (font (size 0.8 0.8) (thickness 0.12))))','(fp_rect (start -1 -2.1) (end 1 2.1) (stroke (width 0.1) (type default)) (fill none) (layer "F.Fab"))','(fp_rect (start -2.3 -2.35) (end 2.3 2.35) (stroke (width 0.05) (type default)) (fill none) (layer "F.CrtYd"))','(fp_circle (center -1.5 -2.1) (end -1.35 -2.1) (stroke (width 0.12) (type default)) (fill none) (layer "F.SilkS"))']
for n in range(1,15):
 x=-1.5 if n<=7 else 1.5;y=(n-1)*.5-1.5 if n<=7 else (14-n)*.5-1.5
 lines.append(f'(pad "{n}" smd roundrect (at {x} {y}) (size 1.05 0.3) (layers "F.Cu" "F.Paste" "F.Mask") (roundrect_rratio 0.166667))')
(lib/'Texas_DYY0014A.kicad_mod').write_text('\n'.join(lines)+')\n')
table=(P/"fp-lib-table").read_text().replace("${KIPRJMOD}/Pendant.pretty", "${KIPRJMOD}/../Pendant.pretty").replace("${KIPRJMOD}/PendantD1.pretty", "${KIPRJMOD}/../PendantD1.pretty")
(O/"fp-lib-table").write_text(table.rstrip()[:-1]+'(lib (name "Pendant_Input") (type "KiCad") (uri "${KIPRJMOD}/Pendant_Input.pretty") (options "") (descr "TI manufacturer derived candidate footprint")))\n')
subprocess.run(['python3',str(P/'generate_schematic.py'),'mini-rect-v15',str(O)],check=True)
print('Candidate physical parts:',len(d['parts']))
