"""Check intended route-only delta and conservative added-trace resistance scenario."""
from pathlib import Path
import pcbnew as k,wx,json,hashlib,math
app=wx.App(False);O=Path(__file__).resolve().parent;paths=[O/x/'pendant-xe-minimal.kicad_pcb'for x in ['material-dk-trial','power-usb-detour-trial']];bs=[k.LoadBoard(str(p))for p in paths]
def xy(p):return [p.x,p.y]
def desc(t):
 via=isinstance(t,k.PCB_VIA)
 return [t.GetNetname(),t.GetLayer(),xy(t.GetStart()),xy(t.GetEnd()),t.GetWidth(t.TopLayer())if via else t.GetWidth(),via,t.GetDrillValue()if via else None,t.GetFillingMode()if via else None,t.GetCappingMode()if via else None]
def fp(f):return [xy(f.GetPosition()),f.GetOrientationDegrees(),f.GetLayer(),str(f.GetValue()),str(f.GetFPID().GetLibNickname()),str(f.GetFPID().GetLibItemName()),sorted((str(p.GetNumber()),str(p.GetNetname()),xy(p.GetPosition()),xy(p.GetSize()),p.GetShape(),p.GetLayerSet().FmtBin())for p in f.Pads())]
fs=[{f.GetReference():fp(f)for f in b.GetFootprints()}for b in bs];assert fs[0]==fs[1]
ts=[{t.m_Uuid.AsString():desc(t)for t in b.GetTracks()}for b in bs]
common=ts[0].keys()&ts[1].keys();assert all(ts[0][u]==ts[1][u]for u in common)
removed={u:ts[0][u]for u in ts[0].keys()-ts[1].keys()};added={u:ts[1][u]for u in ts[1].keys()-ts[0].keys()}
assert len(removed)==7
assert all(not t[5]and t[0]in ['/NRST','/V3V3']for t in list(removed.values())+list(added.values()))
assert sum(t[5]for t in ts[0].values())==sum(t[5]for t in ts[1].values())
assert len(bs[0].Zones())==2 and len(bs[1].Zones())==3
power=[t for t in added.values()if t[0]=='/V3V3'];lengths=[math.dist(t[2],t[3])/1e6 for t in power];assert all(t[4]==k.FromMM(.25)for t in power)
length=sum(lengths);rho=.020 # ohm*mm2/m, an explicit engineering assumption, not qualified material data
rows=[]
for copper in [.0152,.012,.010]:
 resistance=rho*(length/1000)/(.25*copper)
 rows.append({'copper_thickness_mm_assumed':copper,'sum_of_added_power_trace_resistances_ohm':resistance,'drop_mV_at110mA_through_every_added_segment':resistance*.110*1000,'dissipation_mW_at110mA':resistance*.110**2*1000})
r={'status':'INTENDED_GEOMETRY_DELTA_AND_CONDITIONAL_RESISTANCE_SCREEN','source_sha256':{p.parent.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in paths},'unchanged_footprints':len(fs[0]),'unchanged_common_track_vias':len(common),'all_vias_unchanged':True,'USB_track_geometry_unchanged':True,'removed_tracks':removed,'added_tracks':added,'added_GND_zone_layer':'In4.Cu','power_estimate':{'resistivity_assumption_ohm_mm2_per_m':rho,'sum_added_length_mm':length,'width_mm':.25,'rows':rows},'limits':['Resistance estimates apply only to added trace segments, not the complete supply path','Applying110mA to each added segment is a conservative scenario; branch currents are not solved','Copper resistivity, thickness and etch width are assumptions, not fabrication tolerance bounds','Via resistance, regulator dropout, connector/protection drops, temperature and dynamic load remain separate','No claim of guaranteed battery runtime or USB impedance']}
(paths[1].parent/'route-delta-power-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:r[k]for k in ['unchanged_footprints','unchanged_common_track_vias','power_estimate']},indent=2))
