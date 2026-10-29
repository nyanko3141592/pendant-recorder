#!/usr/bin/env python3
"""Generate the canonical carrier SWD drawing and fail-closed vendor procedure."""
from pathlib import Path
import hashlib
import json

import pcbnew as k
import wx

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
UNIT = HERE.parent / "pendant-xe-minimal.kicad_pcb"
CARRIER = HERE.parent / "canonical-single-carrier-v1/carrier.kicad_pcb"
SVG = HERE / "vendor-programming-carrier.svg"
OUT = HERE / "vendor-programming-instruction.json"
EXPECTED = {"1": "/V3V3", "2": "/SWDIO", "3": "/NRST", "4": "/SWCLK", "5": "/GND"}
HARDWARE_REVISION = json.loads((HERE.parent / "prototype-architecture-v1.json").read_text())["version"]


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def pad_data(board, reference):
    fp = next(item for item in board.GetFootprints() if item.GetReference() == reference)
    pads = {pad.GetNumber(): pad for pad in fp.Pads() if pad.GetNumber()}
    assert set(pads) == set(EXPECTED)
    result = []
    for number, net in EXPECTED.items():
        pad = pads[number]
        assert pad.GetNetname() == net and pad.IsOnLayer(k.F_Cu)
        size = [k.ToMM(pad.GetSize().x), k.ToMM(pad.GetSize().y)]
        assert size[0] >= 1 and size[1] >= 1
        pos = pad.GetPosition()
        result.append({"pin": number, "net": net, "xy_mm": [k.ToMM(pos.x), k.ToMM(pos.y)], "size_mm": size})
    return fp, result


app = wx.App(False)
unit = k.LoadBoard(str(UNIT)); carrier = k.LoadBoard(str(CARRIER))
unit_fp, unit_pads = pad_data(unit, "J3")
carrier_fp, carrier_pads = pad_data(carrier, "J3")
assert unit_fp.GetOrientationDegrees() == carrier_fp.GetOrientationDegrees() == 0
translation = [carrier_pads[0]["xy_mm"][0] - unit_pads[0]["xy_mm"][0], carrier_pads[0]["xy_mm"][1] - unit_pads[0]["xy_mm"][1]]
assert translation == [21.25, 22.0]
for source, placed in zip(unit_pads, carrier_pads):
    assert source["pin"] == placed["pin"] and source["net"] == placed["net"]
    assert [placed["xy_mm"][0] - source["xy_mm"][0], placed["xy_mm"][1] - source["xy_mm"][1]] == translation

labels = {"1": "VTREF sense only", "2": "SWDIO", "3": "NRST", "4": "SWCLK", "5": "GND"}
circles = []
for pad in carrier_pads:
    x = 60 + pad["xy_mm"][0] * 8
    y = 60 + pad["xy_mm"][1] * 8
    circles.append(f'<rect x="{x-8:.1f}" y="{y-8:.1f}" width="16" height="16" rx="3" fill="#fbbf24" stroke="#111827"/><text x="{x:.1f}" y="{y+5:.1f}" text-anchor="middle" font-size="13">{pad["pin"]}</text><text x="{x+18:.1f}" y="{y+5:.1f}" font-size="12" fill="#f9fafb">{labels[pad["pin"]]} ({pad["xy_mm"][0]:.3f}, {pad["xy_mm"][1]:.3f})</text>')
