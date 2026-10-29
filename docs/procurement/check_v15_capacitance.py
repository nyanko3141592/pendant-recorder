"""Read actual board nets and screen capacitor selection; no effective-C approval."""
from pathlib import Path
import hashlib,json,re
import pcbnew,wx
app=wx.App(False)
ROOT=Path(__file__).resolve().parents[2]
board_path=ROOT/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.kicad_pcb'
candidates_path=ROOT/'docs/procurement/v15-capacitor-candidates.json'
board=pcbnew.LoadBoard(str(board_path))
candidates={r['reference']:r for r in json.loads(candidates_path.read_text())['entries']}
rows=[];connections={}
for f in board.GetFootprints():
 ref=f.GetReference();pads={p.GetNumber():p.GetNetname() for p in f.Pads()}
 if ref in ['U3','U4','U10','R1']:connections[ref]=dict(value=f.GetValue(),pads=pads)
 if ref not in candidates:continue
 match=re.match(r'([0-9.]+)([unp])',f.GetValue());assert match,f.GetValue()
 nominal=float(match[1])*{'u':1,'n':.001,'p':.000001}[match[2]]
 c=candidates[ref]
 rows.append(dict(reference=ref,design_value=f.GetValue(),pads=pads,nominal_uF=nominal,mpn=c['mpn'],tolerance_percent=c['tolerance_percent'],dielectric=c['dielectric']))
assert connections['R1']['value']=='0R'
assert set(connections['R1']['pads'].values())=={'/V3V3','/VDDA'}
assert connections['U10']['pads']['A1']=='/SD_V3' and connections['U10']['pads']['A2']=='/V3V3'
def group(nets):
 selected=[r for r in rows if '/GND' in r['pads'].values() and any(n in r['pads'].values() for n in nets)]
 nominal=sum(r['nominal_uF'] for r in selected)
 high=sum(r['nominal_uF']*(1+r['tolerance_percent']/100) for r in selected)
 return dict(nets=nets,references=sorted(r['reference'] for r in selected),nominal_uF=round(nominal,6),initial_tolerance_high_uF=round(high,6),hypothetical_additional_15_percent_high_uF=round(high*1.15,6))
r=dict(status='CAPACITANCE_REQUIREMENTS_SCREEN_NOT_QUALIFICATION',source_sha256={str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [board_path,candidates_path,Path(__file__)]},board_connections=connections,capacitors=rows,release_allowed=False)
r['regulator_requirements']=dict(part='TPS7A0233PDBVR',source='https://www.ti.com/lit/ds/symlink/tps7a02.pdf',revision='SBVS277C, September2022',page=5,minimum_effective_output_uF=.5,maximum_derated_output_uF=22,nominal_recommended_output_uF=1)
r['output_network_scenarios']=[group(['/V3V3','/VDDA']),group(['/V3V3','/VDDA','/SD_V3'])]
r['output_network_interpretation']=['R1=0R joins VDDA decoupling; SD capacitors are connected through U10 when enabled. Treat full-network sum as a conservative stability screening scenario, not proof of exact loop impedance.','Board-only capacitors exclude capacitance inside the chosen microSD and other connected devices.','15% added positive capacitance is a sensitivity corner; DC-bias reduction, temperature correlation, aging and ESR have not been characterized. Crossing22uF does not prove actual instability; it prevents qualification from nominal capacitance alone.','Do not blindly increase C4 or C27 to improve transient response. Check actual effective total against regulator stability range and load-step performance.']
r['vcap_requirements']=dict(reference='C5',net='/VCAP',source='https://www.st.com/resource/en/datasheet/stm32u535ce.pdf',revision='DS14217Rev5,May2025',page=127,nominal_uF=4.7,tolerance_percent=20,minimum_voltage_rating_V=10,ESR_strictly_below_ohm=.020,ESR_frequency_Hz=3000000,candidate_nominal_capacity_tolerance_voltage_match=True,candidate_ESR_qualified=False,remaining='Confirm ESR at3MHz and effective capacitance under actual core rail conditions; K-SIM typical curves are not guaranteed limits.')
r['charger_requirements']=dict(source='https://www.ti.com/lit/ds/symlink/bq25185.pdf',revision='SLUSF65B,August2026',page=21,minimum_derated_capacitance_uF=1,recommendation='X5R/X7R;25V rating recommended by TI for IN/SYS operating around5V, not a blanket assertion that10V parts fail.',rails={'/VBUS_LIMITED':'C13 plus C29','/SYS':'C15','/BAT':'C14'},remaining='Verify effective capacitance of chosen parts at rail extremes; nominal rating alone is insufficient.')
(ROOT/'docs/procurement/v15-capacitance-network-review.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r['output_network_scenarios'],indent=2))
