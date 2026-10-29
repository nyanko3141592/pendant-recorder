# Omi（BasedHardware/omi）ハードウェア／ファームウェア調査メモ

> **外部製品の履歴調査資料。** OmiやRev Aの構成は現行pendant-recorderの回路・BOM・製造根拠ではない。現行正本は [`requirements.md`](requirements.md) と [`hardware/xe-minimal/active-design.json`](../hardware/xe-minimal/active-design.json)。

調査日: 2026-10-24。リポジトリは commit `c10d3ca6efc8f9311b62f05da31e7eb03bd9184a` を参照（以下のリンクはこのcommitに固定）。
「未確認」と書いたものは一次情報で確かめられていないもの。推測は「推測」と明記。

- リポジトリ: https://github.com/BasedHardware/omi
- ドキュメント: https://docs.omi.me/
- 一部ファイルは `reference/omi/` に複製済み（MIT、下記ライセンス参照）

## 0. 一言で
Omiは「マイク→（Opus圧縮）→BLEでスマホへ常時送信」が基本。本体の記憶領域はオフライン時の一時バッファ。
このプロジェクトは **BLE送信をやめて、SDに保存＋USB MSCで吸い出す** だけの差分なので、Omiの「マイク・電源・ケース・Zephyrのドライバ構成」はほぼそのまま流用できる。

## 1. 世代ごとの構成

| 項目 | DevKit 1 | DevKit 2（"Triangle v2 w memory"） | Omi Consumer（現行ペンダント, "omi2"/CV1） |
|---|---|---|---|
| MCU | Seeed XIAO nRF52840 Sense [D1][B1] | XIAO nRF52840 Sense [D2][H2] | nRF5340-CLAA（WLCSP-95）＋ nRF7002 Wi-Fi [H1][BOM] |
| マイク | XIAO Sense基板上のPDMマイク [B1]（型番はOmi側に記載なし。Seeed側の記載は未確認） | 同左（Adafruit 5769 Audio BFFはスピーカー用アンプ／microSD用） [H2] | TDK T5838（MMICT5838-00-012）×2、トップポートPDM、AAD（音響起動）付き [H1][BOM] |
| 記憶 | なし [D2] | microSD（Adafruit 5769上のスロット、SPI）。docsは「8GB onboard」と表記 [D2][H2] | SD NAND CSNP4GCR01-DPW 4Gbit=512MB（SPI経由のSDプロトコル）＋SPI NOR P25Q16SH 16Mbit [H1][BOM] |
| 電池 | LiPo（容量はdocsに記載なし＝未確認） [B1] | 502030 250mAh LiPo [H2] | 3.7V 150mAh LiPo、D16×H6.1mm、GERUIPU GRP1654M1-1C-1S1P（カスタム） [H1][BOM] |
| 充電 | XIAO基板上の充電回路 | XIAO基板上の充電回路。USB-C | TI BQ25101（DSBGA-6）、保護IC GLF73910、磁気ポゴピン（6本）＋専用充電台（TPS25200 eFuse） [BOM] |
| 電源 | — | — | TPS628438 降圧DCDC、SGM2036 LDO 3.3V/1.8V、TPS22916 ロードスイッチ×2（SD等の電源断用） [BOM] |
| その他 | スライドスイッチ SS12D00-G3 [B1] | スピーカー OWS-091630W50A-8、ボタン [H2] | IMU LSM6DS3TR-C、振動モーター、RGB LED×2、ボタン [BOM] |
| サイズ | — | — | 直径25.5mm、厚さ約15mm（"2.5cm×1.5cm"） [H1][P] |
| 公称電池持ち | 未確認 | 未確認（ユーザー報告で「昼前に切れる」[R1]） | 10〜14時間（公式）[P]。ユーザー報告7〜15時間 [R1][R2] |

