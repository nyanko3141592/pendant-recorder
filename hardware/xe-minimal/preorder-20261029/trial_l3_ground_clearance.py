from pathlib import Path
import pcbnew as k,wx,json,shutil
app=wx.App(False);w=Path(__file__).resolve().parent;src=w/'local-return-centered.kicad_pcb';b=k.LoadBoard(str(src))
for z in b.Zones():
 if not z.GetIsRuleArea() and z.GetNetname()=='/GND' and z.GetLayer()==k.In2_Cu:z.SetLocalClearance(k.FromMM(.11))
out=w/'l3-ground-011-trial.kicad_pcb';k.SaveBoard(str(out),b)
for ext in ['.kicad_pro','.kicad_dru','.kicad_sch']:shutil.copy2(src.with_suffix(ext),out.with_suffix(ext))
(w/'l3-ground-011-preparation.json').write_text(json.dumps({'status':'CLEARANCE_COMPARISON_NOT_ADOPTED','zone_clearance_mm':.11,'previous_mm':.15,'project_minimum_mm':.1,'manufacturer_multilayer_spacing_mm':.09,'manufacturer_inner_hole_to_copper_mm':.2,'source':'https://jlcpcb.com/capabilities/Capabilities','manufacturing_limits_require_final_geometry_verification':True,'release_allowed':False},indent=2)+'\n')
