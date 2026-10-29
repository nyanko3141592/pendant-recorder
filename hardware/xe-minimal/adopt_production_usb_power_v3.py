#!/usr/bin/env python3
"""Production-oriented USB power path: BQ25185 ILIM100 plus a standard 0R link."""
import json, math, subprocess
from pathlib import Path
import pcbnew as k
import wx

ROOT=Path(__file__).resolve().parent
BOARD=ROOT/'pendant-xe-minimal.kicad_pcb'
DESIGN=ROOT/'design.json'
PY='/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3'
REMOVE={'R48','R49','R50'}

def design():
 d=json.loads(DESIGN.read_text())
 d['parts']=[p for p in d['parts'] if p['ref'] not in REMOVE and p['ref']!='R51']
 for p in d['parts']:
  if p['ref'] in {'U3','C13','R12'}:
   for pin in p['pins']:
    if pin.get('net')=='VBUS': pin['net']='VBUS_CHARGER'
 d['parts'].append({
  'ref':'R51','value':'0R 1%','footprint':'Resistor_SMD:R_1206_3216Metric',
  'pins':[{'number':'1','name':'1','net':'VBUS_CHARGER','type':'passive'},
          {'number':'2','name':'2','net':'VBUS','type':'passive'}],
  'section':1,
  'note':'Standard 1206 zero-ohm production link replacing specialty USB limiter; JLC basic/passive candidate.',
  'assembly_status':'JLC_ASSEMBLY_REQUIRED'})
 DESIGN.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n')
 subprocess.run([PY,str(ROOT/'generate_schematic.py'),'xe-minimal',str(ROOT)],check=True)

def main():
 design(); app=wx.App(False); b=k.LoadBoard(str(BOARD))
 vbus=b.FindNet('/VBUS'); assert vbus
 chg=b.FindNet('/VBUS_CHARGER')
 if not chg:
  chg=k.NETINFO_ITEM(b,'/VBUS_CHARGER'); b.Add(chg)

 # Find the physically isolated former VBUS_LIMITED copper island from U3 IN.
 seed=b.FindFootprintByReference('U3').FindPadByNumber('10').GetPosition()
 tracks=list(b.GetTracks()); reached={(seed.x,seed.y)}; changed=True
 while changed:
  changed=False
  for t in tracks:
   if t.GetNetname()!='/VBUS': continue
   ends={(t.GetStart().x,t.GetStart().y),(t.GetEnd().x,t.GetEnd().y)}
   if ends & reached and not ends <= reached:
    reached |= ends; changed=True
 for t in tracks:
  ends={(t.GetStart().x,t.GetStart().y),(t.GetEnd().x,t.GetEnd().y)}
  if ends <= reached and t.GetNetname()=='/VBUS': t.SetNet(chg)
 for ref in ['U3','C13','R12']:
  fp=b.FindFootprintByReference(ref)
  for pad in fp.Pads():
   if pad.GetNetname()=='/VBUS': pad.SetNet(chg)

 # Remove obsolete MCU-control pull components.
 for ref in REMOVE:
  fp=b.FindFootprintByReference(ref)
  if fp: b.Delete(fp)

 # Fit a standard 1206 zero-ohm link over the former U13 site.  Signal copper may
 # pass under the insulated component body; only the pads occupy copper clearance.
 old=b.FindFootprintByReference('R51')
 if old: b.Delete(old)
 lib='/Applications/KiCad/KiCad.app/Contents/SharedSupport/footprints/Resistor_SMD.pretty'
 r=k.FootprintLoad(lib,'R_1206_3216Metric'); r.SetReference('R51'); r.SetValue('0R 1%')
 a=k.VECTOR2I(k.FromMM(12.7375),k.FromMM(1.05))
 z=k.VECTOR2I(k.FromMM(15.0125),k.FromMM(2.0))
 mid=k.VECTOR2I((a.x+z.x)//2,(a.y+z.y)//2)
 ang=math.degrees(math.atan2(z.y-a.y,z.x-a.x))
 r.SetPosition(mid); r.SetOrientationDegrees(ang); b.Add(r)
 r.FindPadByNumber('1').SetNet(chg); r.FindPadByNumber('2').SetNet(vbus)
 p1=r.FindPadByNumber('1').GetPosition(); p2=r.FindPadByNumber('2').GetPosition()
 for s,e,net in [(a,p1,chg),(z,p2,vbus)]:
  t=k.PCB_TRACK(b);t.SetStart(s);t.SetEnd(e);t.SetLayer(k.F_Cu);t.SetWidth(k.FromMM(.3));t.SetNet(net);b.Add(t)

 k.ZONE_FILLER(b).Fill(b.Zones()); k.SaveBoard(str(BOARD),b); del app
if __name__=='__main__': main()