## 2. ファイルの場所（Consumer）
`omi/hardware/consumer/` [H1]
- 回路図: `electrical/mainboard/schematic.pdf`（v1.2）, `electrical/charger-board/schematic.pdf`, `electrical/fpc-board/schematic.pdf`
- 基板データ: `electrical/*/altium/*.zip`（フォルダ名はaltiumだが中身はKiCad 9とdocsに記載 [D3]）, `electrical/*/gerbers/*.zip`
- 基板仕様: メイン 4層 0.6mm 21×21mm ブラインド/ベリードビア、充電台 2層 13×20mm、FPC 29×13mm [D3]
- BOM: `bom/omi-bom.csv`（88行, MPN付き）→ `reference/omi/hardware-consumer/omi-bom.csv`
- 筐体: `mechanical/assemblies/omi-device-charger-assembly.step`, `mechanical/parts/{cnc,injection-molding,silicone,sla}/*.step`, `mechanical/drawings/omi-2d-drawings.pdf`
  - アルミCNCのカバー（Case A/B, D25.5×H5.5mm）、PC+ABSの中枠（D23.2×H6.35）、銅のタッチピン、シリコンパッド、SLAのLEDガイド [H1][BOM]
- 注意: nRF5340/nRF7002はWLCSPなので手はんだ不可、ステンシル＋リフロー必須 [D3]。小ロット原価 約$30–50/台（docs記載）[D3]

DevKit系の筐体・回路:
- DK2 回路図: `omi/hardware/triangle v2 w memory/omi-dk2-schematics.pdf` → `reference/omi/omi-dk2-schematics.pdf` [H2]
- DK2 組立手順とSTL: `omi/hardware/triangle v2 w memory/README.md`, `3d_printing_files/` [H2]
- DK1 系 STL: `omi/hardware/triangle v1/`, `omi/hardware/circle/`（super_*.stl, super.f3d）, `omi/hardware/other-designs/`（friend v3.f3d 等）

## 3. ファームウェア
- フレームワーク: **Zephyr RTOS + nRF Connect SDK**（Arduinoでは不可） [F1][H1]
- `omi/firmware/omi/` = Consumer用、`omi/firmware/devkit/` = DK1/DK2用、`omi/firmware/boards/omi/` = nRF5340の自作ボード定義 [F1]
- DevKitのビルド設定: `devkit/prj_xiao_ble_sense_devkitv1.conf`, `...devkitv1-spisd.conf`（DK1+SPI SD）, `...devkitv2-adafruit.conf` と同名overlay [F2]
- ビルド手順: https://docs.omi.me/doc/developer/firmware/Compile_firmware

### 音声パイプライン
- サンプリング 16kHz、バッファ 16000サンプル(=1秒) [F3 config.h]
- コーデック **Opus**（CELTモード、32kbps VBR、complexity 3、RESTRICTED_LOWDELAY）。CODEC_IDはConsumer=21, DevKit=20 [F3][F4]
  - 32kbps ≒ 4KB/s ≒ **約14MB/時間**（推測計算。WAV 16kHz/16bitの約1/8）
- Consumer: PDMクロック 0.512–3.5MHz、2チャンネル（L/R）、マイクゲインは設定で保存 [F5 mic.c]
- Consumer: T5838の **AAD（Acoustic Activity Detect）** をGPIOで設定（2kHz LPF, 75dB閾値など）して、無音時にPDMを止めて起動待ちする実装 [F6 t5838_aad.c]。Irnas/Brilliant Labsのドライバ由来と記載

### オフライン保存（SD）の既存実装
- DevKit2: Zephyr `sdhc-spi-slot`（SPI 24MHz, CS=P0.02）＋ FATFS（exFAT有効、MKFS有効）、`/SD:/audio/` に保存、`/SD:/info.txt` [F2][F7]。READMEで「offline storageは実験的」 [F1]
- Consumer: SD NANDをSPI(`spi3`, 24MHz)の `zephyr,sdmmc-disk` として扱い、**ファイルシステムなしの生セクタのリングバッファ**（メタ64セクタ＋32セクタ単位のバッチ、マジック "OMIR"/"OMIB"）[F8 sd_card.c][F9 dts]。SD電源はP1.10でON/OFF
- どちらも用途は「BLE再接続時にアプリへ送り返す」こと。**USB MSCで見せる実装は無い**
- USB: DevKitの `usb.c` はVBUS検知で充電中フラグを立てるだけ [F10]。Consumerは `CONFIG_OMI_ENABLE_USB=n` [F3 omi.conf]

