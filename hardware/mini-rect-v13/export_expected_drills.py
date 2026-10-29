from pathlib import Path
import sys
import pcbnew as k,wx,math,json,hashlib
app=wx.App(False);P=Path(__file__).resolve().parent;src=Path(sys.argv[1]) if len(sys.argv)>1 else P/'usb-ground-plane-candidate.kicad_pcb';b=k.LoadBoard(str(src));rows=[]
for v in b.GetTracks():
 if isinstance(v,k.PCB_VIA):rows.append({'source':v.m_Uuid.AsString(),'plated':True,'center':[k.ToMM(v.GetPosition().x),-k.ToMM(v.GetPosition().y)],'width':k.ToMM(v.GetDrillValue()),'length':k.ToMM(v.GetDrillValue()),'ends':None})
for f in b.GetFootprints():
 for p in f.Pads():
  d=p.GetDrillSize();dx,dy=k.ToMM(d.x),k.ToMM(d.y)
  if not dx or not dy:continue
  x,y=k.ToMM(p.GetPosition().x),-k.ToMM(p.GetPosition().y);ends=None
  if abs(dx-dy)>1e-6:
   a=math.radians(p.GetOrientationDegrees()+(90 if dy>dx else 0));r=abs(dx-dy)/2
   ends=[[x-r*math.cos(a),y-r*math.sin(a)],[x+r*math.cos(a),y+r*math.sin(a)]]
  rows.append({'source':f.GetReference()+':'+p.GetNumber(),'plated':p.GetAttribute()!=k.PAD_ATTRIB_NPTH,'center':[x,y],'width':min(dx,dy),'length':max(dx,dy),'ends':ends})
((Path(sys.argv[2]) if len(sys.argv)>2 else P/'fabrication-review')/'expected-board-drills.json').write_text(json.dumps({'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'rows':rows},indent=2)+'\n');print('Expected holes',len(rows))
