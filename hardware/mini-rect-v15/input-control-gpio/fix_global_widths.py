from pathlib import Path
import json,shutil
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent;src=P/'global-route.kicad_pcb';out=P/'global-route-widths.kicad_pcb'
for ext in ['.kicad_pro','.kicad_dru']:shutil.copyfile(src.with_suffix(ext),out.with_suffix(ext))
b=k.LoadBoard(str(src));report=json.loads(src.with_suffix('.drc.json').read_text());remove={i['uuid'] for v in report['violations'] if v['type']=='via_dangling' for i in v['items']};fixed=[]
for t in list(b.GetTracks()):
 if t.m_Uuid.AsString() in remove:assert t.GetNetname() not in ['/USB_DP','/USB_DM'];b.DeleteNative(t)
 elif not isinstance(t,k.PCB_VIA) and t.GetWidth()<k.FromMM(.1):
  assert t.GetNetname() not in ['/USB_DP','/USB_DM'];fixed.append(t.m_Uuid.AsString());t.SetWidth(k.FromMM(.1))
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(out),b);print('minimum-width fixes',len(fixed),'dangling-via removals',len(remove))
