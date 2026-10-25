# Charge guard v4 — engineering prototype, not for order

Existing v3 remains unchanged for the separate fit-check chat. This revision adds12parts (87total) within18×33×0.8mm/6layers; case integration is not established. Final KiCad ERC0/DRC0/unconnected0/schematic parity0. Review `order-status.json` and the final DRC/ ERC reports rather than assuming completion from a router log.

## Electrical change

J2 pack NTC now feeds an independent ratiometric window comparator U12 (TLV7032DDFR). R37 excites the NTC from VBUS; R38/R39 and R40/R41 define provisional cold/hot thresholds. USB absence removes excitation, so these dividers do not consume battery current in intended operation.

U12A is high when NTC voltage is below the cold reference; U12B is high when above the hot reference. NTC open gives cold-not-OK; short gives hot-not-OK. The push-pull TLV7032 has POR-low outputs; the open-drain TLV7042 has POR-high-impedance and must NOT be substituted. [TI SLVSE13J, sections4.2,5.9,6.4](https://www.ti.com/lit/ds/symlink/tlv7042.pdf).

Q2 clamps charger TS low by default through R12's VBUS pull-up. Q4/Q5/Q6 form a series permission path to release Q2 only when MCU CHG_ALLOW and both comparator outputs are high. R36 keeps CHG_ALLOW low at reset. MCU GPIO is no longer directly tied to the inhibit gate; no5V GPIO pull-up is introduced. Body diode orientation of each series NMOS opposes the downward current when off.

Charger TS uses R35=10k to GND when released. This prevents the intended circuit from leaving TS floating. The existing BQ25101 permits TTDM with a floating/high TS, which disables temperature monitoring/timer/termination: [TI SLUSBV8C pin table](https://www.ti.com/lit/ds/symlink/bq25101.pdf). The NTC is no longer placed directly on that pin. Charge voltage/current regulation remains BQ25101; external guard replaces its temperature decision.

## What the analysis does and does not establish

`check_guard.py` checks actual net assignments, all8Boolean permission combinations, open/short faults, and resistor/comparator-error DC corners. Hypothetical R25=9..11k and beta2000..5000K produce conditional cold trips10.05..24.34°C and hot trips25.52..41.21°C. These are sensitivity bounds, NOT the actual XE temperature limits or a supplier-qualified guarantee. The broad uncertainty can leave only a narrow usable range; do not publish this as the final user operating range.

The33mV total comparator error allowance is a design assumption. TI's dual electrical table covers1.8..5V, whereas the study includes5.25V USB; manufacturer confirmation/bench characterization is needed. Actual NTC beta/R-T tolerances, thermal lag/self-heating, MOS leakage, switching thresholds, power ramp timing, TS disable levels and brownouts still require qualification. Nominal5V divider consumption is about0.75mA from USB (including inhibit pull-up when released), and typical NTC dissipation near25°C is0.625mW; pack thermal effect is unknown.

No charging permission may be enabled in released firmware until the battery-specific guard configuration and charge voltage/termination conditions are approved. During boot/reset/suspend/error, CHG_ALLOW stays low. Normal USB insertion must preserve recording and must not request USB sync.

## Reproduction

1. `python3 hardware/tools/create_charge_guard_v4.py` creates schematic/BOM/connection table (overwrites those files).
2. KiCad Python `hardware/tools/prepare_charge_guard_board.py` makes a new unrouted seed from v3.
3. KiCad Python `hardware/tools/layout_charge_guard_v4.py --discard-routing` packs the87parts and exports route.dsn. This overwrites this revision's board.
4. Freerouting2.5.0: `-de route.dsn -do route.ses -mp25 --router.optimizer.enabled=false`.
5. Import with the dedicated tool, normalize minimum width0.10mm, apply `hardware/tools/finish_charge_guard_v4.py`, then run KiCad DRC with schematic parity and ERC. The repair moves shared endpoints/vias0.015..0.030mm, keeping0.10mm clearance.
6. `python3 hardware/charge-guard-v4/check_guard.py` regenerates the conditional DC analysis.

All additions require assembled-board sourcing/DFM. `sourcing-delta.json` lists catalog candidates, not reserved stock or an accepted order BOM. The earlier pending charge-voltage, termination, firmware, USB/SI and actual harness constraints remain.
