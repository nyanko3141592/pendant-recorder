"""Check the placed socket against the independently reviewed land coordinates."""
from pathlib import Path
import hashlib, json
import wx
import pcbnew as k
app=wx.App(False)
P=Path(__file__).resolve().parent
board=P/'power-width-candidate.kicad_pcb'
review=json.loads((P/'socket-land-verification.json').read_text())
b=k.LoadBoard(str(board))
f=next(f for f in b.GetFootprints() if f.GetReference()=='J4')
assert not f.IsFlipped(), 'Review transformation for back-side socket explicitly'
expected=review['signal_and_detection_pads']
rows=[];shell=[]
for p in f.Pads():
 q=p.GetFPRelativePosition();s=p.GetSize()
 values=[round(k.ToMM(v),4) for v in (q.x,q.y,s.x,s.y)]
 n=p.GetNumber()
 if n=='SH':
  shell.append(values)
  assert p.GetNetname()=='/GND'
 else:
  assert values==expected[n],(n,values,expected[n])
  if n in ('9','10'):assert not p.GetNetname(),(n,p.GetNetname())
 rows.append({'pad':n,'local_xy_size_mm':values,'net':p.GetNetname()})
assert sorted(shell)==sorted(review['shell_pads'])
assert len(rows)==14
r={'status':'PLACED_LANDS_MATCH_REVIEWED_DRAWING','board_sha256':hashlib.sha256(board.read_bytes()).hexdigest(),'drawing_sha256':review['drawing_sha256'],'pads':rows,'catalog_evidence':{'file':'reference/hirose-dm3-catalog.pdf','sha256':hashlib.sha256((P/'reference/hirose-dm3-catalog.pdf').read_bytes()).hexdigest(),'printed_page':9,'part':'DM3D-SF','hrs_no':'609-0025-8','switch':'Open without card, closed with card'},'resolution':'JLC catalog no-detection-pins attribute conflicts with manufacturer catalog. Design intentionally leaves both detection contacts unconnected; no functional dependency on the switch. Manufacturer land geometry is the reference.','limitations':['Exact supplied revision, assembly rotation and stock not confirmed','Does not verify solder mask/paste or socket/card tolerance','Does not qualify storage power or release the board']}
(P/'procurement-review/placed-socket-verification.json').write_text(json.dumps(r,indent=2)+'\n')
print('PASS: all 14 placed pads match reviewed geometry; detection contacts NC; shell GND')
