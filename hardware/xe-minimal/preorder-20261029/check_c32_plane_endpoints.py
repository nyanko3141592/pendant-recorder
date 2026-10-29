from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent;p=w/'c32-ground-short-trial.kicad_pcb';b=k.LoadBoard(str(p));rows=[]
for z in b.Zones():
 if z.GetNetname()!='/GND' or z.GetIsRuleArea():continue
 for margin in [0,.025,.05,.1]:
  poly=k.SHAPE_POLY_SET(z.GetFilledPolysList(z.GetLayer()))
  if margin:poly.Deflate(k.FromMM(margin),k.CORNER_STRATEGY_ROUND_ALL_CORNERS,k.FromMM(.001))
  ends={}
  for name,xy in [('C32',(11.4523,2.9226)),('U13',(12.8375,.25))]:
   q=k.VECTOR2I(*[k.FromMM(v) for v in xy]);ends[name]={'contains':poly.Contains(q),'outline_indices':[i for i in range(poly.OutlineCount()) if poly.Contains(q,i)]}
  rows.append({'layer':b.GetLayerName(z.GetLayer()),'margin_mm':margin,'endpoints':ends,'same_polygon':bool(set(ends['C32']['outline_indices'])&set(ends['U13']['outline_indices']))})
o={'source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'rows':rows,'limitations':['Polygon connectivity excludes path width beyond deflation tolerance; no current distribution calculation'],'release_allowed':False};(w/'c32-plane-endpoints.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o,indent=2))
