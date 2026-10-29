import pcbnew as k,wx,shutil,json,hashlib
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O/'pa15-button-complete-candidate'
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')))
movable={'/SD_EN','/SD_MOSI','/SD_MISO','/SD_CS_N','/BUTTON_N','/NRST'}
for t in b.GetTracks():t.SetLocked(t.GetNetname() not in movable)
n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetTrackWidth(k.FromMM(.15));n.SetViaDiameter(k.FromMM(.35));n.SetViaDrill(k.FromMM(.15))
assert k.ExportSpecctraDSN(b,str(O/'pa15-router-screen.dsn'))
p=O/'pa15-router-screen.dsn';s=p.read_text();s=s.replace('(circuit\n','(circuit\n        (use_layer F.Cu In2.Cu In4.Cu B.Cu)\n');s=s.replace('(clearance 25 (type smd_smd))','(clearance 100 (type smd_smd))');p.write_text(s)
(O/'router-screen-manifest.json').write_text(json.dumps({'source':src.name,'source_sha256':hashlib.sha256(src.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),'purpose':'Isolated routing experiment; no adoption. Existing wires preserved by exporter; verify fix types and rule translation before routing.','movable_existing_nets':sorted(movable),'fixed_existing_nets':'All others, including USB, power, RTC, PDM and temperature guard','routing_width_mm':.15,'via_diameter_drill_mm':[.35,.15],'reserved_plane_layers':['In1.Cu','In3.Cu'],'pending':['Inspect DSN defaults and fixed critical wires','Run local Freerouting','Import into copy and full KiCad DRC/parity','Check electrical routing and manufacturing constraints']},indent=2)+'\n')
print('Exported',p)
