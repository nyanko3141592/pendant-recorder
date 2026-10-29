# pendant-recorder

DTP401525-XE（3.7V・110mAh）を使う、連続録音型のUSB-Cネックレスレコーダーです。現行の4層設計レビューは[確認パッケージ](hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/START-HERE.txt)に集約しています。現成果物の入口は[初号試作設計](hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/first-prototype/README.md)です。配線bay・接着ポケット付きケースと同版キットを追加し、C30を同定格在庫品へ変更しました。ファームの購入者向け書込み版と物理性能は未確定です。

**現状は `HOLD` です。注文、支払い、製造データのアップロードは禁止です。** CAD・静的検査・ソフトウェア試験は通過していますが、安全性、16時間連続録音、30時間保存、3 OSでのUSB取込み、ケース強度は実機未確認です。

## 優先順位

今回は低コストで小型の初号試作を作り、実際に使って評価します。基本安全対策を前提に、**使い勝手（特に電池持ち）→小型化→初回費用**の順で判断します。性能は根拠のある理論見積りで達成を見込めれば試作判断へ進め、実測や量産認定を事前条件にしません。室温の明示した仮定では平均3.86mA・約19.9時間（使用可能77mAh）となりますが、SPI電流・動作時間・使用可能容量は未実測です。詳細は[現行要件](docs/requirements.md)を正本とします。

## 現行候補

基板27.5mm角・最大4層・通常through via・固定DTP401525-XE・16時間録音・30時間以上保存が現要件です。旧6層正本とCase V5は履歴として保全し、現候補の製造入力には使用しません。

| 項目 | 現在の確認先 | 判定 |
| --- | --- | --- |
| 回路・4層基板 | [同版KiCad設計](hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/design/) | 基準PCB b3cdfc064b43…、DRC/未接続/parity 0。電気性能の認定ではない |
| BOM・調達 | [全BOM確認](hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/live-full-bom-summary.json) | 68実装・36型番。U1/U12/J1通常Pre-order。C30は同定格C501830へ変更し公開実装可能45,731個を確認 |
| 製造資料 | [確認パッケージ](hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/START-HERE.txt) | Gerber/drill/BOM/CPL同梱。回転・DFM・90Ω・総額は未確定、upload禁止 |
| ケース・実寸ダミー | [現優先候補](hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/mechanical-first-prototype/ASSEMBLY.md) | 約30.8×37.5×14.2mm。配線通路・蓋接着ポケット、ケース3点＋PCBA/電池ダミーSTEP/STL/3MF。CADとoffline slice確認、現物fit・強度は未認定 |
| ファーム・取込み | [STM32](firmware/stm32/) / [host](host/README.md) | 現codecで暗号化・復号の非実機試験済み。工場imageと3 OS実機動作は未確定 |
| 組立・試験 | [現4層の手順](hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/ASSEMBLY-AND-EVT.txt) | 発注前の設計確認と試作後の実測を分離。実測合格は主張しない |
| 残件 | [release-gates.json](hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/release-gates.json) | 部品入庫・注文時DFM/placement・正式USB ID/cutoff/工場format・実物fit/安全/性能評価が残る |

## 製造と購入者作業の境界

JLCPCB Standard PCBAで両面実装、検査、書込み、出荷前パネル分割まで完結させる方針です。購入者による電子部品の調達、部品支給、はんだ、圧着、配線加工は認めません。購入者が用意して組み付けるものは、固定型番のDTP401525-XE、ケース、ネックレス紐だけです。業者完結できない場合は代替部品または設計変更とし、個別問い合わせを前提に進めません。

## 発注を止めている条件

発注前の設計残件は[release-gates.json](hardware/xe-minimal/preorder-20261029/release-review-20261029-aligned/release-gates.json)を参照してください。試作後の安全・16時間録音・30時間保存・USB・ケース強度試験は未実施です。発注前設計確認の完了と実機認定を区別し、注文・支払い・upload・業者連絡・実印刷は禁止のままです。

旧XIAO/ESP32、旧PCB、旧ケース、外付け温度センサー案は比較・履歴資料であり、現行製造データへ混ぜません。

[プロトコル](docs/protocol/README.md) / [貢献手順](CONTRIBUTING.md) / [MITライセンス](LICENSE) / [第三者通知](THIRD_PARTY_NOTICES.md)
