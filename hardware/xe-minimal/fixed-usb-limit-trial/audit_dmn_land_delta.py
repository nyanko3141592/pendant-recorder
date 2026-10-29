from pathlib import Path
import pcbnew as k,wx,json,hashlib
app=wx.App(False);O=Path(__file__).resolve().parent
paths=[O/n/'pendant-xe-minimal.kicad_pcb' for n in ['usb-reference-via-small-trial','dmn-land-trial']];bs=[k.LoadBoard(str(p)) for p in paths]
def xy(p):return [p.x,p.y]
def track(t):
 v=isinstance(t,k.PCB_VIA)
 return [t.GetNetname(),t.GetLayer(),xy(t.GetStart()),xy(t.GetEnd()),t.GetWidth(t.TopLayer()) if v else t.GetWidth(),v,t.GetDrillValue() if v else None,t.GetFillingMode() if v else None,t.GetCappingMode() if v else None]
ts=[{t.m_Uuid.AsString():track(t) for t in b.GetTracks()} for b in bs];assert ts[0].keys()==ts[1].keys()
changed={u:{'before':ts[0][u],'after':ts[1][u]} for u in ts[0] if ts[0][u]!=ts[1][u]}
for c in changed.values():
 a,b=c['before'],c['after'];assert all(a[i]==b[i] for i in [0,1,4,5,6,7,8]);assert not b[5];assert b[0] in ['/GND','/USB_SUSPEND_PULSE','/USB_RESUME_PULSE','/USB_LATCH_CLOCK','/USB_LATCH_CLEAR_N']
def fp(f):return [xy(f.GetPosition()),f.GetOrientationDegrees(),f.GetLayer(),f.GetValue(),[str(f.GetFPID().GetLibNickname()),str(f.GetFPID().GetLibItemName())],sorted((p.GetNumber(),p.GetNetname(),xy(p.GetPosition()),xy(p.GetSize()),p.GetShape()) for p in f.Pads())]
fs=[{f.GetReference():fp(f) for f in b.GetFootprints()} for b in bs];assert fs[0].keys()==fs[1].keys();assert all(fs[0][r]==fs[1][r] for r in fs[0] if r not in ('Q6','Q7'))
for r in ['Q6','Q7']:assert fs[0][r][:4]==fs[1][r][:4]
rows=[]
for f in bs[1].GetFootprints():
 if f.GetReference() not in ['Q6','Q7']:continue
 for p in f.Pads():
  assert p.GetShape()==k.PAD_SHAPE_RECT
  assert xy(p.GetSize())==[900000,800000]
  rows.append({'ref':f.GetReference(),'pad':p.GetNumber(),'size_mm':[.9,.8],'layers':p.GetLayerSet().FmtBin(),'local_paste_margin_mm':None if p.GetLocalSolderPasteMargin() is None else k.ToMM(p.GetLocalSolderPasteMargin()),'local_paste_ratio':p.GetLocalSolderPasteMarginRatio()})
r={'status':'GEOMETRY_DELTA_VERIFIED_NOT_ASSEMBLY_APPROVAL','sha256':{p.parent.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in paths},'unchanged_other_footprints':len(fs[0])-2,'changed_tracks':changed,'pads':rows,'limits':['Track net/layer/width and all via geometry/process flags unchanged; filled zone geometry may change with pads','Pad layer membership/local paste settings recorded; exported stencil aperture and process not yet qualified','Generic body model and retained courtyard/silk require separate physical review']};(paths[1].parent/'land-delta-review.json').write_text(json.dumps(r,indent=2)+'\n');print('other footprints unchanged',len(fs[0])-2,'changed track endpoints',len(changed))
