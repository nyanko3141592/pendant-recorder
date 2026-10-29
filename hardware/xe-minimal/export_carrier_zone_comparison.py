from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);P=Path(__file__).resolve().parent;D=P/'current-single-carrier-trial';files={'source':P/'fixed-usb-limit-trial/ncu-sensor-trial/pendant-xe-minimal.kicad_pcb','panel':D/'panel-rounded.kicad_pcb'}
def ring(c,dx,dy):return [[c.CPoint(i).x-dx,c.CPoint(i).y-dy] for i in range(c.PointCount())]
def polygons(ps,dx,dy):return [{'outer':ring(ps.COutline(i),dx,dy),'holes':[ring(ps.CHole(i,j),dx,dy) for j in range(ps.HoleCount(i))]} for i in range(ps.OutlineCount())]
result={}
for label,path in files.items():
 b=k.LoadBoard(str(path));dx,dy=(0,0) if label=='source' else (23000000,21500000);zones=[]
 for z in b.Zones():
  zones.append({'uuid':z.m_Uuid.AsString(),'net':z.GetNetname(),'outline':polygons(z.Outline(),dx,dy),'fills':{b.GetLayerName(l):polygons(z.GetFilledPolysList(l),dx,dy) for l in z.GetLayerSet().CuStack()}})
 result[label]={'sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'zones':zones}
(D/'zone-comparison-geometry.json').write_text(json.dumps(result)+'\n');print('exported integer-nanometer zone geometry')
