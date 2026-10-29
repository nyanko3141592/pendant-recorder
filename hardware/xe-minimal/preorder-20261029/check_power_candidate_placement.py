from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);w=Path(__file__).resolve().parent
paths=[w/'l3-ground-011-trial.kicad_pcb',w/'c32-ground-wide-trial.kicad_pcb']
def inventory(path):
 b=k.LoadBoard(str(path));parts={}
 for f in b.GetFootprints():
  parts[f.GetReference()]={'xy':[f.GetPosition().x,f.GetPosition().y],'rotation':f.GetOrientationDegrees(),'layer':f.GetLayer(),'footprint':str(f.GetFPID().GetLibItemName()),'pads':sorted((p.GetNumber(),p.GetPosition().x,p.GetPosition().y,p.GetSize().x,p.GetSize().y,int(p.GetShape()),p.GetOrientationDegrees(),p.GetDrillSize().x,p.GetDrillSize().y) for p in f.Pads())}
 edges=[]
 for x in b.GetDrawings():
  if x.GetLayer()==k.Edge_Cuts:edges.append((int(x.GetShape()),x.GetStart().x,x.GetStart().y,x.GetEnd().x,x.GetEnd().y,x.GetWidth()))
 return {'parts':parts,'edges':sorted(edges),'board_thickness':b.GetDesignSettings().GetBoardThickness()}
a,c=map(inventory,paths);changes=[ref for ref in a['parts'] if a['parts'][ref]!=c['parts'].get(ref)];o={'source_pcb_sha256':hashlib.sha256(paths[0].read_bytes()).hexdigest(),'candidate_pcb_sha256':hashlib.sha256(paths[1].read_bytes()).hexdigest(),'footprint_count':len(a['parts']),'part_inventory_equal':a['parts']==c['parts'],'changed_parts':changes,'outline_equal':a['edges']==c['edges'],'general_thickness_equal':a['board_thickness']==c['board_thickness'],'existing_fit_directory':'mechanical/xe-minimal/preorder-20261029/l3-ground-011-fit','scope':'Pose, footprint ID, pad geometry, Edge.Cuts line/shape inventory and general thickness comparison; model links and stackup metadata not compared; not full mechanical release','release_allowed':False};(w/'power-candidate-placement-comparison.json').write_text(json.dumps(o,indent=2)+'\n');print(json.dumps(o))
