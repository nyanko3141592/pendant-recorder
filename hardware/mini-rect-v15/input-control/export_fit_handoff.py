"""Actual-board body estimates, preserving model limitations per component."""
import wx,pcbnew as k,json,hashlib,sys
from pathlib import Path
app=wx.App(False);P=Path(__file__).resolve().parent
src=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else P/'xe-terminal-candidate.kicad_pcb';b=k.LoadBoard(str(src));old={p['ref']:p for p in json.loads((P.parents[1]/'mini-rect-v13/usb-ground-plane-candidate.mechanical-handoff.json').read_text())['parts']}
cap_candidates={r['reference']:r for r in json.loads((P.parents[2]/'docs/procurement/v15-capacitor-candidates.json').read_text())['entries']}
rows=[]
for f in b.GetFootprints():
 ref=f.GetReference()
 if ref in ['J2','TH1'] or ref not in old:
  shapes=[x.GetBoundingBox() for x in f.GraphicalItems() if isinstance(x,k.PCB_SHAPE) and x.GetLayerName() in ['F.Fab','B.Fab']]
  q=shapes[0]
  for a in shapes[1:]:q.Merge(a)
  row=dict(ref=ref,x_mm=k.ToMM(q.GetX()+q.GetWidth()/2),y_mm=k.ToMM(q.GetY()+q.GetHeight()/2),w_mm=k.ToMM(q.GetWidth()),d_mm=k.ToMM(q.GetHeight()),height_mm=1.55 if ref=='J2' else 1.1 if ref=='U14' else 1.45 if ref.startswith(('U','Q')) else .6,height_basis='Molex drawing781710000-SD RevA sheet2 gives REFERENCE mated height(1.55), not a guaranteed maximum; Fab rectangle is header only; mated exit/overhang/tolerance pending' if ref=='J2' else 'TI DYY0014A maximum1.1mm' if ref=='U14' else 'provisional1.45mmSOT or0.6mmpassive envelope; exactpart maximum pending')
 else:
  row=dict(old[ref]);row['x_mm']+=k.ToMM(f.GetPosition().x)-row['origin_x_mm'];row['y_mm']+=k.ToMM(f.GetPosition().y)-row['origin_y_mm']
 if ref in cap_candidates:
  cap=cap_candidates[ref]
  row['height_mm']=max(row['height_mm'],cap['max_body_height_mm'])
  row['height_basis']='Envelope includes manufacturer maximum height for candidate '+cap['mpn']+'; other qualification pending'
 row.update(origin_x_mm=k.ToMM(f.GetPosition().x),origin_y_mm=k.ToMM(f.GetPosition().y),rotation_deg=f.GetOrientationDegrees(),side='B' if f.IsFlipped() else 'F');rows.append(row)
edges=[a for a in b.GetDrawings() if a.GetLayer()==k.Edge_Cuts]
assert all(a.GetShape()==k.SHAPE_T_SEGMENT for a in edges), 'Only straight board edges supported'
points=[p for a in edges for p in [a.GetStart(),a.GetEnd()]]
width=k.ToMM(max(p.x for p in points)-min(p.x for p in points));height=k.ToMM(max(p.y for p in points)-min(p.y for p in points))
holes=[dict(ref=f.GetReference(),x_mm=k.ToMM(p.GetPosition().x),y_mm=k.ToMM(p.GetPosition().y),diameter_mm=k.ToMM(p.GetDrillSize().x)) for f in b.GetFootprints() for p in f.Pads() if p.GetAttribute()==k.PAD_ATTRIB_NPTH and p.GetDrillSize().x==p.GetDrillSize().y]
r=dict(round_npth_holes=holes,source_board=str(src),source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),board_mm=[width,height,.93],pcb_thickness_basis='conservative prior6layer maximum0.93mm; nominal0.8mm',parts=rows,limitations=['retained V13 rectangular envelopes, not manufacturer-solid accuracy','XE mated housing overhang, insertion sweep and harness not included','No assembly release'])
src.with_suffix('.mechanical-handoff.json').write_text(json.dumps(r,indent=2)+'\n');print([r for r in rows if r['ref'] in ['J2','TH1']])
