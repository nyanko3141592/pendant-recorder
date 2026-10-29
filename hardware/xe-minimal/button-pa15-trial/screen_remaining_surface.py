"""Sequential same-surface trials; chain only full DRC/parity passing improvements."""
from pathlib import Path
import subprocess,json
O=Path(__file__).resolve().parent
base=(O/'route_ilim_r45.py').read_text()
current='pa15-router-screen-candidate';remaining=22;results=[]
trials=[('gate-q3','VBUS_GATE','R14','1','Q3','1','B'),('charge-pullup','CHG_N','R11','2','U3','9','B'),('resume-pull','USB_RESUME_PULSE','R50','1','Q7','1','F'),('high-drain','USB_HIGH_BUDGET_DRAIN','Q5','3','R45','2','F'),('latch-clock','USB_LATCH_CLOCK','Q6','3','U14','3','B'),('latch-clear','USB_LATCH_CLEAR_N','Q7','3','R48','2','F'),('high-pull','USB_HIGH_BUDGET','Q5','1','R46','1','F')]
for name,net,r1,p1,r2,p2,side in trials:
 prefix='surface-'+name
 s=base.replace('pa15-button-complete-candidate',current).replace('pa15-ilim-r45',prefix).replace("p=pad('U13','3');v=pad('R45','1')",f"p=pad('{r1}','{p1}');v=pad('{r2}','{p2}')").replace('/USB_ILIM_SET','/'+net).replace('[k.F_Cu]',f'[k.{side}_Cu]').replace('==24',f'=={remaining-1}')
 script=O/(prefix+'.py');script.write_text(s)
 with (O/(prefix+'.log')).open('w') as log:
  subprocess.run(['/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/3.9/bin/python3.9',str(script)],stdout=log,stderr=log,check=True)
 r=json.loads((O/(prefix+'-review.json')).read_text());accepted=bool(r['accepted'])
 results.append({'name':name,'source':current,'accepted':accepted,'review':r})
 if accepted:current=prefix+'-candidate';remaining-=1
 (O/'remaining-surface-screen.json').write_text(json.dumps({'current_candidate':current,'unconnected':remaining,'trials':results},indent=2)+'\n')
 print(name,accepted,remaining,flush=True)
