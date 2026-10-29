"""Local offset feasibility from existing filled references, not a routed pair."""
from pathlib import Path
import pcbnew as k,wx,json,math,hashlib,argparse
aarg=argparse.ArgumentParser();aarg.add_argument("--steps",type=int,default=30);args=aarg.parse_args()
app=wx.App(False);O=Path(__file__).resolve().parent;P=O/'usb-pair-far-extension-trial/pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(P));polys={layer:[z.GetFilledPolysList(layer)for z in b.Zones()if z.GetNetname()=='/GND'and z.IsOnLayer(layer)]for layer in [k.In1_Cu,k.In3_Cu]}
a=(15.5,15.5);c=(19.525,10.325);dx,dy=c[0]-a[0],c[1]-a[1];length=math.hypot(dx,dy);normal=(-dy/length,dx/length);n=math.ceil(length/.05);shifts=[i*.025 for i in range(-args.steps,args.steps+1)];rows=[]
for j in range(n+1):
 f=j/n;valid=[]
 for shift in shifts:
  good=True
  for so in [0,.237]:
   for side in [-.16,0,.16]:
    v=k.VECTOR2I(k.FromMM(a[0]+dx*f+normal[0]*(shift+so+side)),k.FromMM(a[1]+dy*f+normal[1]*(shift+so+side)))
    if not all(any(poly.Contains(v)for poly in pp)for pp in polys.values()):good=False;break
   if not good:break
  if good:valid.append(shift)
 rows.append({'distance_mm':f*length,'fraction':f,'valid_shifts_mm':valid})
# Dynamic program limits transverse step to .05mm per <=.05mm longitudinal step.
cost={0:(0,[])}
for row in rows:
 nxt={}
 for shift in row['valid_shifts_mm']:
  choices=[(v[0]+abs(shift)*.01+abs(shift-old),v[1]+[shift])for old,v in cost.items()if abs(shift-old)<=.050001]
  if choices:nxt[shift]=min(choices,key=lambda x:x[0])
 cost=nxt
 if not cost:break
solution=cost.get(0)
r={'status':'LOCAL_REFERENCE_CORRIDOR_SCREEN_ONLY','pcb_sha256':hashlib.sha256(P.read_bytes()).hexdigest(),'stations':rows,'zero_solution_stations':[x['distance_mm']for x in rows if not x['valid_shifts_mm']],'bounded_step_path_found':solution is not None,'path_shifts_mm':solution[1]if solution else None,'limits':['Existing fill only, no DRC or same-layer obstacles','Offsets use original straight normal; bends require true offset pair construction and recalculation','Three lateral samples per trace are not continuous coverage or impedance proof','Step bound is a search constraint, not a USB routing rule']};(O/('usb-local-corridor-screen-'+str(args.steps)+'.json')).write_text(json.dumps(r,indent=2)+'\n');print('empty stations',r['zero_solution_stations']);print('path',r['bounded_step_path_found']);print('range', [min(solution[1]),max(solution[1])]if solution else None)
