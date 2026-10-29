from pathlib import Path
import json
O=Path(__file__).resolve().parent
exec((O/'route_sd_enable_four_layer.py').read_text().split('closed=set();end=None')[0])
r={'a':a,'c':c,'start_states':len(costs),'goal_states':len(goals),'layer_endpoint_clear':{str(l):{'a':clear(a,l),'c':clear(c,l),'goals':sum(z[2]==l for z in goals),'starts':sum(z[2]==l for z in costs)} for l in layers}}
(O/'sd-enable-endpoint-diagnostic.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
