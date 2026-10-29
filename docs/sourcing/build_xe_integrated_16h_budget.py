"""Build the stage-1 integrated runtime/storage budget from checked-in evidence.

This is a design allocation and evidence map, not a measured runtime claim.
"""
from __future__ import annotations

import hashlib
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
OUT_JSON = ROOT / "docs/sourcing/xe-integrated-16h-budget.json"
OUT_MD = ROOT / "docs/sourcing/xe-integrated-16h-budget.md"


def load(relative: str) -> tuple[Path, dict]:
    path = ROOT / relative
    return path, json.loads(path.read_text())


budget_path, budget = load("hardware/xe-minimal/recording-current-budget.json")
led_path, led = load(
    "hardware/xe-minimal/fixed-usb-limit-trial/led-land-trial/indicator-current-budget.json"
)
storage_path, storage = load("docs/sourcing/xe-cs32-energy-screen.json")
nonstorage_path, nonstorage = load("docs/sourcing/xe-nonstorage-current-ledger.json")
feasibility_path, feasibility = load("docs/sourcing/xe-u585-runtime-feasibility-audit.json")
battery_path, battery = load("docs/sourcing/battery-first-selection.json")
firmware_result_path, firmware_result = load(
    "hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/evidence/factory-image-generation-review.json"
)

capacity_mAh = battery["capacity_mAh"]
target_h = budget["continuous_recording_target_h"]
codec_path, codec = load("hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/evidence/current-codec-capacity-review.json")
format_path, format_budget = load("hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/evidence/storage-format-and-budget.json")
# Fail closed if the measured codec evidence no longer describes current sources.
for name, expected in codec["sources"].items():
    assert hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == expected, name
segment_s = codec["chunk_samples"] / codec["sample_rate_hz"]
ciphertext_bytes_per_segment = codec["observed_full_ciphertext_bytes"]
ciphertext_Bps = ciphertext_bytes_per_segment / segment_s
storage_30h_bytes = ciphertext_Bps * 30 * 3600
storage_36h_with_20pct_reserve_bytes = storage_30h_bytes * 1.2

scenario70 = next(
    row for row in budget["scenarios"] if row["usable_fraction_hypothesis"] == 0.7
)
led70 = next(row for row in led["scenarios"] if row["usable_fraction_hypothesis"] == 0.7)

# Stage-1 allocation: require a measured whole-device average at or below 4.4 mA.
# This consumes 70.4 mAh in 16 h, i.e. 64% of nominal capacity, and leaves 6.6 mAh
# inside the separate 70%-usable planning envelope. It is deliberately below the
# 4.8125 mA mathematical ceiling but is not a substitute for the runtime test.
design_average_target_mA = 4.4
usable70_mAh = capacity_mAh * 0.7
design_charge_16h_mAh = design_average_target_mA * target_h
reserve_inside_70pct_mAh = usable70_mAh - design_charge_16h_mAh

base_nonstorage_allocation_mA = nonstorage["allocation_mA"]["original_base_nonstorage"]
guard_bor_reserve_mA = nonstorage["allocation_mA"]["explicit_guard_and_BOR_total"]
recording_led_duty = 0.0
recording_led_mA = led["LED_on_current_upper_mA"] * recording_led_duty
nonstorage_recording_mA = (
    base_nonstorage_allocation_mA + guard_bor_reserve_mA + recording_led_mA
)
storage_allocation_at_design_target_mA = (
    design_average_target_mA - nonstorage_recording_mA
)
storage_payload_lower_bound_mA = None
storage_unmodeled_headroom_mA = None

capacity_rows = []
for usable_fraction in (0.6, 0.64, 0.7, 0.8):
    available_mAh = capacity_mAh * usable_fraction
    capacity_rows.append(
        {
            "usable_fraction_hypothesis": usable_fraction,
            "available_mAh": available_mAh,
            "maximum_average_for_16h_mA": available_mAh / target_h,
            "margin_vs_4p4mA_mAh": available_mAh - design_charge_16h_mAh,
        }
    )

