"""Hypothetical SETI leakage sensitivity, not MAX4995 5V qualification."""
from pathlib import Path
import json,hashlib
ROOT=Path(__file__).resolve().parents[2]
RMIN_KOHM=390*.99
KMAX=31946
OFFSET_KOHM=2.48
OVERHEAD_MA=.3
TARGET_MA=100-OVERHEAD_MA
# Equivalent shunt at a hypothetical fixed SETI voltage; not an internal IC model.
rtarget=KMAX/TARGET_MA-OFFSET_KOHM
rows=[]
for vset in [.5,.75,1,1.25,1.5]:
 for leak_uA in [0,.1,.25,.5,1]:
  conductance=1/(RMIN_KOHM*1000)+leak_uA*1e-6/vset
  reff=1/conductance/1000
  current=KMAX/(reff+OFFSET_KOHM)+OVERHEAD_MA
  rows.append({'assumed_SETI_V':vset,'hypothetical_Q5_sink_uA':leak_uA,'equivalent_R_kohm':reff,'screen_total_mA':current,'exceeds_100mA_in_model':current>100})
out={'status':'SENSITIVITY_FLAGS_Q5_LEAKAGE_NOT_ACTUAL_FAILURE','source_pcb_sha256':hashlib.sha256((ROOT/'hardware/xe-minimal/pendant-xe-minimal.kicad_pcb').read_bytes()).hexdigest(),'baseline_source':'hardware/mini-rect-v15/screen_input_limiter.py','source_url':'https://www.analog.com/media/en/technical-documentation/data-sheets/max4995a-max4995c.pdf','model':'R_equiv=1/(1/R44 + I_Q5/V_SETI); I_screen=31946/(R_equiv_kohm+2.48)+0.3mA','scope':['K and offset originate in prior3.3V datasheet screen, not5V guarantee','SETI voltages are sensitivity inputs, not asserted device values','Equivalent shunt assumes fixed SETI voltage and constant sink; internal control behavior and R45 voltage drop require validation','0.3mA overhead is only prior3.3V limiter Iq bound; latch, supervisor, divider and other upstream current omitted','Initial1% resistor tolerance only; no temperature drift included'],'rows':rows,'leakage_allowance_uA_by_assumed_SETI_V':[{'SETI_V':v,'Q5_sink_uA_to_reach_100mA':v*(1/(rtarget*1000)-1/(RMIN_KOHM*1000))*1e6}for v in [.5,.75,1,1.25,1.5]],'decision':'Do not adopt DMN63D8L-7 for Q5 from its 1uA IDSS number alone. On resistance is not the limiting selection criterion. Establish SETI behavior and leakage including temperature, or change the switching component/network.','remaining':['Recover manufacturer SETI electrical voltage limits and current-limit behavior at actual5V','Include total upstream current and resistor TCR','Select Q5 with bounded relevant off leakage or revise resistor network','Measure preconfiguration current, switching transients and suspend behavior on hardware']}
(ROOT/'docs/procurement/xe-q5-leakage-screen.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out['leakage_allowance_uA_by_assumed_SETI_V'],indent=2))
