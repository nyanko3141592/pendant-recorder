from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess,hashlib
app=wx.App(False);D=Path(__file__).resolve().parent;S=D/'top-led-trial';O=D/'led-land-trial';O.mkdir(exist_ok=True);name='pendant-xe-minimal'
for p in S.iterdir():
 if p.is_dir()and p.name.endswith('.pretty'):shutil.copytree(p,O/p.name,dirs_exist_ok=True)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(S/('final-routed'+ext),O/(name+ext))
lib=O/'KingbrightTrial.pretty';lib.mkdir(exist_ok=True);fpname='APHHS1005LSYCK_J3_PF_V4B'
(lib/(fpname+'.kicad_mod')).write_text('''(footprint "APHHS1005LSYCK_J3_PF_V4B" (version 20241229) (generator pcbnew)
(layer "F.Cu") (attr smd)
(descr "Kingbright APHHS1005LSYCK/J3-PF V4B recommended copper land; process not qualified")
(property "Reference" "D?" (at 0 -1.2) (layer "F.SilkS") (effects (font (size .8 .8) (thickness .1))))
(property "Value" "APHHS1005LSYCK/J3-PF" (at 0 1.2) (layer "F.Fab") (effects (font (size .8 .8) (thickness .1))))
(fp_rect (start -.55 -.3) (end .55 .3) (stroke (width .05) (type default)) (fill none) (layer "F.Fab"))
(fp_rect (start -1.05 -.55) (end 1.05 .55) (stroke (width .05) (type default)) (fill none) (layer "F.CrtYd"))
(pad "1" smd rect (at -.45 0) (size .7 .5) (layers "F.Cu" "F.Paste" "F.Mask"))
(pad "2" smd rect (at .45 0) (size .7 .5) (layers "F.Cu" "F.Paste" "F.Mask")))
''')
table=(S/'fp-lib-table').read_text().rstrip();assert table.endswith(')');(O/'fp-lib-table').write_text(table[:-1]+'(lib (name "KingbrightTrial") (type "KiCad") (uri "${KIPRJMOD}/KingbrightTrial.pretty") (options "") (descr "Manufacturer land candidate"))\n)\n')
spec=json.loads((S/'design.json').read_text());p=next(p for p in spec['parts']if p['ref']=='D6');p['value']='APHHS1005LSYCK/J3-PF';p['footprint']='KingbrightTrial:'+fpname;p['note']='Candidate low-current yellow indicator. V4B copper land; periodic battery and terminal fault/capacity indication. Visibility at 6.8k remains unqualified.';p['assembly_status']='CANDIDATE - retail cut tape identified; assembler procurement and optical qualification pending'
(O/'design.json').write_text(json.dumps(spec,indent=2)+'\n');subprocess.run(['python3',str(D.parent/'generate_schematic.py'),'xe-minimal',str(O)],check=True)
b=k.LoadBoard(str(S/'final-routed.kicad_pcb'));old=next(f for f in b.GetFootprints()if f.GetReference()=='D6');nets={p.GetNumber():p.GetNet() for p in old.Pads()};oldpos={p.GetNumber():p.GetPosition() for p in old.Pads()}
f=k.FootprintLoad(str(lib),fpname);f.SetReference('D6');f.SetValue(p['value']);f.SetFPID(k.LIB_ID('KingbrightTrial',fpname));f.SetPath(old.GetPath());f.SetOrientationDegrees(old.GetOrientationDegrees());f.SetPosition(old.GetPosition())
for pad in f.Pads():
 pad.SetNet(nets[pad.GetNumber()]);prior=oldpos[pad.GetNumber()]
 for t in b.GetTracks():
  if isinstance(t,k.PCB_VIA)or t.GetNetname()!=pad.GetNetname():continue
  if t.GetStart()==prior:t.SetStart(pad.GetPosition())
  if t.GetEnd()==prior:t.SetEnd(pad.GetPosition())
b.RemoveNative(old);b.AddNative(f);f.thisown=False
k.ZONE_FILLER(b).Fill(b.Zones());out=O/(name+'.kicad_pcb');k.SaveBoard(str(out),b)
cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
subprocess.run([cli,'pcb','drc',str(out),'--schematic-parity','--format','json','--severity-all','-o',str(O/'drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
r=json.loads((O/'drc.json').read_text());report={'status':'MANUFACTURER_LED_LAND_CANDIDATE_NOT_ADOPTED','pcb_sha256':hashlib.sha256(out.read_bytes()).hexdigest(),'checks':{q:len(r[q])for q in ['violations','unconnected_items','schematic_parity']},'mpn':p['value'],'copper_pad_size_mm':[.7,.5],'pad_center_spacing_mm':.9,'copper_gap_mm':.2,'source':'Kingbright DSAO4041 V4B page1','remaining':['Paste and solder mask process qualification','Brightness and assembly qualification','Inner-layer route return review']};(O/'review.json').write_text(json.dumps(report,indent=2)+'\n');print(report);print([(v['type'],v['items'])for v in r['violations']])
