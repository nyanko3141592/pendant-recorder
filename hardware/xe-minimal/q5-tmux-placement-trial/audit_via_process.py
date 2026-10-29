from pathlib import Path
import pcbnew as k,wx,json,collections,hashlib
app=wx.App(False);r=Path('/Users/takahashinaoki/Dev/pendant-recorder');d=r/'hardware/xe-minimal/q5-tmux-placement-trial'
def audit(p):
 b=k.LoadBoard(str(p));rows=[]
 for t in b.GetTracks():
  if not isinstance(t,k.PCB_VIA):continue
  drill=k.ToMM(t.GetDrillValue());width=k.ToMM(t.GetWidth(k.F_Cu));rows.append({'uuid':t.m_Uuid.AsString(),'xy_mm':list(k.ToMM(t.GetPosition())),'net':t.GetNetname(),'diameter_mm':width,'drill_mm':drill,'nominal_annular_mm':round((width-drill)/2,6)})
 return rows
old=audit(r/'hardware/xe-minimal/pendant-xe-minimal.kicad_pcb');new=audit(d/'ti-registered.kicad_pcb');ids={v['uuid'] for v in old};newids={v['uuid'] for v in new};rules=json.loads((d/'ti-registered.kicad_pro').read_text())['board']['design_settings']['rules'];v={'status':'CAD_DIMENSIONS_CHECKED_PROCESS_ACCEPTANCE_NOT_PROVEN','candidate_sha256':hashlib.sha256((d/'ti-registered.kicad_pcb').read_bytes()).hexdigest(),'canonical_via_count':len(old),'candidate_via_count':len(new),'added':[v for v in new if v['uuid'] not in ids],'removed':[v for v in old if v['uuid'] not in newids],'candidate_histogram':dict(collections.Counter(str((v['diameter_mm'],v['drill_mm'],v['nominal_annular_mm'])) for v in new)),'cad_minimums':{key:rules[key] for key in ['min_via_annular_width','min_via_diameter','min_through_hole_diameter','min_hole_clearance'] if key in rules},'minimum_nominal_annular_mm':min(v['nominal_annular_mm'] for v in new),'limits':['Nominal annular ring is geometric only; drill registration, finished hole size and plating tolerance not included','Existing rule minimum is not supplier process acceptance','Candidate has not been exported into canonical production package']};(d/'via-process-comparison.json').write_text(json.dumps(v,indent=2)+'\n');print(json.dumps(v,indent=2))
