from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);D=Path(__file__).resolve().parent;O=D/'pdm-stitch-trial';p=O/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p));old=k.LoadBoard(str(D/'led-land-trial/pendant-xe-minimal.kicad_pcb'))
a={t.m_Uuid.AsString()for t in old.GetTracks()};new=[t for t in b.GetTracks()if t.m_Uuid.AsString()not in a];assert len(new)==1
v=new[0];assert isinstance(v,k.PCB_VIA) and v.GetNetname()=='/GND'
checks={}
for layer in [k.In1_Cu,k.In3_Cu]:
 zones=[q for q in b.Zones() if q.GetLayer()==layer and q.GetNetname()=='/GND'];assert len(zones)==1
 polys=zones[0].GetFilledPolysList(layer);outline=polys.Contains(v.GetPosition())
 checks[b.GetLayerName(layer)]={'center_in_filled_ground':bool(outline),'nearby_copper_samples':[]}
 for dx,dy in [(-.16,0),(.16,0),(0,-.16),(0,.16)]:
  pt=k.VECTOR2I(v.GetPosition().x+k.FromMM(dx),v.GetPosition().y+k.FromMM(dy));checks[b.GetLayerName(layer)]['nearby_copper_samples'].append(bool(polys.Contains(pt)))
 assert outline and all(checks[b.GetLayerName(layer)]['nearby_copper_samples'])
r={'pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'added_via_uuid':v.m_Uuid.AsString(),'net':v.GetNetname(),'plane_contact_samples':checks,'status':'FILLED_COPPER_CONTACT_SAMPLES_PASS','limits':['Samples are not continuous contact-area or impedance verification','Ground return path effectiveness remains unqualified','New via manufacturing cost/process not yet integrated']};(O/'connection-review.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
