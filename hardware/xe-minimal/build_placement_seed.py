"""Create an explicitly unrouted comparison board; never modify the reference board."""
import pcbnew
import hashlib, json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
OUT=Path(__file__).resolve().parent
source=ROOT/'hardware/mini-rect-v15/input-control-pa2-pb5/usb-reference-power.kicad_pcb'
memsource=ROOT/'hardware/mini-rect-v12/storage-4gb-candidate.kicad_pcb'
before=hashlib.sha256(source.read_bytes()).hexdigest()
b=pcbnew.LoadBoard(str(source)); memboard=pcbnew.LoadBoard(str(memsource))
for t in list(b.GetTracks()): b.RemoveNative(t)
for z in list(b.Zones()): b.RemoveNative(z)
netmap={p.GetNetname():p.GetNet() for f in b.GetFootprints() for p in f.Pads() if p.GetNetname()}
old=next(f for f in b.GetFootprints() if f.GetReference()=='J4'); b.RemoveNative(old)
mem=pcbnew.Cast_to_FOOTPRINT(next(f for f in memboard.GetFootprints() if f.GetReference()=='U11').Duplicate(False))
mem.SetReference('U11'); b.AddNative(mem)
for p in mem.Pads():
 name=p.GetNetname()
 p.SetNet(netmap[name] if name.startswith('/') and name in netmap else b.FindNet(0))
old=next(f for f in b.GetFootprints() if f.GetReference()=='J3')
pos=old.GetPosition(); b.RemoveNative(old)
fp=pcbnew.FootprintLoad(str(OUT/'PendantMinimal.pretty'),'SWD_Pogo_5Pad_P1.27mm')
fp.SetReference('J3'); fp.SetValue('Factory SWD pogo candidate'); fp.SetPosition(pos); b.AddNative(fp)
names={'1':'/V3V3','2':'/SWDIO','3':'/NRST','4':'/SWCLK','5':'/GND'}
for p in fp.Pads():p.SetNet(netmap[names[p.GetNumber()]])
# Obsolete DAT1/DAT2-only pullups are excluded from this SPI-storage variant.
removed=[]
for f in list(b.GetFootprints()):
 if f.GetReference().startswith('R') and any(p.GetNetname() in ['/SD_DAT1','/SD_DAT2'] for p in f.Pads()):
  removed.append(f.GetReference()); b.RemoveNative(f)
path=OUT/'placement-seed-NOT-ROUTED.kicad_pcb'; pcbnew.SaveBoard(str(path),b)
check=pcbnew.LoadBoard(str(path)); assert len(list(check.GetTracks()))==0 and len(list(check.Zones()))==0
assert hashlib.sha256(source.read_bytes()).hexdigest()==before
actual={f.GetReference():{p.GetNumber():p.GetNetname() for p in f.Pads()} for f in check.GetFootprints() if f.GetReference() in ['J3','U11']}
assert actual['J3']==names
expected={'2':'/SD_CS_N','3':'/SD_CLK','4':'/GND','5':'/SD_MOSI','6':'/SD_MISO','8':'/SD_V3'}
assert all(actual['U11'][n]==v for n,v in expected.items())
report={'status':'UNROUTED_PLACEMENT_SEED_NOT_RELEASED','source_board_sha256':before,'memory_source_sha256':hashlib.sha256(memsource.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'removed_pullups':removed,'connections':actual,'checks':'Reloaded board, zero tracks/zones, replacement signal nets verified, reference unchanged.','limitations':['No matching schematic yet; update before ERC/netlist parity.','Storage land pattern inherited from engineering candidate; auxiliary pad role/paste not qualified.','Existing26x29mm outline and component positions retained as starting state, not minimum-size result.','Charger remains old baseline pending power architecture selection.','Memory supply and price not adopted. No production data.']}
(OUT/'placement-seed-review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
