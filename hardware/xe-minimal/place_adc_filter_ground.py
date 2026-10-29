"""Local BAT_ADC filter relocation, including replacement of its old ground stub."""
import pcbnew as k,wx
app=wx.App(False)
from pathlib import Path
import json,math,shutil,subprocess
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'adc-filter-ground-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
results=[];accepted=None
# Pad 1 on the existing horizontal MCU escape, then short ground via.
for x,y in [(11.2,3.8),(11,3.8),(10.8,3.8),(11.2,3.6),(11,3.6),(10.8,3.6)]:
 for angle in [180]:
  for dx,dy in [(0,.65),(0,-.65),(-.65,0),(.65,0)]:
   b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='C28');pads={p.GetNumber():p for p in f.Pads()};p,q=pads['1'],pads['2']
   old=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='18cd808b-7bb5-4557-8489-1de786124f5e');b.RemoveNative(old)
   f.Flip(f.GetPosition(),k.FLIP_DIRECTION_LEFT_RIGHT);f.SetOrientationDegrees(angle);pos=f.GetPosition();a=p.GetPosition();target=k.VECTOR2I(k.FromMM(x),k.FromMM(y));f.SetPosition(pos+target-a)
   ground=q.GetPosition();vpos=k.VECTOR2I(ground.x+k.FromMM(dx),ground.y+k.FromMM(dy))
   for start,end,net in [(ground,vpos,q.GetNet())]:
    if start==end:continue
    t=k.PCB_TRACK(b);t.SetStart(start);t.SetEnd(end);t.SetLayer(k.F_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(net);b.AddNative(t);t.thisown=False
   v=k.PCB_VIA(b);v.SetPosition(vpos);v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(q.GetNet());b.AddNative(v);v.thisown=False
   k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
   subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'adc-filter-ground-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
   r=json.loads((O/'adc-filter-ground-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==70
   result={'pad1_mm':[x,y],'angle':angle,'ground_via_mm':[k.ToMM(vpos.x),k.ToMM(vpos.y)],'violations':len(r['violations']),'types':sorted(set(v['type'] for v in r['violations'])),'unconnected':len(r['unconnected_items']),'accepted':ok};results.append(result);print(result,flush=True)
   if ok:accepted=result;break
  if accepted:break
 if accepted:break
(O/'adc-filter-ground-review.json').write_text(json.dumps({'accepted':accepted,'trials':results,'qualification':'Layout candidate only; ADC settling, noise, accuracy and mechanical clearance require verification.'},indent=2)+'\n')
