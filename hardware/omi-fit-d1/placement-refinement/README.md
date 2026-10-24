# D1.1 routing development record

Historical experiments only. Current board, circuit and verified status are one directory above. Do not order any candidate file.

The starting committed D1 had 53 unconnected items and 8 DRC violations. The work moved decouplers/crystal, rotated the MCU 180 degrees, compared four/six layers and smaller through vias, and moved R4 out of the left MCU escape region. Changing MIC_EN from PB1 to unused PB5 and routing it before the remaining nets allowed all functional nets to route. Grid completion joined three GND islands; KiCad then verified zero unconnected items and zero schematic parity issues.

The promoted result uses six layers, 0.8 mm nominal thickness, 0.10 mm trace/clearance and 0.35/0.15 mm through vias. Parent-directory USB ground-land review subsequently resolved the four remaining footprint hole-clearance violations. That later change is intentionally absent from these historical candidates.

trial-summary.json records KiCad results. Router-reported zero violations did not replace KiCad verification. Imported fanout widths below 0.10 mm were normalized before checking.

Important limitations:
- The plane trial performed worse and was rejected. There is no accepted manufacturer stackup.
- Routing completeness does not establish power integrity, USB impedance, oscillator margin or manufacturability.
- Candidate boards contain unqualified component values and are not release artifacts.
- Main PCB is the reproducible final source. Scripts record exploratory operations; some require their intermediate candidate inputs and should not be blindly rerun after a later circuit revision.
- adopt_routed.py is destructive and requires --overwrite-current; it would overwrite the later USB correction. It is retained as history, not the normal update path.

The intermediate boards/projects/DSN/SES/DRC reports and logs are preserved in trials.zip to keep hundreds of thousands of generated lines out of normal code review. Unzip it into this directory to inspect or replay those intermediates. The starting main-board snapshot was commit 027b991; later parent-board edits are not identical inputs.
