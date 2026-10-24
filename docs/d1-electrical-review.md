# D1 electrical release review — 2026-10-24

Status: **not released for fabrication or assembly**. Updated 2026-10-25: current D1 has ERC0 / DRC0 / unconnected0 / schematic parity0. This is connectivity/rule evidence, not electrical or manufacturing qualification.

## Charging temperature is a pack-dependent gate

BQ25101 is a JEITA charger, not a hard 45 °C cutoff device. It reduces charging voltage above its warm threshold and suspends charging at its hot threshold (nominally 60 °C). A pack specified only for 0–45 °C charging cannot be approved on the assumption that fitting TH1 implements a 45 °C cutoff.

- Obtain the completed pack's permissible charge voltage/current versus temperature.
- Check charger thresholds, NTC resistance/B-value tolerances, and actual cell-to-NTC thermal contact together.
- If the pack excludes warm-region charging, revise the charger/protection circuit before release. Firmware cannot currently measure TH1 independently; the existing charge-disable transistor is not an implemented temperature controller.
- Do not substitute BQ25100A as a temperature fix: its charge regulation voltage is 4.30 V, incompatible with the proposed 4.20 V cell.
- The proposed R10 6.19 kΩ ±1% gives approximately 20.6–23.7 mA using the published ISET gain limits (129–145 AΩ). Confirm that entire interval against the pack, including cold-region charging.

Source: [TI BQ25100/BQ25101 datasheet](https://www.ti.com/lit/ds/symlink/bq25101.pdf), electrical characteristics and TS operation. No pack charging profile has been approved.

## Placement and routing review

The committed D1 placement was primarily a geometric packing study. The promoted D1.1 placement (trials recorded in hardware/omi-fit-d1/placement-refinement) rotates U1 and brings decoupling and crystal components closer. D2 has been regenerated against this placement. Support/duct envelope checks do not establish actual component heights or print tolerances. MIC_EN moved from PB1/pin19 to unused PB5/pin41; the generated schematic, PCB and pin table agree.

Four- and six-layer routing trials compare 0.5/0.2 mm, 0.4/0.2 mm and 0.35/0.15 mm via diameter/drill. All trials retain a 23 mm circular outline and 0.10 mm minimum tracks/clearance. Each imported route is rechecked by KiCad, including schematic parity. Freerouting's own violation count is not release evidence. Narrow fanout tracks are restored to 0.10 mm before checking, exposing actual clearance conflicts.

JLC's published capabilities are only a feasibility reference, not an accepted stackup or DFM approval:
https://jlcpcb.com/capabilities/pcb-capabilities/
https://jlcpcb.com/help/answers/detail/110-minimum%20via%20size%20vs.%20minimum%20annular%20ring%20size

Remaining electrical review includes:
- USB differential geometry/reference plane and ESD path.
- MCU/SD supply return paths and decoupler loop lengths, not merely distances.
- LSE crystal selection, load capacitance and oscillator margin.
- Effective capacitance under bias, especially the nominal 22 µF storage capacitor.
- SD inrush, microphone startup and charger/power-path transitions.
- Test/programming access and vendor assembly direction checks.

## USB footprint discrepancy

The stock USB4105 footprint reports 0.1944 mm between four ground-pad instances and locating holes, against the project's 0.2000 mm copper-to-hole rule. The manufacturer drawing B4 was visually reviewed. A dedicated local footprint now retains signal pads and locating holes and shortens the two physical ground lands from 1.15 to 1.12 mm, within the drawing's ±0.05 mm PCB-layout dimension range. Pad width stays 0.60 mm versus the drawn 0.45 mm ground tail width. KiCad now reports no copper-to-hole violations. The supplier must still confirm this land/tolerance change; it is not a DFM waiver. See hardware/omi-fit-d1/usb-landpattern-review.json.

Manufacturer drawing mirrored by distributor:
https://gct.co/files/drawings/usb4105.pdf

## Procurement

sourcing-candidates.json records catalog identity, not reserved stock or assembly acceptance. The MCU listing showed no available stock in the retrieved catalog. All 69 populated references now have catalog candidates, including T5838 ordering code MMICT5838-00-012 / C7230692. The round completed battery, sourcing reservation, passive component qualification and factory assembly remain release gates. Supplier inquiries are prepared in docs/sourcing but have not been sent.
