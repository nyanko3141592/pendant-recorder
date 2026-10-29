# pendant-recorder

DTP401525-XE（3.7V・110mAh）を使う、連続録音型のUSB-Cネックレスレコーダーです。現行候補は回路、BOM、PCB、ファーム、ケース、製造用ローカルデータを同じ版に固定しています。

**現状は `HOLD` です。注文、支払い、製造データのアップロードは禁止です。** CAD・静的検査・ソフトウェア試験は通過していますが、安全性、16時間連続録音、30時間保存、3 OSでのUSB取込み、ケース強度は実機未確認です。

## 優先順位

判断順は、安全性、16時間連続録音、業者完結、必須機能、量産継続性、ネックレス実用性、小型化、原価です。下位項目のために上位項目を犠牲にしません。詳細は[現行要件](docs/requirements.md)を正本とします。

## 現行候補

最初の試作ハードウェア版は `HW-V1.0` です。内部設計版名は `XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH` です。

| 項目 | 正本 | 現在の判定 |
| --- | --- | --- |
| 回路・PCB | [active-design.json](hardware/xe-minimal/active-design.json) / [回路図](hardware/xe-minimal/pendant-xe-minimal.kicad_sch) / [PCB](hardware/xe-minimal/pendant-xe-minimal.kicad_pcb) | 27.5 × 27.5mm、6層。ERC・DRC・回路図照合・未接続はいずれも0件。実機安全試験は未実施 |
| BOM・実装 | [量産BOM](docs/procurement/xe-production-bom-2026-10-28.csv) / [調達状況](docs/procurement/xe-production-readiness-2026-10-28.md) | JLC実装68位置、36 MPN行。購入者が扱うのは電池、ケース、紐だけ。JLCの自動発注画面での受理と正式見積りは未確認 |
| ファーム | [STM32実装](firmware/stm32/) / [実装状況](firmware/stm32/implementation-status.json) | 16kHz以上・モノラル・無音を含む連続録音、暗号化保存、USB引渡しを対象。実機16時間試験は未実施 |
| PC取込み | [host/README.md](host/README.md) / [取込みCLI](host/import_recordings.py) | macOS・Windows・Linuxを対象。3 OS実機試験は未完了 |
| ケース | [case-pebble-v5レビュー](mechanical/xe-minimal/prototype-v1/case-pebble-v5-review.json) / [組立STEP](mechanical/xe-minimal/prototype-v1/case-pebble-v5-assembly.step) | 約29.91 × 36.35 × 12.98mm、PETG。1GB部品包絡、横穴の紐受け、全周ラウンド、USB-C外面合わせを反映。印刷・摩耗・疲労・ケーブル適合は未確認 |
| 製造データ | [CAMレビュー一式](hardware/xe-minimal/fabrication-review-d0c7ca1c4a31/) / [単体キャリア](hardware/xe-minimal/canonical-single-carrier-v1/carrier.kicad_pcb) / [ローカルレビュー一式](outputs/xe-canonical-local-review-v1/) | ローカル整合確認用。JLCで出荷前パネル分割まで行う前提。アップロード用アーカイブは作らない |
| 検証 | [5台EVT計画](docs/validation/xe-current-five-unit-evt-plan.json) / [リリース証拠表](docs/validation/xe-release-evidence-matrix.json) | 実機ゲートは `NOT_RUN`。計算値・静的検査を実測として扱わない |
| 費用 | [5台概算](docs/procurement/xe-five-unit-current-estimate.md) | 公開価格による部分概算のみ。完成品の着地総額は未確定 |

## 製造と購入者作業の境界

JLCPCB Standard PCBAで両面実装、検査、書込み、出荷前パネル分割まで完結させる方針です。購入者による電子部品の調達、部品支給、はんだ、圧着、配線加工は認めません。購入者が用意して組み付けるものは、固定型番のDTP401525-XE、ケース、ネックレス紐だけです。業者完結できない場合は代替部品または設計変更とし、個別問い合わせを前提に進めません。

## 発注を止めている条件

[発注判断](docs/prototype-v1-order-decision.md)のとおり、USB異常・充電・短絡・温度を含む安全試験、10/25/35℃での16時間連続録音、30時間保存、3 OSでの取込み・復号、ケースと紐受けの強度・摩耗試験、JLC自動フローでの実装・書込み・パネル分割受理が未完了です。すべての実測証拠が合格するまで `release_allowed=false` を維持します。

旧XIAO/ESP32、旧PCB、旧ケース、外付け温度センサー案は比較・履歴資料であり、現行製造データへ混ぜません。

[プロトコル](docs/protocol/README.md) / [貢献手順](CONTRIBUTING.md) / [MITライセンス](LICENSE) / [第三者通知](THIRD_PARTY_NOTICES.md)
