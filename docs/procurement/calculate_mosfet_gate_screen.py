"""DC sensitivity only; no device/temperature qualification or measured claims."""
import json
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
context = json.loads((ROOT/'docs/procurement/xe-mosfet-circuit-networks.json').read_text())
rows = []
for ref, series, pull in [('Q3',100000,1000000),('Q4',10000,100000)]:
    for tolerance in [0,0.01,0.05]:
        rs=series*(1+tolerance)
        rp=pull*(1-tolerance)
        for leakage in [0,0.1e-6,1e-6,10e-6]:
            for required_gate in [1.8,2.5]:
                rows.append({'ref':ref,'hypothetical_resistor_tolerance':tolerance,
                  'total_gate_node_sink_A':leakage,'required_gate_V':required_gate,
                  'required_source_high_V':required_gate*(1+rs/rp)+leakage*rs})
out={'status':'DC_SENSITIVITY_NOT_QUALIFICATION','source_pcb_sha256':context['source_pcb_sha256'],
 'equation':'Vsource_required = Vgate_required*(1+Rseries/Rpull) + Itotal_sink*Rseries',
 'rows':rows,
 'interpretation':[
 'Q4 sink includes both comparator output leakages as well as MOSFET gate leakage; transistor IGSS alone is insufficient.',
 'Q3 has nominal 11x greater leakage sensitivity than Q4. GPIO-driven Q5/Q6/Q7 have no series resistor and need MCU output-level checks instead.',
 'At nominal resistances and 10 uA total sink, Q4 needs 2.85 V source for 2.5 V gate; at hypothetical +/-1% resistors it needs 2.85605 V.',
 'At 1.8 V required gate, the same Q4 +/-1% scenario requires about 2.08464 V. This favors a genuinely 1.8 V-rated candidate for Q4, subject to all other checks.',
 'Do not adopt DMN63D8L across Q3-Q7 as a blanket substitution; its 2.5 V rating needs branch-specific proof.',
 'Tolerance scenarios are hypothetical where BOM tolerance is unspecified. No regulator dropout, GPIO pin type, comparator leakage or temperature coverage is certified by this calculation.'],
 'gpio_reference':{'url':'https://www.st.com/resource/en/datasheet/stm32u535ce.pdf','revision':'DS14217 Rev 5 May 2025','page':205,'table':94,'high_level_bound':'VDDIOx - 0.4 V','scope':'CMOS row at 8 mA and 2.7..3.6 V; exclusions and aggregate current constraints apply. Per-pin applicability still needs checking.'}}
p=ROOT/'docs/procurement/xe-mosfet-gate-dc-screen.json'
p.write_text(json.dumps(out,indent=2)+'\n')
print(p)
