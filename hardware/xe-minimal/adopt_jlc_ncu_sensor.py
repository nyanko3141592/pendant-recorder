#!/usr/bin/env python3
"""Adopt the assembler-stock 0603 NTC without changing electrical thresholds."""
from pathlib import Path
import json, subprocess
import pcbnew as k, wx

root = Path(__file__).resolve().parent
design_path = root / 'design.json'
data = json.loads(design_path.read_text())
parts = {p['ref']: p for p in data['parts']}
th = parts['TH1']
th['value'] = 'NCU18XH103F60RB 10k 1% B3380'
th['note'] = (
    'Murata NCU18XH103F60RB, JLC C440252, board-mounted 0603 NTC. '
    'Existing 7.5k..20k resistance window corresponds nominally to about '
    '32.8C hot and 7.8C cold for B3380. Case must provide passive, insulated '
    'cell-to-sensor thermal contact; lag/contact and tolerance require EVT.'
)
th['assembly_status'] = 'JLC_C440252_LISTED_STOCK_NOT_RESERVED'
parts['U12']['note'] = (
    'TLV7042 open-drain wired-AND temperature permission. Either fault pulls '
    'Q4 gate low. Threshold network is retained for NCU18XH103F60RB B3380; '
    'electrical tolerance, startup and installed thermal lag require EVT.'
)
design_path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + '\n')

app = wx.App(False)
board_path = root / 'pendant-xe-minimal.kicad_pcb'
board = k.LoadBoard(str(board_path))
fp = board.FindFootprintByReference('TH1')
assert fp and fp.GetFPID().GetLibItemName() == 'R_0603_1608Metric'
fp.SetValue(th['value'])
k.SaveBoard(str(board_path), board)

python = '/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3'
subprocess.run([python, str(root / 'generate_schematic.py'), 'xe-minimal', str(root)], check=True)