sources = [codec_path, format_path, budget_path, led_path, storage_path, nonstorage_path, feasibility_path, battery_path, firmware_result_path]
report = {
    "status": "RUNTIME_FEASIBILITY_UNCONFIRMED_DESIGN_OPTIMIZED_MEASUREMENT_REQUIRED",
    "decision": (
        "Keep the fixed 110mAh battery and requirements. The arithmetic target is <=4.4mA, "
        "but the current design has neither a conservative completed-device upper bound nor a "
        "physical 16h result. An unnecessary continuous HSI16 clock was removed; feasibility "
        "remains unconfirmed until measurement."
    ),
    "battery": {
        "model": battery["selected_model"],
        "nominal_capacity_mAh": capacity_mAh,
        "ideal_16h_ceiling_mA": capacity_mAh / target_h,
        "planning_usable_fraction": 0.7,
        "planning_usable_capacity_mAh": usable70_mAh,
        "planning_16h_ceiling_mA": usable70_mAh / target_h,
        "usable_capacity_definition": (
            "Capacity delivered after the final 4.1V nominal on-board charging profile "
            "(4.1205V guaranteed maximum) until the final "
            "loaded recording stop threshold, including connector/protection/LDO loss, at the "
            "qualified temperature and ageing endpoints."
        ),
    },
    "adopted_design_allocation": {
        "whole_device_average_target_mA": design_average_target_mA,
        "charge_for_16h_mAh": design_charge_16h_mAh,
        "reserve_inside_70pct_envelope_mAh": reserve_inside_70pct_mAh,
        "minimum_nominal_capacity_fraction_needed": design_charge_16h_mAh / capacity_mAh,
        "whole_device_peak_limit_mA": battery["manufacturer"]["max_discharge_mA"],
        "peak_note": (
            "110mA is treated as a never-exceed complete-pack limit; no unsupported pulse allowance. "
            "Regulator droop and storage inrush impose additional prototype checks."
        ),
    },
    "record_encrypt_store_path": {
        "sample_rate_Hz": 16000,
        "channels": 1,
        "codec": "IMA ADPCM in WAV, then binary age v1 X25519 encryption",
        "segment_seconds": segment_s,
        "encrypted_bytes_per_segment": ciphertext_bytes_per_segment,
        "encrypted_bytes_per_second": ciphertext_Bps,
        "encrypted_30h_bytes": storage_30h_bytes,
        "encrypted_30h_GB_decimal": storage_30h_bytes / 1_000_000_000,
        "minimum_data_area_bytes_including_allocation_reserve": format_budget["budget"]["minimum_total_data_bytes"],
        "capacity_conclusion": (
            "Selected 8Gbit MKDV8GIL-AST is 1GB nominal. FAT32 data-area budget is 929787904 bytes; "
            "energy, startup/inrush, availability, formatted capacity and filesystem behavior remain qualification gates."
        ),
    },
    "current_allocation_mA": {
        "mcu_mic_codec_crypto_regulators_base_hypothesis": base_nonstorage_allocation_mA,
        "temperature_guard_and_BOR_reserve": guard_bor_reserve_mA,
        "indicator_during_ordinary_recording_duty": recording_led_duty,
        "indicator_during_ordinary_recording_mA": recording_led_mA,
        "nonstorage_subtotal_hypothesis": nonstorage_recording_mA,
        "published_maxima_deducted_from_base": nonstorage["allocation_mA"]["published_maxima_deducted_from_base"],
        "remaining_mcu_codec_crypto_regulator_load_switch_misc_allocation": nonstorage["allocation_mA"]["remaining_for_mcu_codec_crypto_regulator_load_switch_and_misc"],
        "nonstorage_detail": "docs/sourcing/xe-nonstorage-current-ledger.json",
        "storage_total_allocation_at_4p4mA_target": storage_allocation_at_design_target_mA,
        "storage_payload_only_lower_bound_under_published_CSNP32_maxima": (
            storage_payload_lower_bound_mA
        ),
        "storage_headroom_for_commands_metadata_busy_startup_amortization": (
            storage_unmodeled_headroom_mA
        ),
        "accounting_warning": (
            "The 2.8mA base is an allocation hypothesis, not a component sum or measurement. "
            "Encryption is included only by intended bucket scope, not by evidence. Do not add "
            "these nested estimates to a measured whole-battery integral."
        ),
    },
    "capacity_sensitivity": capacity_rows,
    "stage1_gate": {
        "proceed": False,
        "why": (
            "The 2.8mA non-storage value is only an allocation and the selected LDO MCU's "
            "datasheet maximum can itself exceed the whole-device target at elevated temperature. "
            "No completed-device upper bound or physical integral exists."
        ),
        "blocking_evidence": "docs/sourcing/xe-u585-runtime-feasibility-audit.json",
        "must_be_true_before_release": [
            "Measured battery-side charge over each complete 16h recording run is <=70.4mAh and the device remains recording through16h.",
            "At least the qualified worst-case on-board-charge/temperature/age condition delivers >=70.4mAh to the recording stop threshold, or measured average is reduced so runtime still passes.",
            "Whole-device instantaneous battery current never exceeds110mA and no storage startup/write event causes reset, corruption or audio overrun.",
            "Every 10s segment is encrypted and durably committed; decrypted continuous audio, timestamps/sequence and missing-segment checks cover the full run.",
            "A filled/aged selected storage unit preserves at least30h without overwrite and passes recovery after injected power loss.",
        ],
        "measurement_buckets": [
            "Battery-side full-session integral: authoritative runtime evidence.",
            "3.3V storage-rail integral and peak waveform: diagnoses storage allocation/inrush.",
            "3.3V nonstorage integral while capture+IMA+age run: replaces the unmeasured2.8mA allocation.",
            "Usable pack capacity after on-board charge to loaded stop: validates the capacity envelope.",
        ],
    },
    "not_claimed": [
        "No 16h runtime has been measured.",
        "The 70% usable-capacity fraction is not a battery guarantee.",
        "CSNP32GCR01-BOW is not adopted solely by this energy screen.",
        "Ordinary recording uses the release configuration with automatic indication disabled; "
        "terminal/fault indication is a separate non-recording state and still requires energy/safety EVT.",
        "No PCB, case, procurement or charging-temperature release follows from this document.",
    ],
    "source_sha256": {
        str(path.relative_to(ROOT)): hashlib.sha256(path.read_bytes()).hexdigest()
        for path in sources
    },
    "firmware_test_observation": firmware_result,
}

