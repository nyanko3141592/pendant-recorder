#!/usr/bin/env python3
"""Keep the public programming-service evidence fail-closed."""
from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[2]
path = ROOT / "docs/procurement/xe-jlc-programming-service-review-2026-10-28.json"
r = json.loads(path.read_text())
assert r["status"] == "STANDARD_PCBA_PROGRAMMING_OPTION_EXISTS_EXACT_XE_WORKFLOW_NOT_ACCEPTED"
assert r["canonical_route"] == "Standard PCBA"
assert r["service_available_for_canonical_route"] is True
assert r["pre_assembly_programming_supported"] is False
assert r["post_assembly_programming_supported"] is True
assert r["published_price_USD"]["engineering_fee_approx"] == 8
assert r["published_price_USD"]["operator_labor_per_hour_approx"] == 8
assert r["published_price_USD"]["exact_hours"] is None
assert r["published_price_USD"]["exact_total"] is None
assert "STM32U585CIU6 support with the exact J3 SWD footprint and carrier access" in r["not_proven_by_public_service_description"]
assert "BOR level 4 option-byte programming and readback" in r["not_proven_by_public_service_description"]
assert "96-bit MCU UID capture and binding to a unique PCB serial" in r["not_proven_by_public_service_description"]
assert r["xe_inputs_already_defined_locally"]["board_picture"].startswith("hardware/xe-minimal/factory-programming/vendor-programming-carrier.svg")
assert r["xe_inputs_already_defined_locally"]["machine_readable_instruction"].endswith("vendor-programming-instruction.json")
assert r["orders_payments_uploads_vendor_contacts_performed"] is False
print("PASS_JLC_STANDARD_PROGRAMMING_OPTION_EXISTS_EXACT_XE_ACCEPTANCE_HOLD")
