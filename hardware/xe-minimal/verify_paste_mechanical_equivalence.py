"""Check placement/body-model inputs across a paste-only board revision."""
from pathlib import Path
import json,hashlib
import pcbnew as k,wx
app=wx.App(False)
p=Path(__file__).resolve().parent
old=p/'pre-u10-paste-adoption/pendant-xe-minimal.kicad_pcb';new=p/'pendant-xe-minimal.kicad_pcb'
xy=lambda v:[v.x,v.y]
xyz=lambda v:[v.x,v.y,v.z]
def inventory(path):
 b=k.LoadBoard(str(path));parts={}
 for f in b.GetFootprints():
  pads=[]
  for pad in f.Pads():
   layers=pad.GetLayerSet()
   if not (layers.Contains(k.F_Cu) or layers.Contains(k.B_Cu)):continue
   pads.append({'number':pad.GetNumber(),'position_nm':xy(pad.GetPosition()),'size_nm':xy(pad.GetSize()),'drill_nm':xy(pad.GetDrillSize()),'orientation':pad.GetOrientationDegrees(),'shape':int(pad.GetShape()),'net':pad.GetNetname()})
  parts[f.GetReference()]={'value':f.GetValue(),'footprint':[str(f.GetFPID().GetLibNickname()),str(f.GetFPID().GetLibItemName())],'position_nm':xy(f.GetPosition()),'orientation':f.GetOrientationDegrees(),'flipped':f.IsFlipped(),'models':[{'file':m.m_Filename,'offset':xyz(m.m_Offset),'rotation':xyz(m.m_Rotation),'scale':xyz(m.m_Scale),'shown':m.m_Show,'opacity':m.m_Opacity} for m in f.Models()],'copper_pads':sorted(pads,key=lambda r:(r['number'],r['position_nm']))}
 edges=[{'shape':int(s.GetShape()),'start':xy(s.GetStart()),'end':xy(s.GetEnd()),'width':s.GetWidth()} for s in b.GetDrawings() if s.GetLayer()==k.Edge_Cuts]
 return {'parts':parts,'edges':edges,'thickness_nm':b.GetDesignSettings().GetBoardThickness()}
a=inventory(old);b=inventory(new);assert a==b
r={'status':'PLACEMENT_MODEL_AND_COPPER_PAD_INPUTS_EQUIVALENT_NOT_PHYSICAL_FIT_PROOF','old_pcb_sha256':hashlib.sha256(old.read_bytes()).hexdigest(),'new_pcb_sha256':hashlib.sha256(new.read_bytes()).hexdigest(),'footprints_compared':len(a['parts']),'checked':['Footprint identity/value/XY/rotation/side','All copper pad positions/sizes/drills/shapes/net names','3D model file references/transforms/visibility/opacity','Edge.Cuts geometry and board thickness'],'limitations':['External model file contents and manually added body envelopes are not validated by this comparison.','Existing model studies retain their original source hashes; this is a bridge between board revisions only.','Battery cables, connector mating, enclosure closure and final fit remain unresolved.']}
(p/'paste-mechanical-equivalence.json').write_text(json.dumps(r,indent=2)+'\n');print(r['footprints_compared'],'footprints equivalent')
