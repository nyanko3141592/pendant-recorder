from pathlib import Path
import json,hashlib,shutil
import pcbnew,wx
app=wx.App(False);P=Path(__file__).resolve().parent
src='storage-4gb-candidate';dst='storage-4gb-4u7-candidate'
b=pcbnew.LoadBoard(str(P/(src+'.kicad_pcb')))
f=next(f for f in b.GetFootprints() if f.GetReference()=='C27');assert f.GetValue()=='22u effective TBD'
f.SetValue('4.7u effective TBD');pcbnew.SaveBoard(str(P/(dst+'.kicad_pcb')),b)
s=(P/(src+'.kicad_sch')).read_text();old='(property "Value" "22u effective TBD"';assert s.count(old)==2
# Keep cached library default unchanged; replace the C27 instance value only.
i=s.rindex(old);s=s[:i]+s[i:].replace(old,'(property "Value" "4.7u effective TBD"',1)
(P/(dst+'.kicad_sch')).write_text(s);shutil.copyfile(P/(src+'.kicad_pro'),P/(dst+'.kicad_pro'))
j=json.loads((P/'sourcing-storage-4gb-candidate.json').read_text());j['C27']={'mpn':'CL10A475KP8NNNC','lcsc':'C1705','source':'https://jlcpcb.com/partdetail/C1705','note':'Same MPN as existing C5:4.7uF10VX5R0603; effectiveC/transient droop unqualified','assembly_accepted':False}
(P/'sourcing-storage-4gb-4u7-candidate.json').write_text(json.dumps(j,indent=2)+'\n')
(P/'storage-cap-candidate-change.json').write_text(json.dumps({'status':'BENCH_COMPARISON_NOT_RELEASED','source':src,'candidate':dst,'change':{'ref':'C27','before':'22uF C86295','after':'4.7uF C1705'},'layout_change':False,'source_sha256':hashlib.sha256((P/(src+'.kicad_pcb')).read_bytes()).hexdigest(),'reason':'Reduce switched-rail capacitor inrush without board growth; trade against transient hold-up','qualification_required':['Effective capacitance over3.3Vbias/temp','SD_V3 startup monotonicity and settling','Battery peak current including MCU/internal storage startup','SD_V3 minimum during write/erase/busy at low battery','Write errors/record continuity across voltage/temp','Battery vendor pulse limits and completed harness']},indent=2)+'\n')
print(P/dst)
