from pathlib import Path
import json,copy,shutil
P=Path(__file__).parent; S=P.parent/'compact-100-v5'
d=json.loads((S/'design.json').read_text());d['revision']='mini-usb-v9'
remove={'U6','U9','C18','C19','C23','C24','R17','TP4','D1','R5','Q1','D2','R16','Q2'}
d['parts']=[p for p in d['parts'] if p['ref'] not in remove]; ps={p['ref']:p for p in d['parts']}
def pin(n,name,net,t='passive'):return dict(number=str(n),name=name,net=net,type=t)
for p in ps['U1']['pins']:
 if p['net'] in ['MIC_WAKE','MIC_THSEL','MIC_EN','REC_LED']:p['net']=None
ps['U8'].update(value='IM69D130V01XTSA1',footprint='Sensor_Audio:Infineon_PG-LLGA-5-1',pins=[pin(1,'DATA','PDM_DATA','output'),pin(2,'VDD','V3V3','power_in'),pin(3,'CLOCK','PDM_CLK','input'),pin(4,'SELECT','GND','input'),pin(5,'GND','GND','power_in')],note='Direct 3.3V PDM, bottom port; no AAD. 0.768MHz/decimation48 candidate for 16kHz; acoustic validation required.')
ps['C22']['pins'][0]['net']='V3V3'
ps['U3'].update(value='BQ25185DLHR',footprint='Package_DFN_QFN:Texas_DLH0010A_WSON-10-1EP_2.2x2mm_P0.4mm_EP0.9x1.5mm',pins=[pin(1,'SYS','SYS','power_out'),pin(2,'BAT','BAT','passive'),pin(3,'STAT2',None,'open_collector'),pin(4,'CE_N','CHG_INHIBIT_GATE','input'),pin(5,'GND','GND','power_in'),pin(6,'TS_MR','CHARGER_TS','input'),pin(7,'ILIM_VSET','ILIM_VSET','input'),pin(8,'ISET','ISET','input'),pin(9,'STAT1','CHG_N','open_collector'),pin(10,'IN','VBUS','power_in'),pin(11,'EP','GND','passive')],note='Integrated power path; 4.2V/100mA input via24k; 20mA charge via15k. Independent U12/Q4 battery NTC guard retained; internal TS biased10k is NOT battery temperature sensing.')
ps['R10']['value']='15k 1%';ps['R11']['value']='20k 1%';ps['C15']['value']='10u 10V effective >=1u';ps['C15']['note']='SYS cap per TI; DC-bias capacitance must be qualified.'
ps['J2']['value']='0781710003 / 100mAh protected NTC pack TBD'
ps['J2']['note']='15x17x6 pack envelope retained; vendor NTC/finished connector and harness unqualified.'
ps['D6']['note']='Single status/battery indicator; firmware blinks on demand, normally dark.'
ps['U11'].update(value='CSNP4GCR01-DPW',footprint='Pendant:CSNP4GCR01_DPW_LGA8',note='512MiB nominal, SPI. Same pin assignment as previous; package drawing checked. Out of stock at LCSC; capacity must be read from CSD. One-day ADPCM capacity only, no auto-delete.')
for r,value,net,base in [('R42','24k 1%','ILIM_VSET','R10'),('C30','10n tentative','ISET','C28')]:
 p=copy.deepcopy(ps[base]);p.update(ref=r,value=value,note='BQ25185 reference application; verify tolerance and low-current startup RC.');p['pins'][0]['net']=net;d['parts'].append(p)
# Open-drain comparator outputs share a gate clamp: either fault overrides MCU permission.
ps['U12']['value']='TLV7042DDFR'
for p in ps['U12']['pins']:
 if p['number'] in ['1','7']:p.update(net='CHG_GUARD_GATE',type='open_collector')
ps['U12']['note']='Open-drain outputs wired together. Either temperature fault pulls Q4 gate low; no firmware override. 10k/B3370 pack assumption remains unqualified.'
ps['Q4']['pins'][0]['net']='CHG_GUARD_GATE';ps['Q4']['pins'][2]['net']='CHG_INHIBIT_GATE'
ps['R36']['pins'][0]['net']='CHG_GUARD_GATE'
p=copy.deepcopy(ps['R10']);p.update(ref='R43',value='10k 1%',note='MCU permission series resistor; limits current into comparator fault clamp.')
p['pins'][0]['net']='CHG_ALLOW';p['pins'][1]['net']='CHG_GUARD_GATE';d['parts'].append(p)
d['parts']=[p for p in d['parts'] if p['ref'] not in ['Q5','Q6']]
(P/'design.json').write_text(json.dumps(d,indent=2)+'\n')
for name in ['Pendant.pretty','PendantD1.pretty']:shutil.copytree(S/name,P/name,dirs_exist_ok=True)
s=(S/'Pendant.pretty/CSNP32GCR01_LGA8.kicad_mod').read_text().replace('CSNP32GCR01_LGA8','CSNP4GCR01_DPW_LGA8').replace('-3.1','-3.0').replace('4.0 3.1','4.0 3.0').replace('-3.35','-3.25').replace('4.25 3.35','4.25 3.25').replace('(at 0 2.6)','(at 0 2.5)')
(P/'Pendant.pretty/CSNP4GCR01_DPW_LGA8.kicad_mod').write_text(s)
s=(S/'generate_schematic.py').read_text().replace("'compact-100-v5'","'mini-usb-v9'").replace("['GND','VDDA','VBUS','SYS']","['GND','VDDA','VBUS']")
(P/'generate_schematic.py').write_text(s)
s=(S/'fp-lib-table').read_text().replace('\n)\n','\n(lib (name "Sensor_Audio") (type "KiCad") (uri "${KICAD10_FOOTPRINT_DIR}/Sensor_Audio.pretty") (options "") (descr ""))\n)\n');(P/'fp-lib-table').write_text(s)
shutil.copy(S/'pendant-compact-100-v5.kicad_pro',P/'pendant-mini-usb-v9.kicad_pro')
# Remove failed downloads generated during source research; not documents.
for name in ['mp34dt06j.pdf','im69d130.pdf']:
 f=P/'reference'/name
 if f.exists() and not f.read_bytes().startswith(b'%PDF'):f.unlink()
print(len(d['parts']),'footprints',len(d['parts'])-6,'populated')