assert report["record_encrypt_store_path"]["encrypted_30h_GB_decimal"] < 1.1
assert abs(nonstorage_recording_mA + storage_allocation_at_design_target_mA - 4.4) < 1e-12
assert reserve_inside_70pct_mAh > 0
assert storage_unmodeled_headroom_mA is None

# First-prototype policy: retain allocation numbers; physical proof is a later qualification.
report["status"] = "ALLOCATION_UNMEASURED_WITH_SEPARATE_CONDITIONAL_PROTOTYPE_ESTIMATE"
report["decision"] = "4.4mA remains an allocation target. Use first-prototype/performance.json for the component-based conditional scenario; physical measurement absence alone does not block prototype design."
report["stage1_gate"]["proceed"] = "CONDITIONAL_PROTOTYPE_DESIGN"
report["stage1_gate"]["why"] = "The previous completed-device-maximum-or-measurement pre-order rule is superseded by the2026-10-29 user instruction. No existing allocation is thereby proven."
report["stage1_gate"]["blocking_evidence"] = None
report["stage1_gate"]["qualification_stage"] = "after_prototype_before_performance_claim"
report["prototype_estimate"] = "hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/first-prototype/performance.json"
OUT_JSON.write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n")

md = f"""# DTP401525-XE 統合16時間電流予算

状態: **配分値は未実測。初号試作の条件付き見積りは first-prototype/performance.json。実機性能合格とは別。**

## 配分値の扱い（初号試作判断は別の部品別見積りを参照）

DTP401525-XE（110mAh）と要件は維持する。最終機の録音中平均電池電流を **4.4mA以下**、かつ本体充電後から録音停止電圧までに使える容量を **70.4mAh以上**にできれば16時間に届く。ただし現状の2.8mA非ストレージ値は配分仮説で、完成品の保守的上限計算はない。CPUをMSIS 16MHz、SPIをPCLK2へ移して録音中の不要なHSI16常時動作を削除したが、削減量と16時間は未実測である。

| 境界 | 値 | 扱い |
| --- | ---: | --- |
| 公称容量だけの理想上限 | {capacity_mAh / target_h:.4f}mA | 劣化・低温・終止電圧等を含まず設計値にしない |
| 70%使用可能仮定の上限 | {usable70_mAh / target_h:.4f}mA | 計画上限、未保証 |
| 採用する平均電流目標 | {design_average_target_mA:.3f}mA | 16hで{design_charge_16h_mAh:.1f}mAh |
| 完成パック瞬時電流上限 | {battery['manufacturer']['max_discharge_mA']}mA | パルス超過を認めない |

## 録音・暗号化・保存

16kHz・モノラル、10秒ごとにage v1で暗号化し、現行codec実行で{ciphertext_bytes_per_segment:,}byte/10秒を確認。30時間の暗号化payloadは{storage_30h_bytes:,}byte。選定MKDV8GIL-ASTは8Gbit＝1GB公称。3 sessionの端数・4KiB割当・ディレクトリ・中断/次ファイル余裕を含む必要data領域は{format_budget["budget"]["minimum_total_data_bytes"]:,}byteで、FAT等は別に必要。実媒体の全容量・電流・起動ピークは未認定。旧20%余裕の数値は現設計の合格条件に使わない。

## 4.4mAの配分

| 負荷 | 配分/下限 (mA) | 証拠の強さ |
| --- | ---: | --- |
| 非ストレージ基礎枠 | {base_nonstorage_allocation_mA:.6f} | 配分仮説、未実測 |
| └ 公開最大値を明示できたマイク・充電IC・比較器 | {nonstorage['allocation_mA']['published_maxima_deducted_from_base']:.6f} | 各資料の限定条件。完成品全条件の上限ではない |
| └ MCU・IMA・age・レギュレータ・スイッチ等の残余枠 | {nonstorage['allocation_mA']['remaining_for_mcu_codec_crypto_regulator_load_switch_and_misc']:.6f} | 実ファームで測定必須 |
| 温度guard・BOR | {guard_bor_reserve_mA:.6f} | 回路上の予備枠 |
| 表示LED（通常録音） | {recording_led_mA:.6f} | 自動表示無効のリリース構成。故障表示は別状態 |
| ストレージ総枠 | {storage_allocation_at_design_target_mA:.6f} | 完全な10秒周期で積分して判定 |
| └ payload転送だけの条件付き下限 | 未確定 | CSNP32は別部品のため現部品の根拠に使わない |
| └ command/metadata/busy等の残枠 | 未確定 | 現MKDV8GIL-ASTの全周期積分が必要 |

2.8mAを実測値として扱わない。最終判定は電池側の全セッション積算を正とし、内訳測定は原因分離に使う。

## 試作合格ゲート

1. 本体充電から開始した完全な16時間録音で電池側積算70.4mAh以下、かつ16時間を通して録音継続。
2. 温度・電池個体・経時条件を含む最悪条件でも16時間合格。満たさなければ平均電流を下げ、容量要件は変更しない。
3. 電池電流は常時110mA以下。保存起動・書込みでリセット、音声欠落、破損なし。
4. 全10秒区間を復号・連結検査し、連番欠落と時刻連続性を確認。
5. 選定保存部品をほぼ満杯・断片化状態でも30時間、電源断復旧を含めて合格。

詳細な機械可読値と出典hashは `xe-integrated-16h-budget.json` に記録した。
"""
OUT_MD.write_text(md)
print(json.dumps({"json": str(OUT_JSON), "markdown": str(OUT_MD), "status": report["status"]}, ensure_ascii=False))
