from pathlib import Path
import pcbnew as k,wx,json,hashlib,collections
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'chg-via-ground-neck.kicad_pcb';b=k.LoadBoard(str(p));source=k.LoadBoard(str(w/'pdm-tp6-routed.kicad_pcb'))
critical=set(json.loads((w/'pdm-tp6-preparation.json').read_text())['critical_nets_outer_only'])|{'/USB_DP','/USB_DM'}
bad=[];counts=collections.defaultdict(lambda:collections.Counter());holes=[];minimum={}
for t in b.GetTracks():
 if isinstance(t,k.PCB_VIA):
  for f in b.GetFootprints():
   for pad in f.Pads():
    for layer in [k.F_Cu,k.B_Cu]:
     if pad.IsOnLayer(layer) and pad.GetEffectiveShape(layer).Collide(t.GetPosition(),t.GetDrillValue()//2):holes.append([f.GetReference(),pad.GetNumber(),str(t.GetNetname())])
  continue
 net=str(t.GetNetname());layer=b.GetLayerName(t.GetLayer());counts[net][layer]+=k.ToMM(t.GetLength());minimum[net]=min(minimum.get(net,100),k.ToMM(t.GetWidth()))
 if t.GetLayer()==k.In1_Cu and net!='/GND' or t.GetLayer()==k.In2_Cu and net in critical:bad.append({'net':net,'layer':layer,'uuid':str(t.m_Uuid.AsString())})
def usb(board):return sorted((str(t.GetNetname()),t.GetLayer(),t.GetStart().x,t.GetStart().y,t.GetEnd().x,t.GetEnd().y,t.GetWidth(k.F_Cu) if isinstance(t,k.PCB_VIA) else t.GetWidth()) for t in board.GetTracks() if t.GetNetname() in ['/USB_DP','/USB_DM'])
r={'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'layer_contract_violations':bad,'USB_shape_unchanged':usb(b)==usb(source),'hole_over_pad':holes,'minimum_width_mm':minimum,'net_layer_lengths_mm':dict(counts),'limitations':['Layer assignment alone does not prove continuous return below B.Cu','Missing route can trivially satisfy assignment; connectivity separately required'],'release_allowed':False};(w/'chg-via-ground-neck-contract.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({'layer_contract_violations':bad,'USB_shape_unchanged':r['USB_shape_unchanged'],'hole_over_pad_count':len(holes)}))
