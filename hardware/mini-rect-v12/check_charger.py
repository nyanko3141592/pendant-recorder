from pathlib import Path
import json,hashlib,wx
app=wx.App(False)
import pcbnew as k
P=Path(__file__).parent;src=P/'usb-return-candidate.kicad_pcb';b=k.LoadBoard(str(src))
expected={'U3':{'1':'SYS','2':'BAT','4':'CHG_INHIBIT_GATE','5':'GND','6':'CHARGER_TS','7':'ILIM_VSET','8':'ISET','9':'CHG_N','10':'VBUS','11':'GND'},'R10':{'1':'ISET','2':'GND'},'R42':{'1':'ILIM_VSET','2':'GND'},'R11':{'1':'V3V3','2':'CHG_N'},'C30':{'1':'ISET','2':'GND'}}
values={}
for ref,nets in expected.items():
 f=next(f for f in b.GetFootprints() if f.GetReference()==ref)
 actual={p.GetNumber():p.GetNetname().lstrip('/') for p in f.Pads()}
 for pin,net in nets.items():assert actual[pin]==net,(ref,pin,actual)
 values[ref]=f.GetValue()
assert values['R10']=='15k 1%' and values['R42']=='24k 1%' and values['R11']=='20k 1%'
r={'board_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'source':'https://www.ti.com/lit/ds/symlink/bq25185.pdf','revision':'SLUSF65B August 2026','matched_pad_nets':expected,'values':values,'pin_match':True,'settings':{'battery_V_nominal':4.2,'input_limit_mA_nominal':100,'input_limit_mA_min_typ_max_at_5V':[80,90,98],'charge_mA_nominal':20,'termination_mA_nominal':2,'iset_factor_and_1pct_resistor_only_mA_range':[285/15150*1000,315/14850*1000]},'evidence':['Table4-1 p4 pin functions','Table6-1 p16 24k=4.2V/ILIM100','Electrical characteristics p6-7 input limit and KISET','Section6.1.1.5 termination10percent'], 'remaining':['20mA complete accuracy not inferred from >=40mA accuracy line; battery acceptance pending','Low-current ISET 10n RC and detection timing qualification','SYS effective capacitor >=1uF after DC bias; nominal >=10uF','Input load+charge budget must use80mA limit minimum, not100mA','PCB land pattern/thermal performance/CE startup transient not qualified'],'qualified':False}
(P/'charger-review.json').write_text(json.dumps(r,indent=2)+'\n')
print('PASS: charger connected pins and resistor values; qualification incomplete')
