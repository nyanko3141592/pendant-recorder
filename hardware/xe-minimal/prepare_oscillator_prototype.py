from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess,hashlib,csv
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'oscillator-prototype-candidate';name='PendantMinimal:Crystal_ABS06_2012_RecommendedLand';values={'Y1':'ABS06-32.768KHZ-7-T','C11':'5.6p C0G prototype','C12':'5.6p C0G prototype'}
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
original=dst.with_suffix('.kicad_sch').read_text();prefix,instances=original.split('(symbol (lib_id',1)
s=instances.replace('32.768kHz CL=7pF TBD',values['Y1']).replace('10p tentative',values['C11']).replace('Crystal:Crystal_SMD_2012-2Pin_2.0x1.2mm',name);dst.with_suffix('.kicad_sch').write_text(prefix+'(symbol (lib_id'+s)
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='Y1');old={p.GetNumber():p.GetPosition() for p in f.Pads()};f.SetPosition(k.VECTOR2I(f.GetPosition().x+50000,f.GetPosition().y+200000));cx,cy=f.GetPosition().x,f.GetPosition().y
for p in f.Pads():
 sign=1 if p.GetPosition().x>cx else -1;new=k.VECTOR2I(cx+sign*725000,cy);p.SetSize(k.VECTOR2I(750000,1400000));p.SetPosition(new)
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA) or t.GetNetname()!=p.GetNetname():continue
  if t.GetStart()==old[p.GetNumber()]:t.SetStart(new)
  if t.GetEnd()==old[p.GetNumber()]:t.SetEnd(new)
f.SetFPID(k.LIB_ID('PendantMinimal','Crystal_ABS06_2012_RecommendedLand'))
for f in b.GetFootprints():
 if f.GetReference() in values:f.SetValue(values[f.GetReference()])
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
for kind,ext,extra in [('pcb','.kicad_pcb',['--schematic-parity']),('sch','.kicad_sch',[])]:
 cmd=[cli,kind,'drc' if kind=='pcb' else 'erc',str(dst.with_suffix(ext)),*extra,'--format','json','--severity-all','-o',str(O/f'oscillator-prototype-{kind}-check.json')];subprocess.run(cmd,check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'oscillator-prototype-pcb-check.json').read_text());out={'status':'PROTOTYPE_CANDIDATE_PENDING_REVIEW','source_sha256':hashlib.sha256(src.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(dst.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'violations':r['violations'],'parity':r['schematic_parity'],'unconnected_items':len(r['unconnected_items']),'parts':values,'caps':'Murata GRM1555C1H5R6CA01D candidate;5.6pF +/-0.25pF C0G50V0402','cap_basis':'3pF internal typical +1.2pF assumed PCB +2.8pF equal-cap series=7pF. PCB1.2pF is an assumption, not measured.','remaining':['Oscillator drive/startup/accuracy/PCB parasitic qualification','PCBA part matching and stock','Firmware LSE drive setup'],'adopted':False};(O/'oscillator-prototype-review.json').write_text(json.dumps(out,indent=2)+'\n');print(len(r['violations']),len(r['schematic_parity']),len(r['unconnected_items']))
