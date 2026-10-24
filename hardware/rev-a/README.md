# Pendant Recorder Rev A0 — 回路レビュー用

> 最新追記: 円形制約を解除。Omi相当の小ささで密度を優先し、24×24×14mm角丸外形・21×21mm両面基板を第一の検討枠とする。未配置・未検証。以下の円形寸法は従来の比較案として保持。[最新方針](../../docs/density-study.md)。

> 装着用v1はOmi相当の直径約25.5mm・厚さ約15mmを目標とする。22mm円形枠で配置を検証し、必要ならMCUパッケージを再選定する。本LQFP64回路の30mm角版は電気検証用。 詳細: [v1製作方針](../../docs/v1-build.md)

2026-10-24。**回路図ドラフト。基板発注用ではない。** KiCad回路図、接続表、BOMを用意した。PCB配線・フットプリント確定・実測は未実施。四角いピン表示のカスタムシンボルは各端子を明示するためのもので、実装形状を示さない。

- [SVGプレビュー](pendant-rev-a.svg) / [検査記録](verification.md)
- `pendant-rev-a.kicad_sch`: 自己完結した編集可能なKiCad回路図（A0、4列）
- `design.json`: 部品、ピン番号、接続ネット、注記の原本
- `connections.csv`: 全端子接続表
- `bom.csv`: 値と候補型番。TBD部品を含むため注文用ではない
- 再生成: `python3 hardware/tools/generate_schematic.py`

> 録音目標は[連続48時間](../../docs/two-day-runtime.md)へ更新。150mAhを本命、210mAhを比較する。以下の100mAh/16時間は既存回路ドラフト時の条件で、電池BOMの更新・実測は未完了。

## 既存案からの必須修正

1. **STM32U535CBU6ではSDMMCを接続できない。** ST公式のUFQFPN48端子データにSDMMC信号がない。試作は **STM32U535RCT6 / LQFP64、内部LDO版**。PC8/9/10/11/12、PD2を使用する。22mm円形の量産候補はUFBGA64等を別途選定し、端子表と配置をやり直す。LQFP64案が22mmに収まるとは主張しない。
2. **T5838は1.8V専用、底面音孔。** 最新DS-000383 v1.2では1.62〜1.98V、絶対最大も1.98V。既存の3V直結案は不可。OmiのMIC1回路を参考に1.8V LDO＋TXS0104Eを入れた。基板の音孔とガスケットが必要。
3. USB PHYには **VBUSから専用3.3V LDO→VDDUSB**。録音用3.0Vとは分け、USBの電源条件を満たす設計とする。USB切断時のVDDUSB=0、電源監視・USB起動順序はST資料と実機で検証する。
4. BQ25101のBATにMSC負荷を直接ぶら下げない。USB中はD2からSYSへ給電し、Q1で電池からSYSへの経路を遮断する。これにより充電電流に同期中のシステム負荷が混ざるのを避ける。
5. 100mAh電池の初期充電電流は**約50mA**。RISET=2.7kΩ、135/2700=0.05A。Omiの1kΩ=135mAをそのまま流用しない。CC/CV充電時間は2時間以上が目安で、セル仕様と実測で確定する。

## Omiからの継承と差分

基準: `reference/omi/hardware-consumer/mainboard-schematic.pdf` の実際のタイトルは **OMI 2 v0.5、5ページ**。上流のフォルダ/READMEのv1.2表記と区別する。

| Omi回路 | 本設計 |
|---|---|
| Sheet 4 MIC1 T5838、1.8V、TXS0104E、100nF、SELECT=GND | 電圧と信号構成を継承。LDOを低Iq品へ変更。1マイクで開始 |
| Sheet 4 SD NAND + TPS22916、スイッチ後電源へのプルアップ | 継承。512MB→4GB、SPI→SDMMC 4bit。CMD/DAT0〜3の5本をプルアップ |
| Sheet 5 BQ25101、ISET、10k NTC、入出力2.2µF | 継承。50mA設定、保護付きセル、外付け負荷分離、充電停止GPIO追加 |
| Sheet 2 SWD、32kHz水晶 | 構成を参考にし、STM32固有の端子とVCAPに変更 |
| 無線SoC、Wi-Fi、RF、IMU、振動モーター、磁気充電台 | 非搭載。USB-Cを本体へ直付け |
| 生セクタのリングバッファ | 不採用。FAT上の通常WAVファイル |

