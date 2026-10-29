"""Destructive diagnostic copies only: identify plane recovery after removal of nearby power routes."""
from pathlib import Path
import wx,pcbnew as k,json,hashlib,subprocess,sys
app=wx.App(False);P=Path(__file__).resolve().parent
src=P/'usb-inner-dp-search-candidate.kicad_pcb';runs=[]
for name,nets in [('sys',['/SYS']),('vdda',['/VDDA']),('both',['/SYS','/VDDA'])]:
 b=k.LoadBoard(str(src));removed=[]
 for t in list(b.GetTracks()):
  if isinstance(t,k.PCB_VIA) or t.GetLayer()!=k.In2_Cu or t.GetNetname() not in nets:continue
  a,z=t.GetStart(),t.GetEnd();xmin,xmax=sorted([k.ToMM(a.x),k.ToMM(z.x)]);ymin,ymax=sorted([k.ToMM(a.y),k.ToMM(z.y)])
  if xmax<8.5 or xmin>13.5 or ymax<14 or ymin>18:continue
  removed.append({'uuid':t.m_Uuid.AsString(),'net':t.GetNetname()});b.DeleteNative(t)
 k.ZONE_FILLER(b).Fill(b.Zones());f=P/('DIAGNOSTIC-NOT-FOR-MANUFACTURE-usb-'+name+'.kicad_pcb');k.SaveBoard(str(f),b)
 subprocess.run([sys.executable,str(P/'review_usb_reference.py'),str(f)],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
 r=json.loads(f.with_suffix('.usb-reference-review.json').read_text());runs.append({'removed_nets':nets,'removed_tracks':removed,'B_reference':{row['net']:row['layers'].get('B.Cu') for row in r['rows']},'file':f.name})
out={'status':'DESTRUCTIVE_DIAGNOSTIC_ONLY_HAS_UNROUTED_NETS','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'runs':runs,'limitations':['Removed tracks break circuits; none of these boards can be ordered','Coverage is sampled geometry only, not impedance or signal integrity']}
(P/'usb-plane-obstacle-screen.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