### 電源管理（分かった範囲）
- Consumer: 150mAhの放電カーブ表を `battery.c` に持つ [F11]、ロードスイッチでSD/マイクの電源を切る、AADで無音時のPDM停止
- 実測の平均電流はリポジトリ・docsで見つけられず＝**未確認**

## 4. ライセンス
- リポジトリ全体: MIT（Copyright (c) 2024 Based Hardware Contributors）→ `reference/omi/LICENSE-omi-root.txt`
- Consumerハード: MIT → `reference/omi/hardware-consumer/LICENSE` [H1][D3]
- `t5838_aad.c` は Irnas / Brilliant Labs のコードを元にしたと明記 [F6]。流用時は元ライセンスを個別に確認（未確認）

## 5. このプロジェクトでの真似方（要約）
| Omiの要素 | そのまま真似 | 変える |
|---|---|---|
| XIAO nRF52840 Sense（DK1/2） | ○ 試作1台目の本命 | — |
| PDMマイク／T5838 AAD | 試作はXIAO内蔵マイク、本番はT5838×1〜2＋AAD | — |
| Zephyr + NCS, DK2のSPI SD + FATFS | ○ overlay/confをほぼ流用 | BLE・Opus送信・OTAを外す |
| 保存形式 | — | FAT/exFATの通常ファイル（MSCで見えるように）。Consumerの生セクタ方式は使わない |
| USB | — | Zephyr USB MSC（`CONFIG_USB_MASS_STORAGE`/新USBスタックのMSC）でSDを公開（Omiに無い） |
| 電池 150/250mAh | 形状は真似る | BLEが無い分持つはず。ただし容量は実測で決める |
| 筐体（Consumer STEP, DK STL） | ○ 寸法の基準 | USB-C口とSD口を追加 |

## 出典
- [H1] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/hardware/consumer/README.md
- [BOM] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/hardware/consumer/bom/omi-bom.csv
- [H2] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/hardware/triangle%20v2%20w%20memory/README.md
- [F1] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/readme.md
- [F2] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/devkit/prj_xiao_ble_sense_devkitv2-adafruit.conf , https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/devkit/overlay/xiao_ble_sense_devkitv2-adafruit.overlay
- [F3] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/omi/src/lib/core/config.h , https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/omi/omi.conf
- [F4] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/devkit/src/config.h
- [F5] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/omi/src/mic.c
- [F6] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/omi/src/t5838_aad.c
- [F7] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/devkit/src/sdcard.c
- [F8] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/omi/src/sd_card.c
- [F9] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/boards/omi/omi_nrf5340_cpuapp.dts
- [F10] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/devkit/src/usb.c
- [F11] https://github.com/BasedHardware/omi/blob/c10d3ca6efc8f9311b62f05da31e7eb03bd9184a/omi/firmware/omi/src/battery.c
- [D1] https://docs.omi.me/doc/hardware/DevKit1
- [D2] https://docs.omi.me/doc/hardware/DevKit2
- [D3] https://docs.omi.me/doc/hardware/consumer
- [B1] https://docs.omi.me/doc/assembly/Buying_Guide
- [P] https://www.omi.me/pages/pendant （10〜14時間, 2.5cm×1.5cm, 磁気USB-C充電）
- [R1] https://www.reddit.com/r/OmiAI/comments/1sr53ny/how_long_does_your_battery_last/ （逸話。DK2=250mAh/CV1=150mAhとの書き込みあり）
- [R2] https://www.reddit.com/r/OmiAI/comments/1tcv8im/but_what_about_the_battery/
