#!/usr/bin/env python3
"""Read-only order preflight. Never emits fabrication data or approves an order."""
import argparse,json,subprocess,tempfile,collections
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--kicad-cli',default='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli');ap.add_argument('--output',type=Path,required=True);args=ap.parse_args()
 folder=ROOT/'hardware/rev-a';reasons=[];metrics={}
 try:
  design=json.loads((folder/'design.json').read_text());sourcing=json.loads((folder/'sourcing-review.json').read_text());byref={p['ref']:p for p in sourcing['parts']}
  if set(byref)!={p['ref'] for p in design['parts']}:reasons.append('Sourcing records do not match design references')
  unresolved=[]
  for p in design['parts']:
   r=byref.get(p['ref'],{})
   if r.get('footprint')!=p['footprint'] or r.get('value')!=p['value']:reasons.append('Stale sourcing record: '+p['ref'])
   if r.get('procurement_status')!='PCB_FEATURE_NO_PURCHASE' and (not r.get('manufacturer_part_number') or not r.get('jlc_part_number') or r.get('assembly_accepted') is not True):unresolved.append(p['ref'])
  metrics['unresolved_procurement_refs']=unresolved
  if unresolved:reasons.append('Exact sourcing and assembly acceptance incomplete')
  if any(r.get('footprint_audit')!='PASS' for r in sourcing['parts']):reasons.append('Footprint audits incomplete')
  with tempfile.TemporaryDirectory() as td:
   for kind,file in [('erc','pendant-rev-a.kicad_sch'),('drc','pendant-rev-a.kicad_pcb')]:
    out=Path(td)/(kind+'.json');cmd=[args.kicad_cli,'sch' if kind=='erc' else 'pcb',kind,'--format','json','-o',str(out),str(folder/file)]
    cp=subprocess.run(cmd,capture_output=True,text=True)
    if cp.returncode or not out.exists():reasons.append(kind+' could not be checked');continue
    report=json.loads(out.read_text());violations=report.get('violations',[]);metrics[kind+'_violations']=len(violations)
    if violations:reasons.append(kind+' has violations')
    if kind=='drc':
     metrics['unconnected_items']=len(report.get('unconnected_items',[]))
     if metrics['unconnected_items']:reasons.append('PCB is not fully routed')
  # Human reviews must name the reviewed artifact hashes and evidence, not boolean assertions.
  reasons.extend(['No reviewed manufacturing release with immutable artifact hashes','No verified solder-free programming/measurement kit','No final enclosure/battery/NTC/plug fit acceptance'])
 except (OSError,ValueError,KeyError) as e:reasons.append('Preflight input/tool error: '+str(e))
 result={'status':'NOT_ORDER_READY' if reasons else 'REVIEW_REQUIRED','automatic_order_approval':False,'metrics':metrics,'blockers':reasons}
 args.output.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2));return 1 if reasons else 0
if __name__=='__main__':raise SystemExit(main())
