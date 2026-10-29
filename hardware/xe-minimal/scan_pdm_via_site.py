#!/usr/bin/env python3
"""DRC-scan standard through-via sites for the PDM_DATA layer transition."""
from pathlib import Path
import concurrent.futures, json, subprocess
import wx, pcbnew as k

HERE=Path(__file__).resolve().parent
CLI='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
PY='/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3'

def make(args):
    x,y,i=args
    app=wx.App(False); b=k.LoadBoard(str(HERE/'pendant-xe-minimal.kicad_pcb'))
    v=k.PCB_VIA(b); v.SetNet(b.FindNet('/PDM_DATA'))
    v.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(y)))
    v.SetWidth(k.FromMM(.45)); v.SetDrill(k.FromMM(.2)); v.SetLayerPair(k.F_Cu,k.B_Cu); b.Add(v)
    pcb=HERE/f'pdm-via-scan-{i}.kicad_pcb'; out=HERE/f'pdm-via-scan-{i}.json'
    k.SaveBoard(str(pcb),b)
    subprocess.run([CLI,'pcb','drc',str(pcb),'--format','json','--severity-all','-o',str(out)],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
    d=json.loads(out.read_text()); pcb.unlink(); out.unlink()
    # Canonical baseline has only the two waived U8 courtyard-clearance errors.
    hard=[v for v in d['violations'] if not ('U8' in ' '.join(i['description'] for i in v['items']))]
    return {'x':x,'y':y,'hard':len(hard),'unconnected':len(d['unconnected_items'])}

if __name__=='__main__':
    spots=[]; i=0
    for x in [17.5+n*.5 for n in range(17)]:
        for y in [1.0+n*.5 for n in range(9)]: spots.append((x,y,i)); i+=1
    with concurrent.futures.ProcessPoolExecutor(max_workers=8) as ex: rows=list(ex.map(make,spots))
    rows.sort(key=lambda r:(r['hard'],r['unconnected'],abs(r['x']-19.75)+abs(r['y']-3.715)))
    print(json.dumps(rows[:20],indent=2))
