from pathlib import Path
import hashlib,json
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent
src=P/'usb-return-candidate.kicad_pcb'
b=k.LoadBoard(str(src));fp=next(f for f in b.GetFootprints() if f.GetReference()=='U12')
expected={'1':'CHG_GUARD_GATE','2':'BAT_TS','3':'TS_COLD_REF','4':'GND','5':'BAT_TS','6':'TS_HOT_REF','7':'CHG_GUARD_GATE','8':'VBUS'}
actual={p.GetNumber():p.GetNetname().lstrip('/') for p in fp.Pads()}
assert actual==expected,(actual,expected)
chain={'R12':{'1':'VBUS','2':'CHG_INHIBIT_GATE'},'R36':{'1':'CHG_GUARD_GATE','2':'GND'},'R43':{'1':'CHG_ALLOW','2':'CHG_GUARD_GATE'},'Q4':{'1':'CHG_GUARD_GATE','2':'GND','3':'CHG_INHIBIT_GATE'}}
for ref,nets in chain.items():
 part=next(f for f in b.GetFootprints() if f.GetReference()==ref)
 assert {p.GetNumber():p.GetNetname().lstrip('/') for p in part.Pads()}==nets,ref
mcu=next(f for f in b.GetFootprints() if f.GetReference()=='U1')
assert next(p for p in mcu.Pads() if p.GetNumber()=='20').GetNetname()=='/CHG_ALLOW'
report={'reset_chain':chain,'reset_logic':'R36 pulls Q4 gate down while MCU high-Z; Q4 off allows R12 to pull CE_N high. Comparator POR high-Z alone does not defeat this default inhibit. During MCU asserted permission, VBUS ramps still require qualification.','board':src.name,'board_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'part':fp.GetValue(),'footprint':str(fp.GetFPID().GetLibItemName()),'pad_nets':actual,'pin_function_match':True,'source':'https://www.ti.com/lit/ds/symlink/tlv7042.pdf','revision':'SLVSE13J November 2024','evidence':'Table 4-2 p4: DDF pin functions; section 6.4 p17: TLV704x POR output high impedance; section 6.4.1 p18: unpowered input tolerance','scope':'Logical pin-to-net match and steady-state comparator polarity only; land pattern and startup not qualified','steady_state':'Cold: BAT_TS > COLD_REF makes A sink. Hot: BAT_TS < HOT_REF makes B sink. Open-drain outputs may share guard node. Requires both supplies/references settled.','remaining':['POR output is high impedance; verify MCU CHG_ALLOW reset/pulldown and charger inhibit during VBUS ramps/brownout before enabling charge.','R25/B and NTC harness remain unqualified; do not enable charging.','Verify DDF recommended land pattern, JLC orientation and exact supplied part.','Verify offset/hysteresis/resistor tolerances across supply and temperature.'],'qualified':False}
(P/'comparator-review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
