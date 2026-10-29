import pcbnew as k,wx,json,hashlib,shutil
from pathlib import Path
app=wx.App(False);O=Path(__file__).resolve().parent;src=O.parent/'pendant-xe-minimal';dst=O/'digital-rebuild-source'
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copyfile(src.with_suffix(ext),dst.with_suffix(ext))
b=k.LoadBoard(str(src.with_suffix('.kicad_pcb')));m=json.loads((O/'router-broad-manifest.json').read_text());movable=set(m['movable_existing_nets']);keep={'58d8777e-5726-406c-9002-92c3cbdf22de','d5f838d5-49c4-4b63-814d-c51369fbaf3e'};removed=[]
for t in list(b.GetTracks()):
 if t.GetNetname() in movable and t.m_Uuid.AsString() not in keep:
  removed.append(t.m_Uuid.AsString());b.RemoveNative(t)
 else:t.SetLocked(True)
k.ZONE_FILLER(b).Fill(b.Zones());k.SaveBoard(str(dst.with_suffix('.kicad_pcb')),b)
n=b.GetDesignSettings().m_NetSettings.GetDefaultNetclass();n.SetTrackWidth(k.FromMM(.15));n.SetViaDiameter(k.FromMM(.35));n.SetViaDrill(k.FromMM(.15))
p=O/'digital-rebuild.dsn';assert k.ExportSpecctraDSN(b,str(p));s=p.read_text().replace('(circuit\n','(circuit\n        (use_layer F.Cu In2.Cu In4.Cu B.Cu)\n').replace('(clearance 25 (type smd_smd))','(clearance 100 (type smd_smd))');p.write_text(s)
m.update(source=dst.name,source_sha256=hashlib.sha256(dst.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),canonical_source_sha256=hashlib.sha256(src.with_suffix('.kicad_pcb').read_bytes()).hexdigest(),removed_digital_items=len(removed),keep_via_uuids=sorted(keep),purpose='Rebuild digital routing from cleared digital nets, retaining all power/USB pair/RTC/temperature geometry and filled-capped vias. Isolated trial, not adopted.')
(O/'digital-rebuild-manifest.json').write_text(json.dumps(m,indent=2)+'\n');print('removed',len(removed))
