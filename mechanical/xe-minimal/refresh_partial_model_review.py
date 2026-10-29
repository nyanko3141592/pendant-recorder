import pcbnew as k,wx,json,hashlib
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;pcb=O.parent.parent/'hardware/xe-minimal/pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(pcb));root='/Applications/KiCad/KiCad.app/Contents/SharedSupport/3dmodels';models=[]
for f in sorted(b.GetFootprints(),key=lambda f:f.GetReference()):
 entries=[{'reference':m.m_Filename,'exists':Path(m.m_Filename.replace('${KICAD10_3DMODEL_DIR}',root)).exists()} for m in f.Models()]
 models.append({'ref':f.GetReference(),'value':f.GetValue(),'models':entries,'has_resolvable_model':any(x['exists'] for x in entries),'manufacturer_geometry_verified':False,'component_body_required':f.GetReference() not in ['J3'] and not f.GetReference().startswith('TP')})
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
r={'status':'PARTIAL_GEOMETRY_ONLY_NOT_ASSEMBLY_APPROVAL','pcb_sha256':h(pcb),'step_sha256':h(O/'pcb-partial-components.step'),'models':models,'missing_required_bodies':[x['ref'] for x in models if x['component_body_required'] and not x['has_resolvable_model']],'limitations':['Library body geometry is not manufacturer verified.','Battery, intact leads, housing, insulation, retention and assembly clearance are not included.','Missing component bodies prevent complete enclosure fit approval.']}
(O/'model-coverage.json').write_text(json.dumps(r,indent=2)+'\n');print(r['missing_required_bodies'])
