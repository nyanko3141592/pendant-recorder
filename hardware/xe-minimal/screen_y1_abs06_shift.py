from pathlib import Path
import pcbnew as k,wx,json,shutil,subprocess,hashlib
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'y1-abs06-shift-candidate'
for ext in ['.kicad_sch','.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
reviews=[]
for dx,dy in [(.05,.2),(.1,.2),(.05,.25),(.1,.3),(.1,.15),(.05,.15)]:
 b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='Y1');oldpads={p.GetNumber():p.GetPosition() for p in f.Pads()};f.SetPosition(k.VECTOR2I(f.GetPosition().x+round(dx*1e6),f.GetPosition().y+round(dy*1e6)));cx,cy=f.GetPosition().x,f.GetPosition().y;changes=[]
 for p in f.Pads():
  old=oldpads[p.GetNumber()];sign=1 if p.GetPosition().x>cx else -1;new=k.VECTOR2I(cx+round(sign*.725*1e6),cy);p.SetSize(k.VECTOR2I(750000,1400000));p.SetPosition(new)
  for t in b.GetTracks():
   if isinstance(t,k.PCB_VIA) or t.GetNetname()!=p.GetNetname():continue
   if t.GetStart()==old:t.SetStart(new)
   if t.GetEnd()==old:t.SetEnd(new)
  changes.append({'pad':p.GetNumber(),'old_xy_mm':[k.ToMM(old.x),k.ToMM(old.y)],'new_xy_mm':[k.ToMM(new.x),k.ToMM(new.y)],'size_mm':[.75,1.4]})
 k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
 subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'y1-abs06-shift-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads((O/'y1-abs06-shift-drc.json').read_text());out={'status':'LAND_SCREEN_ONLY_NOT_PART_ADOPTION','source_sha256':hashlib.sha256(src.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'changes':changes,'violations':r['violations'],'parity':r['schematic_parity'],'unconnected_items':len(r['unconnected_items']),'adopted':False,'note':'Value and library name deliberately unchanged pending electrical/footprint library adoption. Candidate only.'};out['shift_mm']=[dx,dy];reviews.append(out);print(dx,dy,len(r['violations']),len(r['unconnected_items']),flush=True)
 if not [v for v in r['violations'] if v['type']!='lib_footprint_mismatch'] and not r['schematic_parity'] and len(r['unconnected_items'])==21:break
(O/'y1-abs06-shift-review.json').write_text(json.dumps(reviews,indent=2)+'\n')
