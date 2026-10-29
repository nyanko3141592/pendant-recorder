# Prototype v1 order-readiness recheck — 2026-10-28

Decision: **HOLD — do not upload or place the manufacturing order.**

This filename is retained as a compatibility pointer. The authoritative current audit is [`procurement/xe-production-readiness-2026-10-28.md`](procurement/xe-production-readiness-2026-10-28.md), and the exact current sourcing map is [`procurement/xe-production-bom-2026-10-28.csv`](procurement/xe-production-bom-2026-10-28.csv).

Earlier statements that Q5, the former U14 film-sensor function, an external 103JT process, the LED MPN, R42 sourcing, STM32U535, or TPS22950 are current blockers are superseded. The current circuit removed Q5 and the external thermal-pad process, reads the factory DTP401525-XE 10k NTC directly through J2, uses STM32U585CIU6, fixes D6/R42 to catalog parts, and integrates NCP360SNT1G ahead of TPS2552DBVR-1 latch-off limiting with local C31/C32/C33 bypass capacitors.

The remaining release blockers are:

1. `STM32U585CIU6 / C5271026` is the synchronized MCU and its public JLC page reports it orderable, but live BOM-tool acceptance and physical USB/PDM/power qualification are not verified.
2. The 2026-10-28 public-page snapshot exactly matches all 36 MPN lines and reports all 36 orderable. This is not a stock reservation or PCBA quote; BOM-tool matching, feeder/attrition quantities and substitutions still require a live pre-order check. The current BOM has 68 JLC-assembled references plus six PCB-only test/programming features.
3. The fixed DTP401525-XE pack is not supplied or installed by JLC in the current boundary. It must be procured separately and inserted without wire modification; this matches the allowed buyer final assembly boundary of battery, case and cord only.
4. The current six-layer build has four explicitly filled/capped hole-over-pad vias. A simple dogbone move failed DRC, and automatic-order acceptance has not been verified.
5. NCP360 now feeds TPS2552DBVR-1, giving 1.1V from the guaranteed 5.9V maximum OVLO threshold to the limiter 7.0V absolute maximum, but its published 1.5us turn-off condition excludes the required 1uF output capacitor. For 6/9/12/20V at 0.1/1/10V/us, measured `/VBUS_OVP` and `/VBUS_CHARGER` peaks plus uncertainty must be strictly below the 6.5V recommended ceiling. The limiter must hold 50-100mA, latch off on sustained short, and recover only after USB power-cycle; failure requires redesign, not waiver. These tests, C31/C32/C33 effective capacitance, transient stability, thermal response, 16-hour recording, 36-hour encrypted retention, three-OS import, USB cable fit, and necklace proof-load/fatigue remain physically untested.
6. Every earlier CAM, panel, BOM, CPL and order package is superseded and must not be uploaded.

No order, payment, manufacturing upload, or supplier message was performed.
