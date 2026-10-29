"""Local BAT_ADC filter relocation, including replacement of its old ground stub."""
import pcbnew as k,wx
app=wx.App(False)
from pathlib import Path
import json,math,shutil,subprocess
O=Path(__file__).resolve().parent;src=O/'pendant-xe-minimal';dst=O/'adc-filter-q5-shift-candidate'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
results=[];accepted=None
# Pad 1 on the existing horizontal MCU escape, then short ground via.
for shift in [(-.8,0),(-1.2,0),(-1.6,0),(0,1.0),(0,1.5),(0,2.0)]:
 x=12.0
 for angle in [270]:
  for dx,dy in [(-.65,0)]:
   b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));f=next(f for f in b.GetFootprints() if f.GetReference()=='C28');pads={p.GetNumber():p for p in f.Pads()};p,q=pads['1'],pads['2']
   old=next(t for t in b.GetTracks() if t.m_Uuid.AsString()=='18cd808b-7bb5-4557-8489-1de786124f5e');b.RemoveNative(old)
   f.Flip(f.GetPosition(),k.FLIP_DIRECTION_LEFT_RIGHT);f.SetOrientationDegrees(angle);pos=f.GetPosition();a=p.GetPosition();target=k.VECTOR2I(k.FromMM(x),k.FromMM(5.5175));f.SetPosition(pos+target-a)
   ground=q.GetPosition();vpos=k.VECTOR2I(ground.x+k.FromMM(dx),ground.y+k.FromMM(dy))
   for start,end,net in [(target,k.VECTOR2I(k.FromMM(11.815),k.FromMM(5.5175)),p.GetNet()),(ground,vpos,q.GetNet())]:
    if start==end:continue
    t=k.PCB_TRACK(b);t.SetStart(start);t.SetEnd(end);t.SetLayer(k.F_Cu);t.SetWidth(k.FromMM(.15));t.SetNet(net);b.AddNative(t);t.thisown=False
   v=k.PCB_VIA(b);v.SetPosition(vpos);v.SetWidth(k.FromMM(.35));v.SetDrill(k.FromMM(.15));v.SetViaType(k.VIATYPE_THROUGH);v.SetLayerPair(k.F_Cu,k.B_Cu);v.SetNet(q.GetNet());b.AddNative(v);v.thisown=False
   q5=next(fp for fp in b.GetFootprints() if fp.GetReference()=='Q5');gp=next(pp for pp in q5.Pads() if pp.GetNumber()=='2');gpos=gp.GetPosition();stub=next(tt for tt in b.GetTracks() if tt.m_Uuid.AsString()=='be74a202-425e-434e-a9f7-e1eaf190213d');end=stub.GetEnd() if stub.GetStart()==gpos else stub.GetStart();end=k.VECTOR2I(end.x,end.y);b.RemoveNative(stub)
   q5.SetPosition(q5.GetPosition()+k.VECTOR2I(k.FromMM(shift[0]),k.FromMM(shift[1])))
   tt=k.PCB_TRACK(b);tt.SetStart(gp.GetPosition());tt.SetEnd(end);tt.SetLayer(k.F_Cu);tt.SetWidth(k.FromMM(.15));tt.SetNet(gp.GetNet());b.AddNative(tt);tt.thisown=False
   k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
   subprocess.run(['/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli','pcb','drc',str(dst.with_suffix('.kicad_pcb')),'--schematic-parity','--format','json','--severity-all','-o',str(O/'adc-filter-q5-shift-drc.json')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
   r=json.loads((O/'adc-filter-q5-shift-drc.json').read_text());ok=not r['violations'] and not r['schematic_parity'] and len(r['unconnected_items'])==69
   result={'q5_shift_mm':shift,'pad1_mm':[x,5.5175],'angle':angle,'ground_via_mm':[k.ToMM(vpos.x),k.ToMM(vpos.y)],'violations':len(r['violations']),'types':sorted(set(v['type'] for v in r['violations'])),'unconnected':len(r['unconnected_items']),'accepted':ok};results.append(result);print(result,flush=True)
   if ok:accepted=result;break
  if accepted:break
 if accepted:break
(O/'adc-filter-q5-shift-review.json').write_text(json.dumps({'accepted':accepted,'trials':results,'qualification':'Layout candidate only; ADC settling, noise, accuracy and mechanical clearance require verification.'},indent=2)+'\n')
