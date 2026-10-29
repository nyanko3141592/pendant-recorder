"""Export source-bound fabrication review files. Does not authorize manufacture."""
from pathlib import Path
import subprocess,json,hashlib,zipfile
P=Path(__file__).resolve().parent
K='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
src=P/'usb-ground-plane-candidate.kicad_pcb';out=P/'fabrication-review';ger=out/'gerber'
ger.mkdir(parents=True,exist_ok=True)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
source_hash=sha(src)
review=json.loads((P/'usb-ground-plane-review.json').read_text())
assert review['candidate_sha256']==source_hash and review['drc']==0 and review['unconnected']==0
commands=[
 [K,'pcb','export','gerbers','--layers','F.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,B.Cu,F.Mask,B.Mask,F.Paste,B.Paste,F.Silkscreen,B.Silkscreen,Edge.Cuts','--subtract-soldermask','--output',str(ger),str(src)],
 [K,'pcb','export','drill','--format','excellon','--drill-origin','absolute','--excellon-units','mm','--excellon-separate-th','--generate-report','--report-path',str(out/'drill-report.txt'),'--output',str(ger),str(src)],
 [K,'pcb','export','pos','--format','csv','--units','mm','--side','both','--output',str(out/'RAW-KICAD-POSITIONS-NOT-JLC-APPROVED.csv'),str(src)]
]
logs=[]
for command in commands:
 r=subprocess.run(command,check=True,text=True,capture_output=True);logs.append(r.stdout+r.stderr)
assert sha(src)==source_hash
files=sorted(p for p in ger.iterdir() if p.is_file())
attrs={p.name:[line for line in p.read_text().splitlines() if 'TF.FileFunction' in line] for p in files if p.suffix!='.drl'}
copper=[line for lines in attrs.values() for line in lines if 'Copper' in line]
assert len(copper)==6,copper
assert len(list(ger.glob('*.drl')))==2
archive=out/'V13-SIX-LAYER-FABRICATION-REVIEW-NOT-ORDER.zip'
with zipfile.ZipFile(archive,'w',zipfile.ZIP_DEFLATED) as z:
 for p in files:z.write(p,p.name)
manifest={'status':'FABRICATION_REVIEW_NOT_ORDER_RELEASE','board':src.name,'board_sha256':source_hash,'files':[{'name':p.name,'sha256':sha(p)} for p in files],'file_functions':attrs,'zip_sha256':sha(archive),'coordinate_basis':'Absolute board coordinates; Gerber and drill share origin; position CSV uses KiCad convention','stackup':'JLC06081H-2116 candidate; nominal 0.83mm, six copper layers; final supplier confirmation required','limitations':['Gerber visual rendering and independent drill/outline checks pending','Raw position CSV is not validated JLC CPL; includes non-assembly features','BOM, battery/card power and assembly rotation unresolved','No upload, quotation, order or payment performed']}
(out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n');(out/'export-log.txt').write_text('\n'.join(logs));print(archive);print('Files',len(files),'copper layers',len(copper))
