import pcbnew,json,wx,hashlib
from pathlib import Path
app=wx.App(False)
root=Path(__file__).resolve().parents[2]
pcb=root/'hardware/xe-minimal/pendant-xe-minimal.kicad_pcb'
demand_path=root/'docs/procurement/prototype-v1-five-unit-installed-demand.json'
demand=json.loads(demand_path.read_text())
refs={ref.strip():line['mpn'] for line in demand['lines'] if line['route'].startswith('JLC_') for ref in line['references'].split(',') if ref.strip()}
b=pcbnew.LoadBoard(str(pcb))
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
assert len(rows)==68 and set(refs)=={r['ref'] for r in rows}
out=dict(status='CAD_PAD_COUNTS_NOT_SUPPLIER_JOINT_CLASSIFICATION',rows=rows,totals={k:sum(r[k] for r in rows) for k in counts},unique_mpns=len(set(refs.values())),unique_mpn_side_pairs=len({(r['mpn'],r['side']) for r in rows}))
out['board_sha256']=hashlib.sha256(pcb.read_bytes()).hexdigest()
out['installed_demand_sha256']=hashlib.sha256(demand_path.read_bytes()).hexdigest()
(root/'docs/procurement/xe-current-assembly-pad-counts.json').write_text(json.dumps(out,indent=2)+'\n')
print({k:v for k,v in out.items() if k!='rows'})
