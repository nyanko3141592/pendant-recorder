from pathlib import Path
import pcbnew as k,wx,json,math,hashlib,argparse
arg=argparse.ArgumentParser();arg.add_argument("--half-width",type=float,default=.16);arg.add_argument("--output",default="usb-corridor-screen.json");arg.add_argument("--board-directory",default="usb-pair-far-extension-trial");args=arg.parse_args()
app=wx.App(False);O=Path(__file__).resolve().parent;P=O/args.board_directory/'pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(P));polys={layer:[z.GetFilledPolysList(layer) for z in b.Zones() if z.GetNetname()=='/GND'and z.IsOnLayer(layer)]for layer in [k.In1_Cu,k.In3_Cu]}
a=(15.5,15.5);c=(19.525,10.325);dx,dy=c[0]-a[0],c[1]-a[1];length=math.hypot(dx,dy);normal=(-dy/length,dx/length);n=math.ceil(length/.025);rows=[]
for j in range(-30,31):
 shift=j*.025;missing=0;checks=0;points=[]
 for signal_offset in [0,.237]:
  endpoints=[]
  for end in [a,c]:endpoints.append([end[i]+normal[i]*(shift+signal_offset)for i in [0,1]])
  points.append(endpoints)
  for q in range(n+1):
   for off in [-args.half_width,0,args.half_width]:
    px=a[0]+dx*q/n+normal[0]*(shift+signal_offset+off);py=a[1]+dy*q/n+normal[1]*(shift+signal_offset+off);v=k.VECTOR2I(k.FromMM(px),k.FromMM(py))
    for layer,pp in polys.items():checks+=1;missing+=not any(p.Contains(v)for p in pp)
 rows.append({'normal_shift_mm':shift,'missing_ground_samples':missing,'sample_count':checks,'pair_endpoints_mm':points})
r={'status':'REFERENCE_COPPER_CORRIDOR_SCREEN_ONLY','source_sha256':hashlib.sha256(P.read_bytes()).hexdigest(),'spacing_mm':.025,'offsets_from_each_signal_mm':[-args.half_width,0,args.half_width],'best_candidates':sorted(rows,key=lambda x:(x['missing_ground_samples'],abs(x['normal_shift_mm'])))[:10],'all_candidates':rows,'limitations':['Existing filled copper only; routes not changed or refilled','No same-layer obstacle/fanout or bend DRC check','Finite sampling cannot prove continuous field or connectivity','±0.16mm screening width is not an impedance qualification criterion']};(O/args.output).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r['best_candidates'][:5],indent=2))
