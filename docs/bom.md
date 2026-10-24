# 部品表（概算）

> 2026-10-24 回路照合による訂正: 最新の回路原本は [hardware/rev-a/README.md](../hardware/rev-a/README.md)。48ピンSTM32U535CBU6はSDMMC端子がないため試作はSTM32U535RCT6（LQFP64）へ変更。T5838は底面音孔・1.8V専用でレベル変換が必須。BQ25101は50mA設定＋USB給電の負荷分離、USB PHYは専用3.3V。以下は初期調査/見積りを含み、矛盾時はRev A0を優先する。
価格はすべて目安で、**未確認**です。購入前に各店で確認してください。

| 部品 | 数量 | 概算価格 | 買える所（日本） | 備考 |
|---|---|---|---|---|
| Seeed XIAO ESP32S3 Sense | 1 | 約3,000〜4,000円（未確認） | スイッチサイエンス、秋月電子、マルツ、Amazon | カメラは外して使う |
| microSD 32GB（高耐久） | 1 | 約1,000〜2,000円（未確認） | 家電量販店、Amazon | 連続書き込みに強いもの |
| LiPo電池 1S 500〜1,300mAh（保護回路付き） | 1 | 約800〜2,000円（未確認） | 秋月電子、スイッチサイエンス、Amazon | 容量は電力の実測で決める。JST-PHなどコネクタの形を確認 |
| 外付けRTC（RV-3028などのモジュール、任意） | 1 | 約1,000〜2,500円（未確認） | スイッチサイエンス、Amazon | 案Bを選んだ場合 |
| タクトスイッチ（小型） | 1 | 約20〜100円 | 秋月電子 | |
| 抵抗（電池電圧の分圧用 例:100kΩ×2） | 2 | 数円 | 秋月電子 | 基板上の分圧の有無を確認 |
| 3Dプリントのケース | 1 | 材料費数百円〜外注で数千円（未確認） | 自宅のプリンタ、JLC3DP、DMM.make など | |
| ブレイクアウェイ式の首ひも | 1 | 約500〜1,500円（未確認） | Amazon | |
| 比較用: XIAO nRF52840 Sense | 1 | 約3,000〜4,000円（未確認） | スイッチサイエンス、Amazon | 2台目の候補 |
| 比較用: microSDモジュール（SPI） | 1 | 約300〜800円（未確認） | 秋月電子、Amazon | nRF52840用 |
| 計測用: USB電流計またはPPK2 | 1 | 約2,000円〜（PPK2は約15,000円前後、未確認） | Amazon、マウザー | 電力の実測に必須 |

## Omi-cloneパス（B: DevKit2クローン）の部品
出典は `docs/omi-reference.md`（Omi DK2 README / Buying Guide）。価格は未確認。
| 部品 | 数量 | 備考 |
|---|---|---|
| Seeed XIAO nRF52840 Sense | 1 | Omi DK1/DK2と同じ。Seeed直販 $15（Omi Buying Guide記載） |
| Adafruit 5769 Audio BFF（microSDスロット付き） | 1 | DK2と同じ。スピーカーは不要なので、代わりに小型SPI microSDモジュールでも可 |
| 502030 250mAh LiPo | 1 | DK2と同じ。実測で足りなければ 402535 / 503035 などに上げる |
| タクトスイッチ 4×4×1.5mm | 1 | DK2と同じ |
| 28〜30AWG 単線 | 少々 | DK2と同じ |
| 筐体 | 1 | Omi `hardware/triangle v2 w memory/3d_printing_files` を改造（USB-C口とSD口） |
| 書き込み・デバッグ | 1 | XIAOはUF2で書ける。デバッグにはJ-Link or nRF DK（任意） |

## 本番パス（C: Consumerクローン）で参考にする主要部品（Omi BOMより）
| 役割 | 型番 |
|---|---|
| SoC | nRF5340-CLAA（BLE不要なら nRF52840 モジュールで代替を検討） |
| マイク | TDK MMICT5838-00-012（T5838）×1〜2 |
| 記憶 | CS CSNP4GCR01-DPW（SD NAND 512MB）→ 容量不足。16時間WAVなら microSD、Opusなら 1〜2GB級 SD NAND |
| 充電 | TI BQ25101YFPR、保護IC GLF73910-BD01 |
| 電源 | TI TPS628438（降圧）, SGM2036 LDO, TPS22916 ロードスイッチ |
| 電池 | GERUIPU GRP1654M1 150mAh（D16×H6.1）カスタム |

## カスタム基板（推奨構成, 2026-10-24）— 詳細は docs/custom-pcb.md
価格は未確認。LCSC番号は LCSC の商品ページで確認したもののみ記載。
| 役割 | 型番 | パッケージ | LCSC | 備考 |
|---|---|---|---|---|
| MCU | ST STM32U535CBU6 | UFQFPN-48 7×7 | C26442222 | 無線なし、USB FS / SDMMC / ADF |
| マイク | TDK MMICT5838-00-012（T5838） | 3.5×2.65mm | 未確認 | Omi Consumerと同じ |
| ストレージ | CS CSNP32GCR01-BOW（SD NAND 4GB） | LGA-8 6.2×8 | C5440134 | SDMMC 4bit |
| 充電 | TI BQ25101YFPR | DSBGA-6 | C478468 | Omiと同じ |
| 残量計 | Analog Devices MAX17048G+T10 | DFN-8 | C2682616 | |
| LDO 3.0V | 低Iq LDO（例 TI TPS7A02 系） | 小型 | 未確認 | 型番選定中 |
| ロードスイッチ | TI TPS22916 | WCSP | 未確認 | Omiと同じ、SD NAND電源断用 |
| 水晶 | 32.768kHz | 2012等 | 未確認 | RTC |
| USB-C | USB2.0 16ピン ミッドマウント | — | 未確認 | CC 5.1k×2 |
| ESD | USBLC6-2 相当 | SOT-23-6 | 未確認 | |
| 電池 | 1S LiPo 80〜100mAh（保護付き、ボタン型が理想） | — | — | 実測後に決定 |
| ボタン/LED | 4×4mm タクト / 0402 LED | — | 未確認 | |
| 試作用評価ボード | ST NUCLEO（STM32U545等） | — | — | 型番は要確認 |
