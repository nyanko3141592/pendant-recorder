import pcbnew as k,wx,json,subprocess,shutil
from pathlib import Path
app=wx.App(False)
D=Path(__file__).resolve().parent/'screw-hole-trial'
b=k.LoadBoard(str(D/'pendant-xe-minimal.kicad_pcb'))
j=next(f for f in b.GetFootprints()if f.GetReference()=='J1')
print('J1 courtyard',[(k.ToMM(g.GetStart().x),k.ToMM(g.GetStart().y),k.ToMM(g.GetEnd().x),k.ToMM(g.GetEnd().y))for g in j.GraphicalItems()if g.GetLayer()==k.F_CrtYd])
rows=[]
for x in [18.05,18.075,18.1,18.15]:
 b=k.LoadBoard(str(D/'pendant-xe-minimal.kicad_pcb'));f=next(f for f in b.GetFootprints()if f.GetReference()=='H4');f.SetPosition(k.VECTOR2I(k.FromMM(x),k.FromMM(26)))
 k.ZONE_FILLER(b).Fill(b.Zones());p=D/('hole-'+str(x)+'.kicad_pcb');k.SaveBoard(str(p),b)
 for ext in ['kicad_pro','kicad_dru','kicad_sch']:shutil.copyfile(D/('pendant-xe-minimal.'+ext),p.with_suffix('.'+ext))
 out=p.with_suffix('.json');subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(p),'--schematic-parity','--format','json','--severity-all','-o',str(out)],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 d=json.loads(out.read_text());rows.append({'x':x,'checks':{q:len(d[q])for q in ['violations','unconnected_items','schematic_parity']},'types':[v['type']for v in d['violations']]})
(D/'hole-position-refined-scan.json').write_text(json.dumps(rows,indent=2)+'\n');print(rows)
