import json,shutil,subprocess,sys
from pathlib import Path
import wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).resolve().parent; R=P.parents[1]; S=R/'hardware/omi-fit-d1'
d=json.loads((S/'design.json').read_text());d['revision']='E0 stocked XE battery placement draft'
d['parts']=[p for p in d['parts'] if p['ref']!='TH1']
fp='Connector_Molex:Molex_Pico-EZmate_78171-0003_1x03-1MP_P1.20mm_Vertical'
for p in d['parts']:
 if p['ref']=='J2':
  p.update(value='0781710003 / DTP401525-XE',footprint=fp,note='Completed battery: 1 BAT+, 2 NTC, 3 GND. Charger temperature compatibility unresolved. Factory assembly required.')
  p['pins']=[dict(number=str(i),name=n,net=net,type='passive') for i,n,net in [(1,'PACK+','BAT'),(2,'PACK_NTC','BAT_TS'),(3,'PACK-','GND')]]
(P/'design.json').write_text(json.dumps(d,indent=2)+'\n')
# Existing generator uses D1 electrical flags and contact exclusion. Output is renamed for E.
subprocess.run([sys.executable,str(R/'hardware/tools/generate_schematic.py'),'omi-fit-d1',str(P)],check=True)
s=(P/'omi-fit-d1.kicad_sch').read_text().replace('omi-fit-d1','rev-e');(P/'pendant-rev-e.kicad_sch').write_text(s);(P/'omi-fit-d1.kicad_sch').unlink()
b=k.LoadBoard(str(S/'omi-fit-d1.kicad_pcb'))
for t in list(b.GetTracks()):b.Delete(t)
for z in list(b.Zones()):b.Delete(z)
for o in list(b.GetDrawings()):
 if o.GetLayer()==k.Edge_Cuts:b.Delete(o)
for f in list(b.GetFootprints()):
 if f.GetReference() in ['J2','TH1']:b.Delete(f)
for inherited in b.GetFootprints():inherited.Move(k.VECTOR2I(k.FromMM(-100),k.FromMM(-100)))
lib,name=fp.split(':')
foot=Path('/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints')/(lib+'.pretty')/(name+'.kicad_mod')
# Load through the board parser; packaged pcbnew's plugin wrapper is unavailable.
tmp=P/'footprint-import.kicad_pcb'
tmp.write_text('(kicad_pcb (version 20241229) (generator "pcbnew") (general (thickness 0.8)) (paper "A4") (layers (0 "F.Cu" signal) (31 "B.Cu" signal) (44 "Edge.Cuts" user)) '+foot.read_text()+')')
fb=k.LoadBoard(str(tmp)); f=k.FOOTPRINT(list(fb.GetFootprints())[0]);tmp.unlink()
f.SetReference('J2');f.SetValue('0781710003');f.Reference().SetVisible(False);f.Value().SetVisible(False);f.SetFPID(k.LIB_ID(lib,name));f.SetPosition(k.VECTOR2I(k.FromMM(0),k.FromMM(-14)))

for pad in f.Pads():
 net={'1':'BAT','2':'BAT_TS','3':'GND'}.get(pad.GetNumber())
 if net:pad.SetNet(b.FindNet('/'+net))
b.Add(f)
pts=[(-12.5,-17),(12.5,-17),(12.5,14),(-12.5,14)]
for a,c in zip(pts,pts[1:]+pts[:1]):
 o=k.PCB_SHAPE();o.SetShape(k.SHAPE_T_SEGMENT);o.SetLayer(k.Edge_Cuts);o.SetStart(k.VECTOR2I(*[k.FromMM(v) for v in a]));o.SetEnd(k.VECTOR2I(*[k.FromMM(v) for v in c]));o.SetWidth(k.FromMM(.05));b.Add(o)
k.SaveBoard(str(P/'pendant-rev-e.kicad_pcb'),b)
shutil.copy(S/'omi-fit-d1.kicad_pro',P/'pendant-rev-e.kicad_pro');shutil.copytree(S/'PendantD1.pretty',P/'PendantD1.pretty',dirs_exist_ok=True);shutil.copy(S/'fp-lib-table',P/'fp-lib-table')
table=P/'fp-lib-table'
t=table.read_text();t=t.replace('(fp_lib_table','(fp_lib_table\n(lib (name "Connector_Molex") (type "KiCad") (uri "${KICAD10_FOOTPRINT_DIR}/Connector_Molex.pretty") (options "") (descr ""))',1);table.write_text(t)
placements=[]
for f in b.GetFootprints():
 bb=f.GetBoundingBox(False,False);placements.append(dict(ref=f.GetReference(),x=k.ToMM(bb.GetCenter().x),y=k.ToMM(bb.GetCenter().y),w=k.ToMM(bb.GetWidth()),h=k.ToMM(bb.GetHeight()),side='B' if f.IsFlipped() else 'F'))
(P/'placement.json').write_text(json.dumps(placements,indent=2))
(P/'order-status.json').write_text(json.dumps(dict(order_ready=False,status='E0_UNROUTED_PLACEMENT_DRAFT',pcb_mm=[25,31,.8],tracks=0,limitations=['Charger temperature compatibility unresolved','Battery lead length, NTC curve, maximum outline not qualified','Routing and DFM incomplete','Connector sourcing and footprint review pending','Case is envelope study']),indent=2))
