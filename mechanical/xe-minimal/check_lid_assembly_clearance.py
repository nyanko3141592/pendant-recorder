from pathlib import Path
import cadquery as cq,json
O=Path(__file__).resolve().parent
hi=cq.importers.importStep(str(O/'sliding-hook-upper-trial.step')).val();board=cq.importers.importStep(str(O/'screw-candidate-integrated-board.step')).val()
rows=[]
for y in [0,.3,.4,.45,.5]:
 s=hi.translate((0,y,0));rows.append({'offset_y_mm':y,'board_distance_mm':s.distance(board),'overlap_mm3':s.intersect(board).Volume()})
r={'status':'ASSEMBLY_CLEARANCE_SCREEN_NOT_QUALIFIED','rows':rows,'meaning':'Zero overlap alone is insufficient; clearance must cover manufacturing and positioning errors','limitations':['Approximate component models','No supplier tolerance stack','Original leads omitted']};(O/'lid-assembly-clearance.json').write_text(json.dumps(r,indent=2)+'\n');print(rows)
