#!/usr/bin/env python3
"""Generate review-only package footprints and map the A1 electrical draft to them."""
import json, math
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]; OUT=ROOT/'hardware/rev-a'; LIB=OUT/'Pendant.pretty'
LIB.mkdir(exist_ok=True)
def fp(name,w,h,pads,extra=''):
 text=f'''(footprint "{name}" (version 20240108) (generator pcbnew) (layer "F.Cu")
 (attr smd)
 (fp_text reference "REF**" (at 0 {-h/2-.7}) (layer "F.SilkS") (effects (font (size .6 .6) (thickness .1))))
 (fp_text value "{name}" (at 0 {h/2+.7}) (layer "F.Fab") (effects (font (size .6 .6) (thickness .1))))
 (fp_rect (start {-w/2} {-h/2}) (end {w/2} {h/2}) (stroke (width .1) (type default)) (fill none) (layer "F.Fab"))
 (fp_rect (start {-w/2-.25} {-h/2-.25}) (end {w/2+.25} {h/2+.25}) (stroke (width .05) (type default)) (fill none) (layer "F.CrtYd"))
'''
 for n,x,y,sx,sy in pads:
  shape='circle' if sx==sy else 'rect'
  text+=f'(pad "{n}" smd {shape} (at {x} {y}) (size {sx} {sy}) (layers "F.Cu" "F.Paste" "F.Mask"))\n'
 (LIB/(name+'.kicad_mod')).write_text(text+extra+'\n)\n')
def grid(name,rows,cols,pitch,w,h,d):
 fp(name,w,h,[(chr(65+r)+str(c+1),(c-(cols-1)/2)*pitch,(r-(rows-1)/2)*pitch,d,d) for r in range(rows) for c in range(cols)])
grid('BQ25101_YFP6',3,2,.4,.91,1.608,.23)
grid('TPS22916_YFP4',2,2,.4,.81,.81,.23)
grid('TXS0104E_YZT12',4,3,.5,1.39,1.89,.23)
# Manufacturer top-view pad positions, plus unnumbered mechanical land in package drawing.
fp('CSNP32GCR01_LGA8',8,6.2,[(str(i+1),-3.5,-1.905+1.27*i,.8,.7) for i in range(4)]+[(str(8-i),3.5,-1.905+1.27*i,.8,.7) for i in range(4)]+[('',0,2.6,.7,.8)])
# T5838 bottom-view drawing mirrored into top-side board coordinates.
pads=[('1',1.364,-.8375,.522,.725),('2',.542,-.8375,.522,.725),('7',1.364,.8375,.522,.725),('6',.542,.8375,.522,.725),('4',-1.475,-1.05,.3,.3),('5',-1.475,1.05,.3,.3)]
# Four copper arcs form the annular ground pad. Paste has four 0.1mm slots.
extra='(pad "" np_thru_hole circle (at -.71 0) (size .6 .6) (drill .6) (layers "*.Cu" "*.Mask"))\n'
for i in range(4):
 a=i*math.pi/2; b=a+math.pi/2
 ax=.6625*math.cos(a);ay=.6625*math.sin(a)
 def xy(t,r):return f'{r*math.cos(t)-ax:.6f} {r*math.sin(t)-ay:.6f}'
 extra+=f'''(pad "3" smd custom (at {-.71+ax:.6f} {ay:.6f}) (size .01 .01) (layers "F.Cu" "F.Mask") (options (clearance outline) (anchor circle)) (primitives (gr_arc (start {xy(a,.6625)}) (mid {xy((a+b)/2,.6625)}) (end {xy(b,.6625)}) (width .3))))\n'''
 # Paste quadrants as polygons: annular radii .5625/.8125, angular slots approx .1.
 pts=[]
 for j in range(17):
  t=a+.075+(math.pi/2-.15)*j/16;pts.append((-.71+.8125*math.cos(t),.8125*math.sin(t)))
 for j in range(16,-1,-1):
  t=a+.09+(math.pi/2-.18)*j/16;pts.append((-.71+.5625*math.cos(t),.5625*math.sin(t)))
 extra+='(fp_poly (pts '+' '.join(f'(xy {x:.6f} {y:.6f})' for x,y in pts)+') (stroke (width 0) (type default)) (fill solid) (layer "F.Paste"))\n'
