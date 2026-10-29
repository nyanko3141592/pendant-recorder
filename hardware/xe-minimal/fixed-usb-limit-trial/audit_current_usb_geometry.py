"""Extract routed USB geometry; parallel overlap screening is not impedance analysis."""
from pathlib import Path
import pcbnew as k,wx,hashlib,json,math
from collections import defaultdict
app=wx.App(False);O=Path(__file__).resolve().parent;p=O/'r44-capped-trial/pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(p))
def xy(q):return [k.ToMM(q.x),k.ToMM(q.y)]
tracks={};summary={}
for net in ['/USB_DP','/USB_DM']:
 rows=[];lengths=defaultdict(float);vias=[]
 for t in b.GetTracks():
  if t.GetNetname()!=net:continue
  if isinstance(t,k.PCB_VIA):vias.append({'xy_mm':xy(t.GetPosition()),'diameter_mm':k.ToMM(t.GetWidth(k.F_Cu)),'drill_mm':k.ToMM(t.GetDrillValue())});continue
  a,z=xy(t.GetStart()),xy(t.GetEnd());length=math.dist(a,z);layer=b.GetLayerName(t.GetLayer());w=k.ToMM(t.GetWidth());lengths[(layer,w)]+=length
  rows.append({'uuid':t.m_Uuid.AsString(),'layer':layer,'width_mm':w,'start_mm':a,'end_mm':z,'length_mm':length})
 tracks[net]=rows;summary[net]={'total_segment_length_mm':sum(t['length_mm'] for t in rows),'length_by_layer_width':[{'layer':l,'width_mm':w,'length_mm':v} for (l,w),v in sorted(lengths.items())],'vias':vias}
pairs=[]
for a in tracks['/USB_DP']:
 for z in tracks['/USB_DM']:
  if a['layer']!=z['layer'] or min(a['length_mm'],z['length_mm'])<1e-8:continue
  ax,ay=a['start_mm'];ux=(a['end_mm'][0]-ax)/a['length_mm'];uy=(a['end_mm'][1]-ay)/a['length_mm']
  vx=(z['end_mm'][0]-z['start_mm'][0])/z['length_mm'];vy=(z['end_mm'][1]-z['start_mm'][1])/z['length_mm']
  if abs(ux*vy-uy*vx)>1e-5:continue
  projection=sorted((q[0]-ax)*ux+(q[1]-ay)*uy for q in [z['start_mm'],z['end_mm']]);overlap=min(a['length_mm'],projection[1])-max(0,projection[0])
  gap=abs((z['start_mm'][0]-ax)*uy-(z['start_mm'][1]-ay)*ux)-(a['width_mm']+z['width_mm'])/2
  if overlap>1e-5 and gap<.5:pairs.append({'dp_uuid':a['uuid'],'dm_uuid':z['uuid'],'layer':a['layer'],'parallel_overlap_mm':overlap,'edge_gap_mm':gap,'widths_mm':[a['width_mm'],z['width_mm']]})
r={'status':'ROUTED_GEOMETRY_EXTRACTED_NOT_SI_QUALIFIED','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'summary':summary,'parallel_segment_pairs':pairs,'tracks':tracks,'limitations':['Segment length sum includes branches and stubs; difference is not electrical skew','Pair overlap can count nearby unrelated parallel segments; no automatic coupling acceptance','Vias, pads, component package paths and reference-plane interruptions not solved','Uses straight segment endpoints; inspect any arcs separately']}
(O/'current-usb-geometry-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(summary,indent=2));print('parallel gaps:',sorted(set(round(q['edge_gap_mm'],6)for q in pairs)))
