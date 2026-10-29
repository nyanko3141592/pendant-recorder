"""Integrate battery-side CSV samples; this never certifies recording continuity."""
import argparse,csv,hashlib,json,math
from pathlib import Path

def integrate(path, max_gap_s):
    if not math.isfinite(max_gap_s) or max_gap_s <= 0:
        raise ValueError('max gap must be positive and finite')
    charge=energy=duration=0.0; previous=None; count=0; gap_count=0; largest_gap=0.0
    minimum_v=math.inf; peak=0.0
    with path.open(newline='') as f:
        reader=csv.DictReader(f)
        if not {'time_s','current_mA','voltage_V'}.issubset(reader.fieldnames or []):
            raise ValueError('required columns: time_s,current_mA,voltage_V')
        for line,row in enumerate(reader,2):
            try: t,i,v=(float(row[k]) for k in ['time_s','current_mA','voltage_V'])
            except (TypeError,ValueError): raise ValueError(f'invalid numeric sample at line {line}')
            if not all(math.isfinite(x) for x in (t,i,v)) or t<0 or i<0 or v<=0:
                raise ValueError(f'invalid discharge sample at line {line}; negative current/charging is not supported')
            if previous is not None:
                pt,pi,pv=previous; dt=t-pt
                if dt<=0: raise ValueError(f'timestamps must strictly increase at line {line}')
                duration+=dt;largest_gap=max(largest_gap,dt)
                if dt>max_gap_s: gap_count+=1
                # Piecewise linear sample integration, including gaps but explicitly unqualified.
                charge+=(i+pi)*.5*dt/3600
                energy+=(i*v+pi*pv)*.5*dt/3600
            else: start=t
            previous=t,i,v;minimum_v=min(minimum_v,v);peak=max(peak,i);count+=1
    if count<2: raise ValueError('at least two samples required')
    return {'status':'CURRENT_TRACE_SUMMARY_NOT_RUNTIME_CERTIFICATION','samples':count,
      'start_time_s':start,'end_time_s':previous[0],'duration_h':duration/3600,
      'integrated_charge_mAh':charge,'integrated_energy_mWh':energy,
      'average_current_mA':charge*3600/duration,'sampled_peak_current_mA':peak,
      'sampled_minimum_voltage_V':minimum_v,'largest_sample_gap_s':largest_gap,
      'gap_limit_s':max_gap_s,'gap_violations':gap_count,
      'coverage_at_least_16h_without_gap_violation':duration>=57600 and gap_count==0,
      'runtime_pass':None,'source_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),
      'limits':['Sample integration is not a bandwidth or calibration guarantee; missed peaks are possible.',
      'Gap intervals are interpolated for arithmetic only; any gap violation invalidates continuous coverage.',
      'Requires battery-side measurement; rail current is not interchangeable.',
      'USB isolation, battery identity/charge procedure and continuous decrypted audio must be verified separately.',
      'No extrapolation from short runs or nominal 110mAh capacity.']}

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('csv',type=Path);parser.add_argument('--max-gap-s',type=float,required=True)
    parser.add_argument('--source-kind',choices=['measured','synthetic','unspecified'],default='unspecified')
    args=parser.parse_args()
    try:r=integrate(args.csv,args.max_gap_s)
    except (ValueError,OSError) as e:parser.exit(2,str(e)+'\n')
    r['source_kind_user_declared']=args.source_kind
    print(json.dumps(r,indent=2,allow_nan=False))
