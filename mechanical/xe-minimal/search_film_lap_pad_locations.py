"""Local dedicated pad location screen; no board edit or route guarantee."""
from pathlib import Path
import wx,pcbnew,json,hashlib,math,argparse
parser=argparse.ArgumentParser();parser.add_argument("--allow-track-reroute",action="store_true");args=parser.parse_args()
app=wx.App(False);O=Path(__file__).resolve().parent;root=O.parents[1];p=root/'hardware/xe-minimal/fixed-usb-limit-trial/ncu-sensor-trial/pendant-xe-minimal.kicad_pcb';b=pcbnew.LoadBoard(str(p));L=pcbnew.B_Cu
items=[(f.GetReference()+'.'+q.GetNumber(),q,q.GetEffectiveShape(L))for f in b.GetFootprints()if f.GetReference()!='TH1' for q in f.Pads()if q.IsOnLayer(L)]
items += [('track:'+str(i),q,q.GetEffectiveShape(L))for i,q in enumerate(b.GetTracks())if q.IsOnLayer(L)]
# Stored pours can be refilled after new pad placement; report them separately.
zones=[('zone:'+str(i),q,q.GetFilledPolysList(L))for i,q in enumerate(b.Zones())if q.IsOnLayer(L)]
original={'/BAT_TS':[16.13,1.055],'/GND':[14.48,1.055]};found={};count=0
for net in original:
 candidates=[]
 for size in [(.8,1.8),(1.8,.8)]:
  for ix in range(48,93):
   for iy in range(4,21):
    x,y=ix*.25,iy*.25;w,h=size
    if x+w/2>23.6 or y-h/2<.4:continue
    count+=1;rect=pcbnew.SHAPE_RECT(pcbnew.FromMM(x-w/2),pcbnew.FromMM(y-h/2),pcbnew.FromMM(w),pcbnew.FromMM(h))
    collisions=[(name,item)for name,item,shape in items if (not name.startswith('track:') or item.GetNetname()!=net) and rect.Collide(shape,pcbnew.FromMM(.2))]
    if collisions and (not args.allow_track_reroute or any(not name.startswith('track:') or isinstance(item,pcbnew.PCB_VIA) for name,item in collisions)):continue
    reroute=[{'item':name,'net':item.GetNetname(),'uuid':item.m_Uuid.AsString()}for name,item in collisions]
    candidates.append({'tracks_to_reroute':reroute,'net':net,'pcb_center_mm':[x,y],'size_mm':list(size),'distance_from_old_pad_mm':math.dist([x,y],original[net]),'existing_other_net_zones_to_refill':[name for name,item,shape in zones if (not name.startswith('track:') or item.GetNetname()!=net) and rect.Collide(shape,pcbnew.FromMM(.2))]})
 found[net]=sorted(candidates,key=lambda c:c['distance_from_old_pad_mm'])
pairs=[]
for a in found['/BAT_TS']:
 for c in found['/GND']:
  ax,ay=a['pcb_center_mm'];bx,by=c['pcb_center_mm'];dx=max(0,abs(ax-bx)-(a['size_mm'][0]+c['size_mm'][0])/2);dy=max(0,abs(ay-by)-(a['size_mm'][1]+c['size_mm'][1])/2)
  if math.hypot(dx,dy)<.3:continue
  pairs.append({'pads':[a,c],'sum_displacement_mm':a['distance_from_old_pad_mm']+c['distance_from_old_pad_mm'],'pad_edge_distance_mm':math.hypot(dx,dy)})
pairs.sort(key=lambda c:(len({t['uuid']for p in c['pads']for t in p['tracks_to_reroute']}),c['sum_displacement_mm']))
diverse=[];seen=set()
for pair in pairs:
 key=tuple(pair['pads'][0]['pcb_center_mm']+pair['pads'][0]['size_mm'])
 if key not in seen:diverse.append(pair);seen.add(key)
r={'status':'LOCAL_LAP_PAD_LOCATION_SCREEN_NOT_ROUTED_OR_ADOPTED','pcb_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'allow_track_reroute':args.allow_track_reroute,'tested_rectangles':count,'clear_candidates_per_net':{k:len(v)for k,v in found.items()},'best_pairs':pairs[:12],'distinct_signal_pad_pairs':diverse,'limits':['Current non-TH1 pads/vias checked at trial 0.2 mm clearance; colliding track segments are allowed only in the explicit reroute study and listed by UUID.','Old TH1 pads assumed removed; existing attached tracks remain obstacles except same net.','Stored zone fills excluded from rejection and listed for subsequent refill.','Rectangular x/y bounds are only a coarse edge screen; actual outline, courtyards, mask and 3D bodies not verified.','Candidate size provides packaging space only; solder process and strain relief not qualified.','A new pad location needs a real routed connection and source schematic/footprint updates.']};(O/('film-lap-pad-reroute-locations-review.json'if args.allow_track_reroute else 'film-lap-pad-locations-review.json')).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'counts':r['clear_candidates_per_net'],'best':pairs[:2]},indent=2))
