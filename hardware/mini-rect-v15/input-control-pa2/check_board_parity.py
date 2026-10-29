"""Explicit design-json versus PCB pad-net parity, including NC and duplicate IDs."""
import json,sys,hashlib
from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;path=Path(sys.argv[1]);b=k.LoadBoard(str(path))
d=json.loads((P/'design.json').read_text());fs={f.GetReference():f for f in b.GetFootprints()}
issues=[];expected={p['ref'] for p in d['parts']}
if set(fs)!=expected:issues.append(dict(reference_difference=sorted(set(fs)^expected)))
checked=0
for part in d['parts']:
 f=fs.get(part['ref'])
 if f is None:continue
 if f.GetValue()!=part['value']:issues.append(dict(ref=part['ref'],expected_value=part['value'],actual_value=f.GetValue()))
 actual_fp=str(f.GetFPID().GetLibNickname())+':'+str(f.GetFPID().GetLibItemName())
 if actual_fp!=part['footprint']:issues.append(dict(ref=part['ref'],expected_footprint=part['footprint'],actual_footprint=actual_fp))
 for pin in part['pins']:
  pads=[p for p in f.Pads() if p.GetNumber()==pin['number']]
  if not pads:issues.append(dict(ref=part['ref'],missing_pin=pin['number']))
  for pad in pads:
   actual=pad.GetNetname().lstrip('/') or None
   if actual!=pin['net']:issues.append(dict(ref=part['ref'],pin=pin['number'],expected=pin['net'],actual=actual))
   checked+=1
 ids={p['number'] for p in part['pins']}
 for pad in f.Pads():
  if pad.GetNumber() not in ids and pad.GetNetname():issues.append(dict(ref=part['ref'],unexpected_connected_pad=pad.GetNumber(),net=pad.GetNetname()))
uuids=[f.m_Uuid.AsString() for f in b.GetFootprints()]+[p.m_Uuid.AsString() for f in b.GetFootprints() for p in f.Pads()]
if len(uuids)!=len(set(uuids)):issues.append('Duplicate footprint or pad UUID')
r=dict(status='PASS' if not issues else 'FAIL',checked_pads=checked,issues=issues,source_design_sha256=hashlib.sha256((P/'design.json').read_bytes()).hexdigest(),board_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),scope='Values, footprint identifiers and pad-net parity with design source; does not prove routed connectivity or correctness of design source')
path.with_suffix('.parity.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2));assert not issues
