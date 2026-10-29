"""Separate90mA prototype board. No geometry/net change or charge enable."""
from pathlib import Path
import wx,pcbnew as k,shutil,json
app=wx.App(False);P=Path(__file__).resolve().parent
src=P/'acoustic-clearance-candidate.kicad_pcb';dst=P/'charge-prototype-candidate.kicad_pcb';b=k.LoadBoard(str(src))
d=json.loads((P/'design.json').read_text());value=next(p['value'] for p in d['parts'] if p['ref']=='R10')
f=next(f for f in b.GetFootprints() if f.GetReference()=='R10');assert f.GetValue()=='15k 1%';f.SetValue(value)
k.SaveBoard(str(dst),b)
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
print('Changed R10 only to',value)
