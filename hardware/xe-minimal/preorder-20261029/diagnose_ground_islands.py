from pathlib import Path
import pcbnew as k,wx,json,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'corridor-connected-clean.kicad_pcb';b=k.LoadBoard(str(src));rows=[]
for z in b.Zones():
 if z.GetNetname()=='/GND':
  rows.append({'layer':b.GetLayerName(z.GetLayer()),'original_mode':int(z.GetIslandRemovalMode()),'diagnostic_mode':int(k.ISLAND_REMOVAL_MODE_NEVER)});z.SetIslandRemovalMode(k.ISLAND_REMOVAL_MODE_NEVER)
out=w/'ground-islands-diagnostic.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
(w/'ground-islands-diagnostic.json').write_text(json.dumps({'status':'DIAGNOSTIC_FLOATING_COPPER_NOT_ADOPTED','zones':rows,'release_allowed':False},indent=2)+'\n')
