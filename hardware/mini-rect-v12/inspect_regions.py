from pathlib import Path
exec((Path(__file__).parent/'repair_signals_rip.py').read_text().split('for iteration in range(1):')[0])
from scipy.ndimage import label
for ref,num,j in [('U1','15',0),('U1','14',0),('U3','8',5)]:
 pad=next(p for f in b.GetFootprints() if f.GetReference()==ref for p in f.Pads() if p.GetNumber()==num)
 blocked,via=masks(pad.GetNetCode());lab,n=label(~blocked[j]);px,py=xy(pad.GetPosition());region=lab[round(px/step),round(py/step)];rr=(lab==region)&(region!=0);xs,ys=np.where(rr);vx,vy=np.where(rr&~via)
 print(ref,num,pad.GetNetname(),'region',len(xs),'bounds',[(v.min()*step,v.max()*step) if len(v) else None for v in [xs,ys]],'vias',len(vx),list(zip(vx[:10]*step,vy[:10]*step)))
