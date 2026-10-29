"""Integrate timestamped discharge current. Never certifies runtime or true peaks.
CSV: time_s,current_mA. Usage: --channel battery|storage --max-gap-s LIMIT --allocation-ma VALUE file.csv
The user-supplied gap limit is a data-quality check, not instrument qualification.
"""
import argparse
import csv
import hashlib
import json
import math
from pathlib import Path


def analyze(samples, channel, max_gap_s, allocation_mA):
    if channel not in ('battery', 'storage') or not math.isfinite(max_gap_s) or max_gap_s <= 0:
        raise ValueError('Valid channel and positive finite max-gap-s required')
    if not math.isfinite(allocation_mA) or allocation_mA <= 0:
        raise ValueError('Explicit positive finite current allocation required')
    if len(samples) < 2:
        raise ValueError('At least two samples required')
    if any(not math.isfinite(t) or not math.isfinite(i) or i < 0 for t, i in samples):
        raise ValueError('Finite timestamps and nonnegative discharge current required')
    gaps = [b[0]-a[0] for a, b in zip(samples, samples[1:])]
    if min(gaps) <= 0:
        raise ValueError('Timestamps must strictly increase; duplicates are not averaged')
    if max(gaps) > max_gap_s:
        raise ValueError('Trace contains an interval exceeding max-gap-s')
    start, end = samples[0][0], samples[-1][0]
    duration = end-start
    count = int(duration // 5)
    periods = [0.0]*count
    total = 0.0
    for (ta, ia), (tb, ib) in zip(samples, samples[1:]):
        total += (ia+ib)*(tb-ta)/2
        first = max(0, int((ta-start)//5))
        last = min(count-1, int((tb-start)//5))
        for n in range(first, last+1):
            lo, hi = max(ta, start+5*n), min(tb, start+5*(n+1))
            if hi <= lo:
                continue
            il = ia+(ib-ia)*(lo-ta)/(tb-ta)
            ih = ia+(ib-ia)*(hi-ta)/(tb-ta)
            periods[n] += (il+ih)*(hi-lo)/2
    allocation = allocation_mA
    return dict(status='TRACE_SUMMARY_NOT_RUNTIME_QUALIFICATION', channel=channel,
                duration_s=duration, samples=len(samples), max_sample_interval_s=max(gaps),
                charge_mC=total, charge_mAh=total/3600, average_mA=total/duration,
                maximum_observed_sample_mA=max(i for _, i in samples),
                full_5s_windows=count, trailing_unwindowed_s=duration-count*5,
                window_charge_mC=periods,
                design_allocation_mA=allocation,
                windows_above_design_allocation=sum(q > allocation*5 for q in periods),
                runtime_16h_proven=False,
                limitations=['Linear interpolation between samples; missed pulses are not reconstructed.',
                             'Observed peak is not a bound on physical peak current.',
                             'Windows begin at first sample, not automatically at recording commits.',
                             'Current allocation is caller supplied, not measured cell capacity or a runtime guarantee.',
                             'Short traces cannot prove16h operation; boot/stop, voltage, temperature, bandwidth and media state require separate evidence.'])


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('csv', type=Path)
    p.add_argument('--channel', required=True, choices=['battery', 'storage'])
    p.add_argument('--max-gap-s', required=True, type=float)
    p.add_argument('--allocation-ma', required=True, type=float,
                   help='Explicit average-current design budget for the selected channel; not a measured capacity')
    args = p.parse_args()
    try:
        with args.csv.open(newline='') as f:
            rows = csv.DictReader(f)
            samples = [(float(r['time_s']), float(r['current_mA'])) for r in rows]
        result = analyze(samples, args.channel, args.max_gap_s, args.allocation_ma)
    except (ValueError, KeyError, OSError) as e:
        p.error(str(e))
    result['source_sha256'] = hashlib.sha256(args.csv.read_bytes()).hexdigest()
    print(json.dumps(result, indent=2, allow_nan=False))


if __name__ == '__main__':
    main()
