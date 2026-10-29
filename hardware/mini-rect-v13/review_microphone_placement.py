"""Current-board microphone pin/net and acoustic-hole review, not CPL approval."""
from pathlib import Path
import wx,pcbnew as k,json,hashlib
app=wx.App(False);p=Path(__file__).resolve().parent;f=p/'usb-ground-plane-candidate.kicad_pcb';b=k.LoadBoard(str(f));fp=next(x for x in b.GetFootprints() if x.GetReference()=='U8')
def optional_mm(v):return None if v is None else k.ToMM(v)
pads=[]
for a in fp.Pads():
 pos=a.GetPosition();size=a.GetSize();dr=a.GetDrillSize()
 pads.append(dict(number=a.GetNumber(),layers=[b.GetLayerName(l) for l in a.GetLayerSet().Seq()],shape_code=int(a.GetShape()),net=a.GetNetname(),xy_mm=[k.ToMM(pos.x),k.ToMM(pos.y)],size_mm=[k.ToMM(size.x),k.ToMM(size.y)],drill_mm=[k.ToMM(dr.x),k.ToMM(dr.y)],local_mask_margin_mm=optional_mm(a.GetLocalSolderMaskMargin()),local_paste_margin_mm=optional_mm(a.GetLocalSolderPasteMargin())))
h=json.loads((p/'usb-ground-plane-candidate.mechanical-handoff.json').read_text());ports=[x for x in h['acoustic_ports'] if x['ref']=='U8']
r=dict(status='PIN_NET_AND_PORT_REVIEW_NOT_JLC_ROTATION_APPROVAL',board_sha256=hashlib.sha256(f.read_bytes()).hexdigest(),footprint=str(fp.GetFPID().GetLibItemName()),rotation_deg=fp.GetOrientationDegrees(),side='B' if fp.IsFlipped() else 'F',pads=pads,model_ports=ports,manufacturer_pin_function={'1':'DATA','2':'VDD','3':'CLOCK','4':'SELECT','5':'GND'},manufacturer_pcb_sound_hole_diameter_mm=.8,manufacturer_doc='reference/infineon-im69d130-v1-timing.pdf',limitations=['Custom pad size is its anchor size, not full copper primitive outline; separate unnumbered pads include paste-only apertures','Local mask/paste None or0 does not prove final openings: board defaults and fabrication layer must be considered','Manufacturer recommends Solder Mask Defined pads; library/manufacturing adaptation not approved here','JLC component package zero-angle/pin1 orientation still needs supplier match','No real sound quality or seal validation'])
(p/'microphone-placement-review.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
