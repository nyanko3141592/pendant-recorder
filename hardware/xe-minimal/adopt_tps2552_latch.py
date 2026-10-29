#!/usr/bin/env python3
"""Adopt the DRC/ERC/parity-screened TPS2552DBVR-1 safety redesign."""

from pathlib import Path
import csv
import json
import shutil

HERE = Path(__file__).resolve().parent
TRIAL = HERE / "tps2552-latch-trial"

copies = {
    TRIAL / "pendant-xe-tps2552-latch-trial.kicad_pcb": HERE / "pendant-xe-minimal.kicad_pcb",
    TRIAL / "pendant-xe-tps2552-latch-trial.kicad_sch": HERE / "pendant-xe-minimal.kicad_sch",
    TRIAL / "Pendant.kicad_sym": HERE / "Pendant.kicad_sym",
}
for source, destination in copies.items():
    assert source.is_file(), source
    shutil.copyfile(source, destination)

design_path = HERE / "design.json"
design = json.loads(design_path.read_text())
design["parts"] = [part for part in design["parts"] if part["ref"] != "R51"]
parts = {part["ref"]: part for part in design["parts"]}
parts["U13"].update(
    value="TPS2552DBVR-1",
    note="Active-low latch-off USB input current limiter; EN tied to GND and ILIM shorted to IN through a filled/capped pad via for a guaranteed 50..100mA threshold. 7.0V absolute input maximum leaves 1.1V below the NCP360 guaranteed 5.9V OVLO maximum. JLC C140331; physical abnormal-input, latch, thermal and recovery EVT pending.",
    assembly_status="JLC_C140331_PUBLIC_STOCK_OBSERVED_2026-10-28_NOT_RESERVED",
)
parts["U3"]["note"] = "BQ25185 Rev.B: R42=130k selects 4.1V nominal with 4.1205V guaranteed maximum and internal ILIM500; R10=30k gives 9..11mA fast charge. Upstream TPS2552DBVR-1 bounds guaranteed USB input to 100mA maximum and latches off on overcurrent. Physical charge, transient, thermal and recovery qualification pending."
parts["C31"]["note"] = "TPS2552 input local bypass adjacent to U13; effective capacitance and abnormal-input transient behavior require EVT."
parts["C32"]["note"] = "TPS2552 output local bypass directly below U13; effective capacitance, latch and recovery behavior require EVT."
design["input_control_status"] = "NCP360_OVP_PLUS_TPS2552_50_TO_100MA_LATCH_OFF_ERC_DRC_PARITY_PASS_PHYSICAL_ABNORMAL_INPUT_EVT_NOT_RUN"
design_path.write_text(json.dumps(design, ensure_ascii=False, indent=2) + "\n")

bom_path = HERE / "bom.csv"
with bom_path.open(newline="") as stream:
    fieldnames = csv.DictReader(stream).fieldnames
    stream.seek(0)
    rows = [row for row in csv.DictReader(stream) if row["Reference"] != "R51"]
assert fieldnames
for row in rows:
    if row["Reference"] == "U13":
        row["Part/value"] = "TPS2552DBVR-1"
        row["Design note"] = "Active-low latch-off USB input limiter; JLC C140331. EN=GND; ILIM=IN through one filled/capped POFV gives guaranteed 50..100mA. 7.0V absolute maximum leaves 1.1V to NCP360 5.9V guaranteed OVLO maximum. Physical abnormal-input, latch, thermal and recovery EVT required."
    elif row["Reference"] == "U3":
        row["Design note"] = "BQ25185 Rev.B: R42=130k selects 4.1V nominal (4.1205V guaranteed maximum) and internal ILIM500; R10=30k gives 9..11mA fast charge. Upstream U13 TPS2552DBVR-1 bounds guaranteed USB input to 100mA and latches off on overcurrent. Physical charge, transient, thermal and recovery qualification pending."
    elif row["Reference"] == "C31":
        row["Design note"] = "TPS2552 VIN local bypass; effective capacitance and abnormal-input transient behavior require EVT."
    elif row["Reference"] == "C32":
        row["Design note"] = "TPS2552 VOUT local bypass; effective capacitance, latch and recovery behavior require EVT."
with bom_path.open("w", newline="") as stream:
    writer = csv.DictWriter(stream, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(rows)

print(json.dumps({"status": "ADOPTED_TPS2552_LATCH_CAD_PHYSICAL_EVT_HOLD", "design_parts": len(design["parts"]), "bom_rows": len(rows)}))
