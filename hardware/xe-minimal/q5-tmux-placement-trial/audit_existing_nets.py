from pathlib import Path
import pcbnew as k,wx,json,collections,hashlib
app=wx.App(False);r=Path('/Users/takahashinaoki/Dev/pendant-recorder');d=r/'hardware/xe-minimal/q5-tmux-placement-trial'
def audit(p):
 b=k.LoadBoard(str(p));rows=[]
 for t in b.GetTracks():
  if not isinstance(t,k.PCB_VIA):continue
  drill=k.ToMM(t.GetDrillValue());width=k.ToMM(t.GetWidth(k.F_Cu));rows.append({'uuid':t.m_Uuid.AsString(),'xy_mm':list(k.ToMM(t.GetPosition())),'net':t.GetNetname(),'diameter_mm':width,'drill_mm':drill,'nominal_annular_mm':round((width-drill)/2,6)})
 return rows

def items(path):
 b=k.LoadBoard(str(path));out={}
 for t in b.GetTracks():out[t.m_Uuid.AsString()]={'kind':type(t).__name__,'net':t.GetNetname()}
 for f in b.GetFootprints():
  for p in f.Pads():out[p.m_Uuid.AsString()]={'kind':'pad','ref':f.GetReference(),'number':p.GetNumber(),'net':p.GetNetname()}
 return out
old=items(r/'hardware/xe-minimal/pendant-xe-minimal.kicad_pcb');new=items(d/'ti-registered.kicad_pcb');diff=[{'uuid':i,'old':old[i],'new':new[i]} for i in old.keys()&new.keys() if old[i]['net']!=new[i]['net']];v={'status':'COMMON_UUID_NET_COMPARISON','changed_existing_item_nets':diff,'old_count':len(old),'new_count':len(new),'limits':'Added and removed geometry separately reviewed; UUID matching does not verify actual pinout or electrical operation.'};(d/'existing-item-net-diff.json').write_text(json.dumps(v,indent=2)+'\n');print(json.dumps(v,indent=2))