参照ファイルは改変せず、MITライセンスを保持している。

## 接続の要点

| 機能 | STM32ポート / LQFP64端子 | 接続 |
|---|---|---|
| SD DAT0/1/2/3 | PC8/9/10/11 = 39/40/51/52 | NAND 6/7/1/2 |
| SD CLK / CMD | PC12 / PD2 = 53/54 | 22Ω経由NAND 3 / NAND 5 |
| ADF CLK / DATA | PB3 / PB4 = 55/56 | TXS B4 / B3。PC10/11のADF機能はSDと競合するため使わない |
| MIC WAKE / THSEL | PA2 / PA3 = 16/17 | TXS B1 / B2 |
| USB D− / D+ | PA11 / PA12 = 44/45 | 22Ω仮値、ESD、USB-C両面端子 |
| I2C SCL / SDA | PB6 / PB7 = 58/59 | MAX17048、4.7kΩ→V3 |
| SWDIO / SWCLK | PA13 / PA14 = 46/49 | パッド。VTrefは電圧参照のみ |
| SD_EN / MIC_EN | PB0 / PB1 = 26/27 | 起動時プルダウンでOFF |
| USB検出 | PA0 = 14 | Q3経由、**VBUS_N=Lowで接続** |
| 電池割り込み / 充電状態 | PA1 / PB14 = 15/35 | Active low |
| 充電禁止 | PB2 = 28 | High→Q2→TSをGNDへ。通常はLow |
| 録音LED / ボタン | PB12 / PB13 = 33/34 | D1 High点灯、ボタンLow |
| 残量3点LED | PA4/5/6 = 20/21/22 | R29/30/31→D3/4/5、High点灯 |
| 状態LED | PA7 = 23 | R32→D6、High点灯。充電/同期/異常 |
| LSE | PC14/15 = 3/4 | 32.768kHz、容量は水晶確定後に計算 |

VDD 19/32/64はそれぞれ100nF、共通10µF。VCAP 30は4.7µFで他負荷禁止。VDDAは0Ω経由V3＋100nF/1µF。VBAT端子はV3で、電池直結ではない。保護遮断時はRTCを失う。

### 電源経路

- 持ち歩き: 保護済みBAT→Q1→SYS→3.0V LDO→MCU/SD。マイクのみ1.8V。
- USB接続: VBUS→D2→SYS。同時にVBUS→BQ25101→BAT、VBUS→3.3V LDO→VDDUSB。
- **Q1はsource=SYS、drain=BAT**。ボディダイオードをBAT→SYS向きにする。通常の高側スイッチと見た目が逆なのでフットプリント照合必須。gate=VBUS、100kΩでGNDへ。低VGSでのRDS(on)、逆漏れ、最大VGSを満たす型番は未選定。
- MAX17048は保護済みBATに接続。I2CプルアップはV3。保護セルが外れた際のI2C端子からの逆給電も確認対象。
- TSはセルに密着させた10k NTC。電池内蔵NTCとTH1を二重実装しない。NTCを省略したまま使用しない。
- セル保護は電池パックに要求する。BQ25101は過放電/短絡保護回路の代用にはならない。

### USBとSDの所有権

1. VBUS検出だけでは充電のみ。録音ON/OFFを維持し、SDはファームが所有する。同期要求（暫定: USB接続中にボタン2回押し）を受けて初めて録音DMA停止→WAVヘッダ確定→flush/sync→FAT unmount。
2. USB用電源を検証してPHY/MSC開始。MSC中はホストからのブロック要求だけがSDを使用し、ファームのファイル処理は動かさない。
3. USB切断後はMSC処理を停止してからFATをmount。`TIME.TXT`を検査してRTC設定、同期前の録音ON/OFFへ戻す。Macは安全な取り外しを行う。充電のみでの切断はSDを再mountしない。
   - データ接続のない充電器で同期操作をした場合、未接続タイムアウト後にMSCを停止し、ファームがSDを安全に再取得して元の録音状態へ戻す。
