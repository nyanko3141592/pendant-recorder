"""Six-layer topology study; actual manufacturer stackup and impedance NOT configured."""
from pathlib import Path
import wx,pcbnew as k,shutil,json,hashlib
app=wx.App(False);P=Path(__file__).resolve().parent
src=P/'power-width-candidate.kicad_pcb';b=k.LoadBoard(str(src));b.SetCopperLayerCount(6)
mask=b.GetEnabledLayers();mask.AddLayer(k.In3_Cu);mask.AddLayer(k.In4_Cu);b.SetEnabledLayers(mask)
base=next(z for z in b.Zones() if z.GetLayer()==k.In1_Cu and z.GetNetname()=='/GND')
for layer in [k.In3_Cu,k.In4_Cu]:
 z=base.Duplicate(False);z.SetLayer(layer);b.Add(z)
b.GetDesignSettings().SetBoardThickness(k.FromMM(.8))
k.ZONE_FILLER(b).Fill(b.Zones());fn=P/'six-layer-topology-study.kicad_pcb';k.SaveBoard(str(fn),b);shutil.copyfile(P/'power-width-candidate.kicad_pro',fn.with_suffix('.kicad_pro'))
(P/'six-layer-topology-review.json').write_text(json.dumps({'status':'TOPOLOGY_STUDY_NOT_MANUFACTURING_RELEASE','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'candidate_sha256':hashlib.sha256(fn.read_bytes()).hexdigest(),'layers':b.GetCopperLayerCount(),'nominal_thickness_mm':.8,'manufacturer_source':'https://jlcpcb.com/6-layer-pcb','limitations':['Manufacturer supports 0.8 mm six-layer but actual laminate/impedance is not configured','Cost and stackup must be quoted before selection','Plane geometry and DRC do not establish USB signal integrity']},indent=2)+'\n')
