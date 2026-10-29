"""DMN2056U maximum prism with explicit provisional solder standoff sweep."""
from pathlib import Path
import cadquery as cq,json,hashlib
O=Path(__file__).resolve().parent;R=O.parent.parent
B=R/'hardware/xe-minimal/fixed-usb-limit-trial/dmn-land-trial/pendant-xe-minimal.kicad_pcb'
files={'lower':'offset-pack-lower-trial.step','upper':'thickness-clearance-upper-trial.step','separator':'support-notched-separator-trial.step','battery':'offset-pack-assembly-trial.step'}
shapes={n:cq.importers.importStep(str(O/f)).val() for n,f in files.items()}
rows=[]
# Position from saved board; Y sign reversed by PCB-to-STEP coordinate convention.
for ref,x,y,side in [('Q6',10.255,-2.025,'bottom'),('Q7',6.755,-7.525,'top')]:
 for standoff in [0,.1,.2]:
  z0,z1=(-1.15-standoff,0) if side=='bottom' else (.73,.93+1.15+standoff)
  prism=cq.Workplane('XY').box(2.55,3,z1-z0,centered=(True,True,False)).translate((x,y,z0)).val()
  results={n:{'overlap_mm3':prism.intersect(s).Volume(),'distance_mm':prism.distance(s)} for n,s in shapes.items()}
  rows.append({'ref':ref,'provisional_standoff_mm':standoff,'envelope_z_mm':[z0,z1],'results':results})
r={'status':'MAXIMUM_COMPONENT_PRISM_CASE_SCREEN_NOT_ASSEMBLY_APPROVAL','pcb_sha256':hashlib.sha256(B.read_bytes()).hexdigest(),'source_sha256':{n:hashlib.sha256((O/f).read_bytes()).hexdigest() for n,f in files.items()},'envelope_xy_mm':[2.55,3],'finished_board_thickness_range_mm':[.73,.93],'rows':rows,'limitations':['Standoff0/.1/.2mm is a sensitivity sweep, not a validated process tolerance','Rectangular prism encloses full lead span including empty space','Case print error, warpage, component placement error, original battery leads and plug excluded','Does not update assembly STEP or approve full-device fit']}
(O/'dmn-case-envelope-review.json').write_text(json.dumps(r,indent=2)+'\n')
for row in rows:print(row['ref'],row['provisional_standoff_mm'],row['results'])