4. USB suspendでは充電禁止、SD停止、USB規定内への低消費電力化が必要。起動・未列挙時は総入力100mA以内を設計予算とし、50mA充電＋システムの最悪値を実測する。
5. SD電源OFFはsync/unmount後。CMD/DAT/CLKをHi-ZにしてプルアップはSD_V3のみ。再起動時は低速初期化とACMD6による4bit設定を行う。
6. 電圧低下で新規録音を開始しない。BORで突然切れる前にファイルを閉じる閾値と残時間を実測する。録音ファイルの自動削除は実装しない。

## 発注前に解決する項目

- J1、Q1、D2、水晶、セルの実型番、全フットプリント、ランド/マスク/ステンシル。
- VBUS突入電流。直結容量だけでなくD2下流と充電経路も含め、必要なら電流制限/ソフトスタートを追加。USB suspend、逆流、抜き差しでの電圧低下も実測。
- 3.0V LDOのピーク電流/ドロップアウトとSD_V3≥2.7V。SDの長い内部busyを含めた電力測定。容量/typ値からの平均電流予測は保証ではない。
- TXS0104Eの波形と負荷容量。PDMクロック768kHz、16kHz化のADF設定、SELECT=Lowの受信エッジ、AAD双方向THSELを検証。
- LSEのCL、寄生容量、ESR、起動マージン。仮の10pFをそのまま発注しない。
- メーカーの全電源条件、GPIO AF番号、USBクロックとCRS、CubeMX設定を確認。
- 30mm角4層試作で電流を測る。装着用v1は22mm円形枠への配置とOmi相当の外形（直径約25.5mm・厚さ約15mm）を検証する。12g・16時間録音も未達成の目標。

## 一次資料

- ST package-specific pin data: https://github.com/STMicroelectronics/STM32_open_pin_data/blob/7d1f1514ed5583ec5007ad91236b4e1d377295b1/mcu/STM32U535RCTx.xml （比較: `STM32U535CBUx.xml`）
- ST DS14217: https://www.st.com/resource/en/datasheet/stm32u535cb.pdf
- ST AN5373: https://www.st.com/resource/en/application_note/an5373-getting-started-with-stm32u5-mcu-hardware-development-stmicroelectronics.pdf
- TDK DS-000383 v1.2: https://d17t6iyxenbwp1.cloudfront.net/s3fs-public/2026-01/DS-000383-T5838-Datasheet-v1.2.pdf
- SD NANDメーカー資料（代理店配布）: https://datasheet.lcsc.com/datasheet/pdf/bfa5f23b6901abecebf24c347afa6e3d.pdf?productCode=C5440134
- TI BQ25101: https://www.ti.com/lit/ds/symlink/bq25101.pdf
- TI TPS7A02: https://www.ti.com/lit/ds/symlink/tps7a02.pdf
- TI TXS0104E: https://www.ti.com/lit/ds/symlink/txs0104e.pdf
- TI TPS22916: https://www.ti.com/lit/ds/symlink/tps22916.pdf
- ADI MAX17048: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX17048-MAX17049.pdf
- Omi固定commitと各ファイル: ../../docs/omi-reference.md

充電のみの追加はファームの状態遷移で対応する設計。現在の回路では給電経路とUSBデータ線が分かれているため、現時点で回路図の変更は不要。ファーム実装と電源状態別の試験は未完了。

## インジケーター追加

残量3点（D3〜D5）＋独立した状態LED（D6）を追加。既存D1は録音専用。各追加LEDはGPIO→6.8kΩ（仮）→LED→GND、アンバー0402候補。低電流での輝度とVfを満たす型番は未選定。GPIOはLQFP64の未使用PA4〜PA7を割り当てた。画面やLEDドライバは追加しない。

暫定の駆動電流は追加1点あたり0.1〜0.2mA。実値はVfとGPIO出力電圧に依存する。録音D1が仮に0.3mAで16時間点灯すると4.8mAhを使うため、省電力見積りのLED枠を従来のまま流用しない。電池残量の表示は短時間、録音表示は独立して継続。追加LEDは起動時にGPIOをLowへ初期化し、ファーム状態に応じて表示する。

表示の閾値・優先順位はdocs/requirements.md。本回路のCHGは充電中を示す信号で、Highだけでは完了/無充電/異常を識別できない。MAX17048のSOC≥95%は「満充電付近」の推定表示に限定し、充電終止の確定表示にはしない。温度停止などの詳細識別には追加監視の要否を評価する。
