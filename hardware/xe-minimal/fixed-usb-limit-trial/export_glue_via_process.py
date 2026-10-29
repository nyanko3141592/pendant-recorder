import pcbnew as k,wx,json,hashlib,csv
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent/'glue-case-trial';f=O/'pendant-xe-minimal.kicad_pcb';h=hashlib.sha256(f.read_bytes()).hexdigest();D=O/('fabrication-review-'+h[:12]);assert D.is_dir();b=k.LoadBoard(str(f));rows=[]
for v in b.GetTracks():
 if not isinstance(v,k.PCB_VIA):continue
 rows.append({'uuid':v.m_Uuid.AsString(),'net':v.GetNetname(),'x_mm':k.ToMM(v.GetPosition().x),'y_mm':k.ToMM(v.GetPosition().y),'drill_mm':k.ToMM(v.GetDrillValue()),'copper_mm':k.ToMM(v.GetWidth(k.F_Cu)),'filling_mode':int(v.GetFillingMode()),'capping_mode':int(v.GetCappingMode()),'filled':v.GetFillingMode()==k.FILLING_MODE_FILLED,'capped':v.GetCappingMode()==k.CAPPING_MODE_CAPPED})
rows.sort(key=lambda x:(x['x_mm'],x['y_mm']));out={'status':'DESIGN_INTENT_NOT_FABRICATOR_APPROVAL','source_pcb_sha256':h,'via_count':len(rows),'explicit_filled_capped_count':sum(x['filled'] and x['capped'] for x in rows),'vias':rows,'limitations':['Unspecified modes do not mean approved open or tented process','Requires fresh pad-overlap audit for this candidate; historical counts do not qualify it','Fabricator must confirm fill/cap plan, drill registration and solderability before release']};(D/'via-process-intent.json').write_text(json.dumps(out,indent=2)+'\n');print(out['via_count'],out['explicit_filled_capped_count'])
