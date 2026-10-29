import pcbnew as k,wx,json,hashlib
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;f=O.parents[1]/'hardware/xe-minimal/pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(f));q=O/'pcb-support-screen.json';r=json.loads(q.read_text());assert r['pcb_sha256']==hashlib.sha256(f.read_bytes()).hexdigest();rows=[]
for c in r['candidate_sites']:
 x0,x1,y0,y1=c['bearing_rect_board_xy_mm'];hits=[]
 for fp in b.GetFootprints():
  for p in fp.Pads():
   z=p.GetBoundingBox();a=[k.ToMM(z.GetX())-.2,k.ToMM(z.GetRight())+.2,k.ToMM(z.GetY())-.2,k.ToMM(z.GetBottom())+.2]
   if x0<a[1] and x1>a[0] and y0<a[3] and y1>a[2]:hits.append(fp.GetReference()+':'+p.GetNumber())
 if not hits:rows.append(c)
out={'status':'ROTATED_PAD_BOUNDING_BOX_SCREEN_NOT_FINAL_CLIP_DESIGN','pcb_sha256':r['pcb_sha256'],'source_screen_sha256':hashlib.sha256(q.read_bytes()).hexdigest(),'candidates':rows,'count_before':len(r['candidate_sites']),'count_after':len(rows),'method':'Actual KiCad pad bounding box including rotation, expanded0.2mm. Also retains component body screen from source.','limitations':['No solder fillets, board tolerance or clip insertion sweep','Final support solids require assembly collision check']};(O/'pcb-support-pad-review.json').write_text(json.dumps(out,indent=2)+'\n');print(out['count_before'],out['count_after']);print([(x['side'],x['center_along_edge_mm']) for x in rows])
