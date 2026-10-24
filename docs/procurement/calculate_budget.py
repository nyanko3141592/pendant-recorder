#!/usr/bin/env python3
"""Reproduce budget allowances; these are not vendor quotes."""
import json
from pathlib import Path
b = json.loads(Path(__file__).with_name('budget.json').read_text())
print(b['status'], 'quantity:', b['quantity'], 'currency:', b['currency'])
all_totals = [0, 0]
for group in ('build', 'tools'):
    totals = [sum(r[k] for r in b[group]) for k in ('low', 'high')]
    all_totals = [a + v for a, v in zip(all_totals, totals)]
    print(group, *totals)
print('initial total', *all_totals)
print('excluded:', ', '.join(b['excluded']))
