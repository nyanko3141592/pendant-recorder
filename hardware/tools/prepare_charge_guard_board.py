from pathlib import Path
import json,uuid
import wx
app=wx.App(False)
import pcbnew as k
R=Path(__file__).resolve().parents[2];P=R/'hardware/charge-guard-v4';S=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints')
b=k.LoadBoard(str(R/'hardware/compact-b/electrical-placement-v3/compact-b.kicad_pcb'))
for t in list(b.GetTracks()):b.Delete(t)
d=json.loads((P/'design.json').read_text());fs={f.GetReference():f for f in b.GetFootprints()};nets={n.GetNetname():n for n in b.GetNetsByNetcode().values()}
for p in d['parts']:
 ref=p['ref']
 if ref not in fs:
  lib,name=p['footprint'].split(':');f=k.FootprintLoad(str(S/(lib+'.pretty')),name);assert f
  f.SetReference(ref);f.SetFPID(k.LIB_ID(lib,name));b.Add(f);fs[ref]=f
 f=fs[ref];f.SetValue(p['value']);f.SetPath(k.KIID_PATH('/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/charge-guard-v4/root'))+'/'+str(uuid.uuid5(uuid.NAMESPACE_URL,'pendant-recorder/charge-guard-v4/'+ref))))
 pp={z['number']:z for z in p['pins']}
 for pad in f.Pads():
  if pad.GetNumber() not in pp:continue
  raw=pp[pad.GetNumber()]['net'];name=('/'+raw) if raw else f"unconnected-({ref}-{pp[pad.GetNumber()]['name'].replace(' ','_')}-Pad{pad.GetNumber()})"
  if name not in nets:n=k.NETINFO_ITEM(b,name);b.Add(n);nets[name]=n
  pad.SetNet(nets[name])
 f.Reference().SetVisible(False);f.Value().SetVisible(False)
k.SaveBoard(str(P/'seed.kicad_pcb'),b)
