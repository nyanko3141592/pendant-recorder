from pathlib import Path
exec((Path(__file__).parent/'repair_plane6_signals.py').read_text().split('for iteration in range(1):')[0])
for ref,num in [('U1','16'),('U1','17'),('U1','18'),('U1','40')]:
 pad=next(p for f in b.GetFootprints() if f.GetReference()==ref for p in f.Pads() if p.GetNumber()==num)
 x,y=xy(pad.GetPosition());print(ref,num,pad.GetNetname(),x,y)
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.F_Cu or t.GetNetCode()==pad.GetNetCode():continue
  a,z=xy(t.GetStart()),xy(t.GetEnd())
  if min(a[0],z[0])<x+.45 and max(a[0],z[0])>x-.45 and min(a[1],z[1])<y+.7 and max(a[1],z[1])>y-.7:print(' nearby',t.GetNetname(),a,z)
 blocked,vm=masks(pad.GetNetCode());pts=component_endpoints(pad);valid=[(p,j) for p,j in pts if not blocked[j,round(p[0]/step),round(p[1]/step)]];print(' endpoints',len(pts),'valid',len(valid),valid[:4])
