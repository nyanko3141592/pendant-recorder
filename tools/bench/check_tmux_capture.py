#!/usr/bin/env python3
"""Screen a measured TMUX CSV capture; never certify the complete power circuit."""
import argparse,csv,json,math
from pathlib import Path

def check(path, uncertainty, max_gap):
    if not math.isfinite(uncertainty) or uncertainty < 0 or not math.isfinite(max_gap) or max_gap <= 0:
        raise ValueError('Invalid uncertainty or maximum sample gap')
    rows=list(csv.DictReader(path.open(newline='')))
    if len(rows)<2: raise ValueError('At least two samples required')
    issues=[];last=None;count=0;low=0;max_seen=0
    for line,row in enumerate(rows,2):
        try: t,v,d,s=map(float,(row['time_s'],row['vbus_V'],row['u16_d_V'],row['u16_sel_V']))
        except (KeyError,ValueError,TypeError) as e: raise ValueError(f'Invalid sample on CSV line {line}') from e
        if not all(map(math.isfinite,(t,v,d,s))): raise ValueError(f'Non-finite sample on CSV line {line}')
        if last is not None:
            gap=t-last
            if gap<=0: raise ValueError('Times must strictly increase')
            max_seen=max(max_seen,gap)
            if gap>max_gap: issues.append({'line':line,'time_s':t,'kind':'sample_gap','gap_s':gap})
        last=t
        if v+uncertainty>5.5:
            issues.append({'line':line,'time_s':t,'kind':'VDD_recommended_ceiling_not_demonstrated','vbus_V':v})
        # Each voltage has independent +/-uncertainty; D-VBUS has +/-2u worst case.
        if d-uncertainty < -.5 or d+uncertainty > v-uncertainty+.5:
            issues.append({'line':line,'time_s':t,'kind':'D_absolute_envelope_not_demonstrated','vbus_V':v,'d_V':d})
        if 1.08+uncertainty<=v<=5.5-uncertainty:
            count+=1
            if d-uncertainty<0 or d+uncertainty>v-uncertainty:
                issues.append({'line':line,'time_s':t,'kind':'D_recommended_envelope_not_demonstrated','vbus_V':v,'d_V':d})
        else: low+=1
        # Fail-safe SEL recommended ceiling; no statement about analog powered-off isolation.
        if s+uncertainty>5.5 or s-uncertainty<0:
            issues.append({'line':line,'time_s':t,'kind':'SEL_recommended_envelope_not_demonstrated','sel_V':s})
    return {'status':'CAPTURE_REQUIRES_REVIEW' if issues else 'NO_OBSERVED_EXCURSION_NOT_CIRCUIT_QUALIFICATION','source':str(path.resolve()),'samples':len(rows),'samples_with_supply_demonstrably_in_recommended_range':count,'samples_outside_or_uncertain_supply_range':low,'voltage_uncertainty_per_channel_V':uncertainty,'maximum_observed_sample_gap_s':max_seen,'issues':issues,'limitations':['No interpolation can rule out unobserved between-sample spikes','Boundary uncertainty is flagged conservatively; a flag is not proof of actual overstress','No USB current, SETI transfer function, probe bandwidth or recording-integrity qualification','Measured inputs and calibration must be provided; synthetic runs are software checks only']}

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('capture',type=Path);p.add_argument('--uncertainty-v',type=float,required=True);p.add_argument('--max-gap-s',type=float,required=True);p.add_argument('--output',type=Path,required=True);a=p.parse_args()
    try:r=check(a.capture,a.uncertainty_v,a.max_gap_s)
    except (ValueError,OSError) as e:p.error(str(e))
    a.output.write_text(json.dumps(r,indent=2)+'\n');print(r['status'])
if __name__=='__main__':main()
