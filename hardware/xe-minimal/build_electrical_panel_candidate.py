"""Six-unit isolated electrical panel candidate. Never edits canonical board."""
from pathlib import Path
import hashlib,json,shutil,subprocess
import pcbnew as k,wx
app=wx.App(False);p=Path(__file__).resolve().parent;src=p/'pendant-xe-minimal.kicad_pcb';sha=hashlib.sha256(src.read_bytes()).hexdigest();layout=json.loads((p/'supported-panel-topology-study.json').read_text());assert sha==layout['source_pcb_sha256']
d=p/'electrical-panel-candidate-v3';d.mkdir(exist_ok=False);base=d/'panel'
for ext in ('.kicad_pcb','.kicad_pro','.kicad_dru'):shutil.copyfile(p/('pendant-xe-minimal'+ext),base.with_suffix(ext))
(d/'fp-lib-table').write_text((p/'fp-lib-table').read_text().replace('${KIPRJMOD}',str(p)))
b=k.LoadBoard(str(base.with_suffix('.kicad_pcb')));original=k.LoadBoard(str(src));outline=k.LoadBoard(str(p/'panel-outline-study/panel-outline-study.kicad_pcb'))
for items in (list(b.GetFootprints()),list(b.GetTracks()),list(b.Zones()),list(b.GetDrawings())):
 for obj in items:b.RemoveNative(obj)
def add(obj):b.AddNative(obj);obj.thisown=False
for obj in outline.GetDrawings():add(k.Cast_to_PCB_SHAPE(obj.Duplicate()))
for obj in outline.GetFootprints():add(k.Cast_to_FOOTPRINT(obj.Duplicate(False)))
netmap_rows=[]
for unit in layout['units']:
 n=unit['unit'];x,y=unit['bounds_mm'][:2];offset=k.VECTOR2I(round(x*1e6),round(y*1e6));nets={0:b.FindNet(0)}
 for code,net in original.GetNetsByNetcode().items():
  if not code:continue
  new=k.NETINFO_ITEM(b,f'P{n}'+net.GetNetname());add(new);nets[code]=new;netmap_rows.append({'unit':n,'source':net.GetNetname(),'panel':new.GetNetname()})
 for f in original.GetFootprints():
  c=k.Cast_to_FOOTPRINT(f.Duplicate(False));c.SetReference(f'P{n}_{f.GetReference()}');c.Move(offset)
  for pad in c.Pads():pad.SetNet(nets[pad.GetNetCode()])
  add(c)
 for t in original.GetTracks():
  cast=k.Cast_to_PCB_VIA if isinstance(t,k.PCB_VIA) else k.Cast_to_PCB_TRACK
  c=cast(t.Duplicate());c.SetNet(nets[t.GetNetCode()]);c.Move(offset);add(c)
 for z in original.Zones():
  c=k.Cast_to_ZONE(z.Duplicate(False));c.SetNet(nets[z.GetNetCode()]);c.Move(offset);add(c)
 # Canonical non-outline graphic objects are omitted intentionally in this first merge.
k.SaveBoard(str(base.with_suffix('.kicad_pcb')),b)
assert hashlib.sha256(src.read_bytes()).hexdigest()==sha
report={'status':'SIX_UNIT_MERGE_UNVERIFIED_NOT_RELEASED','source_pcb_sha256':sha,'panel_sha256':hashlib.sha256(base.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'footprints':len(list(b.GetFootprints())),'tracks_and_vias':len(list(b.GetTracks())),'zones':len(list(b.Zones())),'net_map':netmap_rows,'limitations':['No zone refill or DRC yet.','Reference-sensitive custom rules and net-class mappings need expansion to panel identifiers.','Non-outline source graphics omitted.','Fiducials and perforations not added; tooling holes and mechanical outline copied.','Schematic parity is checked at unit source, not available for merged panel.']}
(d/'merge-review.json').write_text(json.dumps(report,indent=2)+'\n');print(report['footprints'],report['tracks_and_vias'],report['zones'])