fp('T5838_LGA7_BottomPort',3.5,2.65,pads,extra)
fp('SWD_5Pad_Pogo',6.4,1.4,[(str(i+1),(i-2)*1.27,0,.8,.8) for i in range(5)])
# Pogo pads are copper/mask only, not paste.
p=LIB/'SWD_5Pad_Pogo.kicad_mod';p.write_text(p.read_text().replace('"F.Cu" "F.Paste" "F.Mask"','"F.Cu" "F.Mask"'))
data=json.loads((OUT/'design.json').read_text());data['revision']='A1 PLACEMENT DRAFT - NOT FOR FABRICATION'
mapping={
 'U1':'Package_QFP:LQFP-64_10x10mm_P0.5mm','U2':'Package_TO_SOT_SMD:SOT-23-6',
 'U3':'Pendant:BQ25101_YFP6','U4':'Package_TO_SOT_SMD:SOT-23-5','U5':'Package_TO_SOT_SMD:SOT-23-5','U6':'Package_TO_SOT_SMD:SOT-23-5',
 'U7':'Package_DFN_QFN:TDFN-8-1EP_2x2mm_P0.5mm_EP0.8x1.2mm','U8':'Pendant:T5838_LGA7_BottomPort','U9':'Pendant:TXS0104E_YZT12','U10':'Pendant:TPS22916_YFP4','U11':'Pendant:CSNP32GCR01_LGA8',
 'J1':'Connector_USB:USB_C_Receptacle_GCT_USB4105-xx-A_16P_TopMnt_Horizontal',
 'J2':'Connector_JST:JST_PH_S2B-PH-SM4-TB_1x02-1MP_P2.00mm_Horizontal','J3':'Connector:Tag-Connect_TC2030-IDC-NL_2x03_P1.27mm_Vertical',
 'Y1':'Crystal:Crystal_SMD_2012-2Pin_2.0x1.2mm','SW1':'Button_Switch_SMD:SW_SPST_B3U-1000P',
 'Q1':'Package_TO_SOT_SMD:SOT-23','Q2':'Package_TO_SOT_SMD:SOT-23','Q3':'Package_TO_SOT_SMD:SOT-23',
 'D2':'Diode_SMD:D_SOD-323','TH1':'Resistor_SMD:R_0402_1005Metric'}
for p in data['parts']:
 r=p['ref']; p['footprint']=mapping.get(r,p.get('footprint',''))
 if r.startswith('C'):p['footprint']='Capacitor_SMD:C_'+('0603_1608Metric' if r in ('C4','C5','C15','C27') else '0402_1005Metric')
 if r.startswith('R'):p['footprint']='Resistor_SMD:R_0402_1005Metric'
 if r.startswith('TP'):p['footprint']='TestPoint:TestPoint_Pad_D1.0mm'
 if r in ('D1','D3','D4','D5','D6','D2'):
  if r!='D2':p['footprint']='LED_SMD:LED_0402_1005Metric'
  # Standard KiCad diode/LED footprints number cathode=1, anode=2.
  for pin in p['pins']:pin['number']='1' if pin['name']=='K' else '2'
 if r=='J1':
  p['value']='USB4105-GF-A (candidate)'
  for pin in p['pins']:
   if pin['number']=='S1':pin['number']='SH'
 if r=='J2':
  p['value']='S2B-PH-SM4-TB(LF)(SN) / DTP401525 110mAh'
  p['pins']=[x for x in p['pins'] if x['number']!='3']
  p['note']='Two-pin PH pack connection. Confirm delivered polarity. TH1 is PCB-mounted thermal contact, no third battery wire.'
 if r=='J3':
  p['value']='TC2030-CTX-NL-STDC14 target pads'
  p['pins']=[{'number':str(i),'name':name,'net':net,'type':'passive' if net else 'no_connect'} for i,name,net in [(1,'VTref','V3'),(2,'SWDIO','SWDIO'),(3,'nRESET','NRST'),(4,'SWCLK','SWCLK'),(5,'GND','GND'),(6,'SWO unused',None)]]
  p['note']='TC2030 CTX mapping from vendor. SWO unused: PB3 reserved for ADF. VTref sense only. Reserve probe and rear retaining clip access; program before battery/case assembly.'
 if r=='U3':p['note']='BQ25101, 21.81mA nominal with 6.19k 1%; TS NTC must contact cell. Temperature/timeout validation pending.'
 if r=='R10':
  p['value']='6.19k 1%';p['note']='BQ25101: nominal 21.81mA; KISET max145 / (6190*0.99)=23.66mA < DTP max55mA. Standard pack charging approximately22mA.'
 if r=='TH1':p['note']='PCB-mounted NTC thermally coupled to pack through insulation. Position/contact/thermal response require validation; no hand-soldered harness.'
 if r=='SW1':p['value']='B3U-1000P (candidate)'
 if r=='D2':p['value']='BAT54WS (candidate; leakage/forward drop review pending)'
 if r=='Q1':p['value']='DMP2035U (candidate; power path review pending)'
 p['assembly_status']='UNCONFIRMED - JLC matching and stock required'
(OUT/'design.json').write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')
libs=sorted({p['footprint'].split(':')[0] for p in data['parts']})
(OUT/'fp-lib-table').write_text('(fp_lib_table\n'+''.join(f' (lib (name "{x}") (type "KiCad") (uri "'+('${KIPRJMOD}/Pendant.pretty' if x=='Pendant' else '${KICAD10_FOOTPRINT_DIR}/'+x+'.pretty')+'") (options "") (descr ""))\n' for x in libs)+')\n')
print('Updated',len(data['parts']),'parts; all mapped to footprints (verification pending).')
