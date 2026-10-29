from pathlib import Path
import json, shutil, subprocess, hashlib
import pcbnew as k, wx
app=wx.App(False)
D=Path(__file__).resolve().parent
S=D/'tps22950-placement'; O=D/'tps22950-19k1-candidate'; O.mkdir(exist_ok=True)
name='pendant-xe-minimal'
for d in ['PendantXE.pretty','PendantMinimal.pretty','TPSLimitTrial.pretty']:
 shutil.copytree(S/d,O/d,dirs_exist_ok=True)
shutil.copyfile(S/'fp-lib-table',O/'fp-lib-table')
for ext in ['kicad_pro','kicad_dru']:
 shutil.copyfile(S/('routed-clean.'+ext),O/(name+'.'+ext))
spec=json.loads((S/'design.json').read_text())
for p in spec['parts']:
 if p['ref']=='R44':
  p['value']='19.1k 0.1%';p['note']='TNPW040219K1BEED, 25ppm/K; candidate, current bounds not guaranteed by 19.2k table';p['mpn']='TNPW040219K1BEED'
spec['status']='ROUTED_19K1_CANDIDATE_NOT_ADOPTED'
(O/'design.json').write_text(json.dumps(spec,indent=2)+'\n')
subprocess.run(['python3',str(D.parent/'generate_schematic.py'),'xe-minimal',str(O)],check=True)
b=k.LoadBoard(str(S/'routed-clean.kicad_pcb'))
next(f for f in b.GetFootprints() if f.GetReference()=='R44').SetValue('19.1k 0.1%')
k.SaveBoard(str(O/(name+'.kicad_pcb')),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(O/(name+'.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drc.json')],check=True)
x=json.loads((O/'drc.json').read_text())
review={'status':spec['status'],'part':'TNPW040219K1BEED','resistance_ohm':19100,'tolerance_fraction':.001,'TCR_ppm_per_K':25,'source':'https://www.vishay.com/docs/28758/tnpw_e3.pdf','procurement_lead':'https://www.digikey.com/en/products/detail/vishay-dale/TNPW040219K1BEED/1606454','procurement_status':'Listed cut tape; current Japanese delivery and assembler availability unverified','checks':{q:len(x[q])for q in ['violations','unconnected_items','schematic_parity']},'pcb_sha256':hashlib.sha256((O/(name+'.kicad_pcb')).read_bytes()).hexdigest(),'geometry_change':'None; R44 value only; schematic regenerated','physical_tests':0}
# Initial tolerance and temperature variation only; no lifetime/solder drift included.
e=.001+25e-6*100
lo=19100*(1-e);hi=19100*(1+e)
review['conditional_screen']={'film_temperature_C':[-40,125],'reference_C':25,'resistor_range_ohm':[lo,hi],'excludes':['soldering drift','aging','self heating beyond temperature range'],'typical_formula_current_mA_range':[1180*(hi/1000)**-1.072,1180*(lo/1000)**-1.072],'guaranteed_current_bounds_mA':None,'reason':'TI 34/50/66 mA table is at 19.2k; typical formula cannot extend min/max guarantee to 19.1k or its tolerance.'}
(O/'resistor-review.json').write_text(json.dumps(review,indent=2)+'\n')
print(json.dumps(review,indent=2))
