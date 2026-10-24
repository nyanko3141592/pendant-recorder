# Rev B0 — アンテナ内蔵Bluetooth / 有線録音機

**製造リリース前。発注不可。** 回路図と実フットプリントを割り当てたPCBを作成し、配線を検証中。現状は **ERC 0、DRC 4（USB端子NPTHクリアランス）、未接続2（BAT/GND）**。`order-status.json` と `drc.json` を参照。Gerber/CPLの発注用ZIPは発行していない。

## 回路原本

- [design.json](design.json) / [KiCad回路図](pendant-rev-b.kicad_sch) / [回路図SVG](pendant-rev-b.svg)
- [KiCad PCB](pendant-rev-b.kicad_pcb) / [接続表](connections.csv) / [設計BOM](bom.csv)
- [部品調達照合](sourcing-review.json) / [ケースのSolidCraftモデル](../../mechanical/structure-b0/README.md)

Rev Aから独立した新回路。nRF52840を搭載するRaytac MDBT50Q-1MV2、T5838 PDMマイク、SPI接続4GB SD NAND、USB-C充電/MSC、BQ25101、MAX17048、保護付き110mAh既製電池を組み合わせる。68部品。ソフトv1は無線停止・有線同期、ソフトv2でBluetooth同期を目指す。

## 電気設計の変更

- STM32のSDMMCをSPIへ変更。SD NANDのDAT3=CS、CMD=DI、DAT0=DO、DAT1/2はSPI予約端子。資料の端子表と照合。
- モジュールVDDとVDDHを3.0Vへ接続、DCCHはNC。Raytac Ver.L p40の通常電圧構成。内蔵Reg1 DC/DCを使うファーム設定が必要。外部3.0V LDOを維持し、USB用3.3V LDOとSTM32固有回路を削除。
- VBUSはモジュールUSB用入力へ。USB挿入で録音状態を変える設計にはしない。27Ωシリーズ抵抗はメーカー参照値。
- RF付近の低周波専用GPIOにはボタン・表示・enable等を割当て、PDM/SPI/I2Cは通常GPIOに割当て。
- レベル変換はTXS0104EPWR/TSSOP-14へ変更。DSBGA中央パッドの引出しを避ける。TIのPW端子表と照合、JLC C44955掲載確認（確保/実装受理ではない）。
- 表示は録音1点＋共用状態1点。残量は短押し時の点滅回数等で表す案。実装/視認性試験は未完了。
- SWDは標準6接点を維持し、nRF対応プローブ/完成ケーブルを使う。STLINKをそのまま使えると扱わない。

## 基板・構造

22×43.5×0.8mm、4層。基板先端に全層RF禁止領域を設定。表面に主要回路、裏面にPH端子/NTC/測定接点を配置。USBシェル貫通穴と裏面PH端子が干渉しないよう左右に分離。電池はアンテナ領域を避け、コネクタと平面に並べる。構造案24.8×46.5×12.8mm。最小寸法を証明したものではない。

配線はFreeroutingで試行した結果をKiCadへ戻しDRCで検査する。ルータの「完了」は全結線や電気設計の正しさを保証しない。USB差動配線、連続GNDリターン、電源幅、デカップリング、RF、クリアランスのレビューが必要。

## 製造前の未解決事項

1. 全結線とDRC解消。USBフットプリントのNPTH付近のクリアランスは業者能力と図面の再照合が必要。違反を除外して合格にはしない。
2. USB入力10µF＋充電回路の入力容量による突入電流。容量のDCバイアス、USB規格、給電切替を検証し必要なら対策する。
3. モジュール、マイク、充電ICを含む全BOMの正確な品番・在庫・JLC Standard両面実装受理。全端子/フットプリント、極性、電池PH結線を監査。
4. 充電電流、保護電池条件、NTC熱結合、終止判定とUSB給電時の負荷分離をレビュー。
5. 完成品の書込み/測定治具、嵌合電池コネクタ・未加工リード線の実寸収納、ケース固定、マイク音道、装着方法。
6. 小型基板の製造パネル・治具・フィデューシャルをJLC条件へ合わせる。

24時間超の録音・36時間保存・ランダム電源断・暗号化・3 OS同期は、製作後のv1実機合格条件。回路図/ERCだけで合格や製品保証とはしない。

## 出典と再生成

[RaytacデータシートVer.L](https://www.raytac.com/download/index.php?index_id=43)、[TI TXS0104E](https://www.ti.com/lit/ds/symlink/txs0104e.pdf)、[SD NAND](https://datasheet.lcsc.com/lcsc/2410121341_CS-Semiconductor-CSNP32GCR01-BOW_C5440134.pdf)、[JLC製造能力](https://jlcpcb.com/capabilities/Capabilities)。2026-10-24照合。

`python3 hardware/tools/create_rev_b.py` → `generate_schematic.py rev-b`。PCBはKiCad同梱Pythonで `layout_rev_b.py`（配線を破棄して配置から再生成するため注意）→ `route_rev_b.py export` → Freerouting → `route_rev_b.py import`。実行した版とログはrouting/へ記録。配線後は `refine_rev_b.py` → `stitch_rev_b.py` → `cleanup_rev_b.py` でGNDポア・接続用ビアを追加/検査する。再実行時は配置から再生成する。0.15mmを通常配線幅とし、局所引出しの最小幅はJLC能力に合わせ0.10mm。クリアランス0.15mm、穴クリアランス0.20mm。DRC除外は設定していない。`verify_design.py <kicad-cli> rev-b` で接続表照合とERC。
