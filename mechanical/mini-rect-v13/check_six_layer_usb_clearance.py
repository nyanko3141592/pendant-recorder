"""Maximum board thickness USB envelope vs unchanged r4 case, CAD diagnostic."""
from pathlib import Path
import json,subprocess
root=Path(__file__).resolve().parent
source=root/'generate_fit_study_r4.py'
ns={'__file__':str(source)}
exec(compile(source.read_text().split("run('01_hollow_case_body',body)")[0],str(source),'exec'),ns)
p=Path('/Users/takahashinaoki/Downloads/Pendant-v13-six-layer-max-thickness-study')
c=ns['body']+ns['lid'];j=ns['by']['J1']
ns['box'](c,'USB_max_thickness_envelope',1+j['x'],1+j['y'],9.45+.93-.02,j['w'],j['h'],j['height']+.02,.08)
c.append(dict(command='inspect.clearance',params=dict(bodies=['USB_max_thickness_envelope'],against=['case_body','case_lid'],min_volume=.0001,clearance=.2)))
f=p/'usb-case-clearance.json';f.write_text(json.dumps(dict(commands=c)))
subprocess.run([ns['CLI'],'run',str(f),'--results','--json-out',str(p/'usb-case-clearance-results.json'),'--quiet'],check=True)