svg = f'''<svg xmlns="http://www.w3.org/2000/svg" width="900" height="700" viewBox="0 0 900 700">
<rect width="900" height="700" fill="#111827"/><text x="36" y="38" fill="#f9fafb" font-family="sans-serif" font-size="24" font-weight="700">XE carrier programming — TOP view</text>
<text x="36" y="64" fill="#9ca3af" font-family="sans-serif" font-size="15">70 × 70 mm carrier; coordinates from carrier auxiliary origin; J3 is not a fitted component</text>
<g transform="translate(0,20)" font-family="sans-serif"><rect x="60" y="60" width="560" height="560" fill="#0f766e" stroke="#5eead4" stroke-width="3"/>
<rect x="230" y="236" width="220" height="220" fill="#164e63" stroke="#67e8f9" stroke-width="2"/><text x="456" y="450" fill="#cffafe" font-size="13">27.5 × 27.5 product PCB</text>
{''.join(circles)}
<path d="M 235 238 l 14 0 l -7 12 z" fill="#ef4444"/><text x="250" y="246" fill="#fecaca" font-size="13">J3 pin 1 marker</text></g>
<text x="655" y="120" fill="#fecaca" font-family="sans-serif" font-size="16">PIN 1 IS VTREF SENSE ONLY</text><text x="655" y="146" fill="#fecaca" font-family="sans-serif" font-size="16">DO NOT SOURCE POWER INTO J3</text>
<text x="655" y="205" fill="#f9fafb" font-family="sans-serif" font-size="14">Candidate board power:</text><text x="655" y="230" fill="#d1d5db" font-family="sans-serif" font-size="13">J1 USB-C, 5.0 V current-limited</text><text x="655" y="250" fill="#d1d5db" font-family="sans-serif" font-size="13">J2 battery connector empty</text><text x="655" y="282" fill="#fca5a5" font-family="sans-serif" font-size="13">Physical no-battery startup</text><text x="655" y="302" fill="#fca5a5" font-family="sans-serif" font-size="13">qualification: NOT RUN</text>
</svg>'''
SVG.write_text(svg + "\n")

report = {
    "status": "CANONICAL_CARRIER_SWD_INSTRUCTION_COMPLETE_POWER_METHOD_PHYSICAL_HOLD",
    "hardware_revision": HARDWARE_REVISION,
    "target_mpn": "STM32U585CIU6",
    "view": "TOP/component view of 70x70mm carrier",
    "carrier_translation_from_unit_mm": translation,
    "j3_pitch_mm": 1.27,
    "j3_pads": carrier_pads,
    "pin_1_rule": "VTREF sense only; programmer must not source power into J3 pin 1",
    "candidate_board_power": "J1 USB-C at 5.0V with external current limit; J2 battery connector empty",
    "candidate_board_power_physical_qualification": "NOT_RUN",
    "program_sequence": [
        "Verify carrier, PCB, firmware and instruction hashes",
        "Keep J2 battery connector empty and apply current-limited 5.0V through J1 USB-C",
        "Sense target V3V3 on J3 pin1; abort on absent or out-of-range VTREF",
        "Connect GND, SWDIO, SWCLK and NRST through J3 without powering pin1",
        "Program common BIN and BOR level 4, then verify full flash and option-byte readback",
        "Read STM32 96-bit UID and bind it to the unique PCB serial",
        "Verify charge request is LOW during reset; after firmware starts it may assert before USB configuration only on the fixed-100mA input path; storage rail defaults OFF",
        "Record programmer, fixture, timestamps, hashes and raw-log SHA-256 for every unit"
    ],
    "abort_conditions": ["unexpected current limit operation", "VTREF absent or outside qualified range", "flash verify failure", "BOR4 readback failure", "duplicate or unreadable MCU UID", "charge request high while reset is asserted", "storage rail on at default"],
    "vendor_acceptance": "NOT_VERIFIED",
    "physical_pogo_contact_and_no_battery_powerup": "NOT_RUN",
    "drawing": str(SVG.relative_to(ROOT)),
    "source_sha256": {str(UNIT.relative_to(ROOT)): sha(UNIT), str(CARRIER.relative_to(ROOT)): sha(CARRIER), str(SVG.relative_to(ROOT)): sha(SVG)},
    "orders_payments_uploads_vendor_contacts_performed": False
}
report["source_sha256"][str((HERE.parent / "prototype-architecture-v1.json").relative_to(ROOT))] = sha(HERE.parent / "prototype-architecture-v1.json")
OUT.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n")
print(json.dumps({"status": report["status"], "translation_mm": translation, "pads": len(carrier_pads)}))
