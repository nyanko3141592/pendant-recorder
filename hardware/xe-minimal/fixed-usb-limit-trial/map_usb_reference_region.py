from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);O=Path(__file__).resolve().parent;P=O/'usb-pair-far-extension-trial/pendant-xe-minimal.kicad_pcb';b=k.LoadBoard(str(P));xs=[16+i*.025 for i in range(201)];ys=[10+i*.025 for i in range(161)];planes={}
for layer in [k.In1_Cu,k.In3_Cu]:
 ps=[z.GetFilledPolysList(layer) for z in b.Zones()if z.GetNetname()=='/GND' and z.IsOnLayer(layer)]
 planes[b.GetLayerName(layer)]=[[int(any(p.Contains(k.VECTOR2I(k.FromMM(x),k.FromMM(y)))for p in ps))for x in xs]for y in ys]
tracks=[];vias=[]
for t in b.GetTracks():
 a,z=t.GetStart(),t.GetEnd();start=[k.ToMM(a.x),k.ToMM(a.y)];end=[k.ToMM(z.x),k.ToMM(z.y)]
 if isinstance(t,k.PCB_VIA):
  if 15.5<start[0]<21.5 and 9.5<start[1]<14.5:vias.append({'net':t.GetNetname(),'xy':start,'diameter':k.ToMM(t.GetWidth(k.In2_Cu))})
 elif t.GetNetname()in ['/USB_DP','/USB_DM']and t.GetLayer()==k.In2_Cu:tracks.append({'net':t.GetNetname(),'a':start,'b':end})
r={'pcb_sha256':hashlib.sha256(P.read_bytes()).hexdigest(),'x_mm':xs,'y_mm':ys,'ground_presence':planes,'usb_tracks':tracks,'vias':vias,'limits':['Raster samples, not continuous coverage or electrical field analysis','Via circles are copper diameter; cleared plane voids shown by sampled background']};(O/'usb-reference-region.json').write_text(json.dumps(r));print('saved',len(vias),'vias')
