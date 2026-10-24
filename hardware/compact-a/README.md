# Compact A: NOT FOR ORDER

See [A/B review](../../docs/compact-ab-review.md). 75 footprints, 18×33×0.8mm, six copper layers. ERC 0; DRC 9; unconnected 10; schematic parity 0.

Do not regenerate placement without preserving routing. `hardware/tools/build_compact_ab.py --discard-routing` overwrites placement and routing in these two folders. `finalize_compact_ab.py` imports the saved SES and normalizes track widths to 0.1mm.
