import pcbnew,json,wx,hashlib
from pathlib import Path
app=wx.App(False)
root=Path(__file__).resolve().parents[2]
qty=json.loads((root/'docs/procurement/v15-five-unit-quantity-review.json').read_text())
refs={r:line['candidate_mpn'] for line in qty['lines'] for r in line['references']}
b=pcbnew.LoadBoard(str(root/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.kicad_pcb'))
rows=[]
for f in b.GetFootprints():
 ref=f.GetReference()
 if ref not in refs:continue
 counts={'smd_pads':0,'plated_through_pads':0,'other_pads':0}
 for p in f.Pads():
  attr=p.GetAttribute()
  k='smd_pads' if attr==pcbnew.PAD_ATTRIB_SMD else 'plated_through_pads' if attr==pcbnew.PAD_ATTRIB_PTH else 'other_pads'
  counts[k]+=1
 rows.append(dict(ref=ref,mpn=refs[ref],side='B' if f.IsFlipped() else 'F',**counts))
assert len(rows)==85
out=dict(status='CAD_PAD_COUNTS_NOT_SUPPLIER_JOINT_CLASSIFICATION',rows=rows,totals={k:sum(r[k] for r in rows) for k in counts},unique_mpns=len(set(refs.values())),unique_mpn_side_pairs=len({(r['mpn'],r['side']) for r in rows}))
out['board_sha256']=hashlib.sha256((root/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.kicad_pcb').read_bytes()).hexdigest()
(root/'docs/procurement/v15-assembly-pad-counts.json').write_text(json.dumps(out,indent=2)+'\n')
print({k:v for k,v in out.items() if k!='rows'})
