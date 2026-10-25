# Compact electrical placement v3 — review only

18×33×0.8mm, 6 layers, 75 footprints. New shared-PCB placement study for A/B, stored under compact-b; not promoted into either mechanical assembly. Charger topology is still the incompatible BQ25101 design, so this is not a manufacturing release.

Final KiCad ERC0, DRC0, unconnected0, schematic parity0. See order-status.json for board hash. The result proves connectivity/geometry under configured rules, not functional performance or manufacturing acceptance.

C1/C2/C3 distances to MCU supply pads changed from16.33/16.48/18.15mm to1.48/1.57/1.55mm. C11/C12 to crystal pads changed14.09/10.48mm to1.60/1.68mm. These are straight-line pad distances, not measured loop lengths or SI results.

Reproduction (overwrites this experiment): compact_electrical_placement.py --discard-routing; Freerouting2.5.0 with route.dsn, -mp20, --router.optimizer.enabled=false, output route-noopt.ses; refine_compact_routes.py v3; finish_compact_v3.py; KiCad pcb drc --schematic-parity and sch erc. KiCad Python requires GUI-library access. Import normalization retains0.10mm minimum track width. finish_compact_v3 shifts four shared V3V3 endpoints0.06mm away from R22; no rule relaxation. Import again erases this repair.

route.log is an earlier optimization run stopped after successful autorouting because final output was delayed. The final board derives from route-noopt.ses/route-noopt.log. The final DRC is authoritative.
