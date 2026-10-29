# HW-V1.4 EVT 30 mm prototype assembly

This package is a physical fit prototype built around the canonical 27.5 x
27.5 mm populated PCB and the fixed DTP401525-XE battery.

## Printed fit-check

Print `case-pcb-battery-print-plate.stl` in PETG with a 0.4 mm nozzle, 0.16 mm
layers, six walls, 40% gyroid infill and supports enabled. The plate contains:

1. rounded lower case with integral corner cord tunnel;
2. rounded upper case;
3. populated-PCB mechanical gauge, including maximum envelopes for U1, U8 and
   J2 that were absent from the native KiCad STEP export;
4. DTP401525-XE maximum-body gauge.

The PCB and battery gauges are only for checking volume and assembly motion.
They are not functional substitutes.

## Intended real assembly order

1. Remove all supports and clear the USB throat, microphone opening and 2.2 mm
   cord tunnel. Do not reduce the surrounding ligament while cleaning it.
2. Trial-fit the assembled PCBA into the lower shell and confirm the USB-C
   receptacle is flush with its mating datum.
3. Connect the battery's factory three-wire 781720003 plug to the board's J2
   header without modifying or splicing the harness.
4. Route the original lead set through the reserved corridor without folding a
   wire against a sharp case or PCB edge.
5. Install the separator, then the DTP401525-XE with no adhesive or local point
   pressure on the pouch.
6. Fit the upper shell and verify that it closes without force. For EVT only,
   bond the perimeter seam after electrical, USB, microphone and fit checks.
7. Thread 1.0–1.5 mm braided polyester or nylon cord through the corner tunnel.

Reject the assembly if the lid springs open, the pouch is compressed or
creased, a lead is pinched, USB insertion loads the PCB, or the cord tunnel
shows layer separation.

## Not yet qualified

CAD and slicing do not qualify pouch swelling, connector removal motion,
acoustics, sweat/drop resistance, cord proof/fatigue strength, USB cable range,
thermal cutoff response or 16-hour electrical operation. Keep the charging
path disabled by default until the electrical and temperature gates pass.
