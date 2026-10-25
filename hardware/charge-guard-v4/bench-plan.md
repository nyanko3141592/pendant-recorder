# Guard qualification — not yet run

Use a current-limited bench5V source, battery simulator, resistor substitution for NTC, and oscilloscope. Do not start by experimenting on a real LiPo. The eventual no-solder user kit must provide assembled fixtures; this bench plan is an engineering validation requirement.

- With MCU reset/high-Z, verify TS below the BQ25101 guaranteed disable threshold and no charge current throughout VBUS ramps, repeated plug/unplug, and brownouts. Scope gate/TS/BAT; DMM averages are insufficient.
- Assert MCU permission with NTC open, short,12.824k or higher,7.783k or lower: charging must stay disabled under the characterized corners. Sweep slowly both directions and record actual hysteresis and trip resistances.
- Set NTC10k and valid MCU permission: measure charge current, maximum battery regulation voltage and termination. Ensure system current is supplied via USB path and does not mask termination.
- Repeat with MCU firmware crash/reboot/suspend and comparator supply ramp. A static GPIO stuck high must still allow hardware temperature inhibit. Check GPIO never exceeds its supply and no back-powering with VBUS absent.
- Confirm series NMOS gate/source voltages and Q2 clamp voltage at hot/cold and leakage corners; generic MOS model is insufficient.
- Obtain XE current-lot R-T specification first, then map resistance trips to temperature with worst-case tolerances and thermal lag. Test assembled pack temperature under controlled conditions following supplier limits.
- Confirm power/recording continues on USB insertion; explicit sync remains a separate operation. Measure unplugged current and16h recording independently.

Record fixture/version/hash, instruments, waveforms and observed limits. Passing ERC/DRC or the DC script cannot substitute for these results.
