"""Sensitivity calculation only: no guaranteed slew or cell pulse qualification."""
from pathlib import Path
import json
P=Path(__file__).resolve().parent
rows=[]
for bulk in [22,4.7,2.2]:
 for slew in [1,3.2,5]:
  c=(bulk+.1)*1.2
  ic=c*slew
  rows.append({'bulk_uF':bulk,'total_plus20pct_uF':c,'slew_mV_per_us':slew,'capacitor_current_mA':round(ic,3),'with_25mA_storage_and_5mA_other_mA':round(ic+30,3),'under_50mA_screen':ic+30<=50})
result={'status':'DESIGN_SCREEN_NOT_QUALIFICATION','equation':'I_mA = C_uF * slew_mV_per_us','current_pcb':'storage-4gb-candidate.kicad_pcb','current_capacitors':['C27 22uF','C26 0.1uF'],'cell_limit_mA_assumed':50,'ti_source':'https://www.ti.com/lit/ds/symlink/tps22916.pdf','ti_table':'RevF section6.6.2 TPS22916C: 3.6V typical slew3.2mV/us; no guaranteed max. Not the exact3.3V/load/temperature corner.','storage_source':'reference/csnp32gcr01-bow.pdf section4','storage_limit_note':'25mA max operation at3.3V/50MHz read/write is not an explicit power-on/transient bound','other_load_note':'5mA hypothetical headroom placeholder, not a measured or guaranteed MCU/system limit','capacitance_note':'20% positive tolerance screening. Effective capacitance, bias, internal capacitance, LDO behavior and wiring not modeled.','rows':rows,'decision':'22uF creates a credible startup current conflict even after changing storage. Evaluate smaller bulk capacitor or slower controlled ramp before release. Reducing capacitance trades against write-load droop and requires measurement.','needs_vendor':['Auxiliary unnumbered land electrical connection and paste requirements','Power-on current waveform/max and permitted ramp/reset conditions','Cell actual pulse current/duration limits'],'needs_hardware':['Battery current and SD_V3 ramp at startup, scope droop during writes across voltage/temp','Recording loss and storage initialization with production pack/harness'],'production_changes':False}
(P/'storage-inrush-screen.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(rows,indent=2))
