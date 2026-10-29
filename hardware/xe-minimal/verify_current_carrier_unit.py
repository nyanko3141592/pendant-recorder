"""Reverse panel translation and compare complete serialized electrical items."""
from pathlib import Path
from collections import Counter
import pcbnew as k,wx,json,hashlib,re
app=wx.App(False);P=Path(__file__).resolve().parent;D=P/'current-single-carrier-trial';src=P/'fixed-usb-limit-trial/ncu-sensor-trial/pendant-xe-minimal.kicad_pcb';dst=D/'panel-rounded.kicad_pcb';a=k.LoadBoard(str(src));b=k.LoadBoard(str(dst));refs={f.GetReference() for f in a.GetFootprints()};delta=k.VECTOR2I(-23000000,-21500000)
for f in list(b.GetFootprints()):
 if f.GetReference() not in refs:b.RemoveNative(f)
 else:f.Move(delta)
for coll in [b.GetTracks(),b.Zones(),b.GetDrawings()]:
 for obj in coll:obj.Move(delta)
# Diagnostic copies only: no source modifications.
pa=D/'unit-normalized-source.kicad_pcb';pb=D/'unit-inverse-translated.kicad_pcb';k.SaveBoard(str(pa),a);k.SaveBoard(str(pb),b)
def blocks(path,tag):
 s=path.read_text();found=[]
 for m in re.finditer(r'(?m)^\t\('+re.escape(tag)+r'\b',s):
  i=m.start()+1;depth=0;quoted=False;escaped=False
  for j in range(i,len(s)):
   ch=s[j]
   if quoted:
    if escaped:escaped=False
    elif ch=='\\':escaped=True
    elif ch=='"':quoted=False
   elif ch=='"':quoted=True
   elif ch=='(':depth+=1
   elif ch==')':
    depth-=1
    if depth==0:found.append(s[i:j+1]);break
 return Counter(found)
rows=[]
for tag in ['footprint','segment','via','arc','zone']:
 ca,cb=blocks(pa,tag),blocks(pb,tag);rows.append({'kind':tag,'source_count':sum(ca.values()),'candidate_count':sum(cb.values()),'identical_serialized_items':ca==cb,'missing_count':sum((ca-cb).values()),'extra_or_changed_count':sum((cb-ca).values())})
r={'status':'COMPLETE_ITEM_SERIALIZATION_COMPARISON_AFTER_INVERSE_TRANSLATION','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'panel_sha256':hashlib.sha256(dst.read_bytes()).hexdigest(),'translation_mm':[23,21.5],'comparisons':rows,'all_compared_items_equal':all(x['identical_serialized_items'] for x in rows),'limits':['Non-footprint board graphics not compared here. Zones include outlines, settings and saved filled polygons.','Includes full serialized footprints: pads, custom geometry, mask/paste margins, fields and model references; does not compare external model file contents.','Does not approve carrier mechanics or manufacturing.']};(D/'unit-serialization-comparison.json').write_text(json.dumps(r,indent=2)+'\n');print(rows);assert r['all_compared_items_equal']
