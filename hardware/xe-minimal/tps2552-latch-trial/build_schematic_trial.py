#!/usr/bin/env python3
"""Build a non-canonical schematic matching the TPS2552 latch-off PCB trial."""

from pathlib import Path
import shutil

HERE = Path(__file__).resolve().parent
PARENT = HERE.parent
SOURCE_SCH = PARENT / "pendant-xe-minimal.kicad_sch"
SOURCE_SYM = PARENT / "Pendant.kicad_sym"
OUTPUT_SCH = HERE / "pendant-xe-tps2552-latch-trial.kicad_sch"
OUTPUT_SYM = HERE / "Pendant.kicad_sym"

old_symbol = '''(symbol "Part_U13" (pin_names (offset 1.016)) (in_bom yes) (on_board yes)
 (property "Reference" "U" (at 0 12.7 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "TPS22950CDDCR" (at 0 10.16 0) (effects (font (size 1.27 1.27)) ))
 (symbol "Part_U13_0_1" (rectangle (start -33.02 7.62) (end 33.02 -7.62) (stroke (width .254) (type default)) (fill (type background))))
 (symbol "Part_U13_1_1" (pin passive line (at -38.1 3.81 0) (length 5.08) (name "VOUT" (effects (font (size 1 1)) )) (number "5" (effects (font (size .9 .9)) )))(pin power_in line (at -38.1 0 0) (length 5.08) (name "GND" (effects (font (size 1 1)) )) (number "3" (effects (font (size .9 .9)) )))(pin input line (at -38.1 -3.81 0) (length 5.08) (name "ILIM" (effects (font (size 1 1)) )) (number "4" (effects (font (size .9 .9)) )))(pin input line (at 38.1 3.81 180) (length 5.08) (name "ON" (effects (font (size 1 1)) )) (number "1" (effects (font (size .9 .9)) )))(pin power_in line (at 38.1 0 180) (length 5.08) (name "VIN" (effects (font (size 1 1)) )) (number "2" (effects (font (size .9 .9)) )))(pin open_collector line (at 38.1 -3.81 180) (length 5.08) (name "FLT" (effects (font (size 1 1)) )) (number "6" (effects (font (size .9 .9)) )))))'''

new_symbol = '''(symbol "Part_U13" (pin_names (offset 1.016)) (in_bom yes) (on_board yes)
 (property "Reference" "U" (at 0 12.7 0) (effects (font (size 1.27 1.27)) ))
 (property "Value" "TPS2552DBVR-1" (at 0 10.16 0) (effects (font (size 1.27 1.27)) ))
 (symbol "Part_U13_0_1" (rectangle (start -33.02 7.62) (end 33.02 -7.62) (stroke (width .254) (type default)) (fill (type background))))
 (symbol "Part_U13_1_1" (pin passive line (at -38.1 3.81 0) (length 5.08) (name "OUT" (effects (font (size 1 1)) )) (number "6" (effects (font (size .9 .9)) )))(pin power_in line (at -38.1 0 0) (length 5.08) (name "GND" (effects (font (size 1 1)) )) (number "2" (effects (font (size .9 .9)) )))(pin passive line (at -38.1 -3.81 0) (length 5.08) (name "ILIM" (effects (font (size 1 1)) )) (number "5" (effects (font (size .9 .9)) )))(pin input line (at 38.1 3.81 180) (length 5.08) (name "EN" (effects (font (size 1 1)) )) (number "3" (effects (font (size .9 .9)) )))(pin power_in line (at 38.1 0 180) (length 5.08) (name "IN" (effects (font (size 1 1)) )) (number "1" (effects (font (size .9 .9)) )))(pin open_collector line (at 38.1 -3.81 180) (length 5.08) (name "FAULT" (effects (font (size 1 1)) )) (number "4" (effects (font (size .9 .9)) )))))'''


def remove_balanced(text: str, start: int) -> str:
    depth = 0
    quoted = False
    escaped = False
    for index in range(start, len(text)):
        char = text[index]
        if quoted:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                quoted = False
            continue
        if char == '"':
            quoted = True
        elif char == "(":
            depth += 1
        elif char == ")":
            depth -= 1
            if depth == 0:
                return text[:start] + text[index + 1:]
    raise AssertionError("unterminated s-expression")


def remove_object_with_uuid(text: str, kind: str, uuid: str) -> str:
    marker = f"(uuid {uuid})"
    position = text.index(marker)
    start = text.rfind(f"({kind} ", 0, position)
    assert start >= 0
    return remove_balanced(text, start)


def transform(text: str) -> str:
    source_symbol = old_symbol
    replacement_symbol = new_symbol
    if text.count(source_symbol) != 1:
        source_symbol = old_symbol.replace('(symbol "Part_U13"', '(symbol "Pendant:Part_U13"', 1)
        replacement_symbol = new_symbol.replace('(symbol "Part_U13"', '(symbol "Pendant:Part_U13"', 1)
    assert text.count(source_symbol) == 1
    text = text.replace(source_symbol, replacement_symbol)
    marker = '(symbol (lib_id "Pendant:Part_R51") (at 426.72 561.3400000000001 0)'
    if marker in text:
        text = text.replace('(property "Value" "TPS22950CDDCR" (at 1099.82 689.61 0)', '(property "Value" "TPS2552DBVR-1" (at 1099.82 689.61 0)', 1)
        text = text.replace('(label "USB_ILIM_SET" (at 1054.1 703.58 0)', '(label "VBUS_OVP" (at 1054.1 703.58 0)', 1)
        text = text.replace('(label "VBUS_OVP" (at 1145.54 695.96 0)', '(label "GND" (at 1145.54 695.96 0)', 1)
        for kind, uuid in (
            ("wire", "bf11dec7-feba-5ecc-b969-b5a6497284f7"),
            ("label", "b13c6375-149f-5b2c-af0d-ca302f41fb70"),
            ("wire", "52b79845-99e2-577e-acdb-62dd885f4219"),
            ("label", "5c353bbd-624c-5e78-9e3b-bee4dc2510e1"),
        ):
            text = remove_object_with_uuid(text, kind, uuid)
        text = remove_balanced(text, text.index(marker))
    return text


OUTPUT_SCH.write_text(transform(SOURCE_SCH.read_text()))
OUTPUT_SYM.write_text(transform(SOURCE_SYM.read_text()))
shutil.copyfile(PARENT / "fp-lib-table", HERE / "fp-lib-table")
shutil.copyfile(PARENT / "sym-lib-table", HERE / "sym-lib-table")
print(OUTPUT_SCH)
