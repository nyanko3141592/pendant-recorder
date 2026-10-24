# Rev C0 — 小ささ優先 / USB / 16時間録音を目指す回路

**設計検討版、発注不可。** [V1の範囲](../../docs/v1-scope.md)を優先する。Rev A/Bを上書きしない。回路図、接続表、実フットプリント配置、配線試行、収納モデルを追加した。寸法と電池持ちの成立を保証するものではない。

## 原本

- [回路図PDF](pendant-rev-c.pdf) / [KiCad回路図](pendant-rev-c.kicad_sch) / [SVG](pendant-rev-c.svg)
- [design.json](design.json) / [全端子接続表](connections.csv) / [BOM](bom.csv)
- [KiCad PCB](pendant-rev-c.kicad_pcb) / [部品配置](placement-report.json)
- [検証・発注条件](order-status.json) / [DRC](drc.json) / [ERC](erc.json)
- [ケース構造](../../mechanical/structure-c0/README.md) / [同縮尺比較](../../mechanical/size-comparison-c0/README.md)

## 現時点の検査

ERC 0、回路図とPCBの等価性差分0、260物理パッドのネット所属一致。DRC 5（USB穴クリアランス4、行き止まり配線1）、未接続67。配線は未完了で発注不可。チェックの成功は電気動作・16h動作の検証ではない。

## 回路の変更

76参照（実装部品69点＋基板接点7点）。無線モジュールをSTM32U535CEU6（UFQFPN48、7×7mm、512KB Flash/274KB SRAM、内部LDO版）へ変更。無線回路・アンテナ・RF空間はない。SDはSPIを維持し、48ピン品にSDMMCがない問題を回避する。これはMCU候補を使った回路設計で、量産採用・調達承認ではない。

- USB: PA11/PA12、SWD: PA13/PA14。
- マイク: PB3/PB4をADF1 CCK0/SDI0（AF3）へ。SPIと重複させない。
- SD: PA5/PA6/PA7をSPI1（AF5）、PA4をGPIO CS。
- 48ピンMCUには独立VDDUSB端子がないため、電源を**3.3V**へ変更。3.0V LDOの下限公差をUSB仕様へ当てない。電池終止・LDOドロップアウトによる使用容量減少は実測が必要。
- MAX17048とI2C周辺を外し、1MΩ＋1MΩ分圧と10nFでPA1へ電池電圧を入力。最大4.2Vから2.1V、定常分圧負荷2.1µA。概算残量のみ。VREFINT校正・ADC取得時間・入力漏れとRC整定を検証する。
- USB保護を同シリーズのUSBLC6-2P6/SOT-666へ小型化。ST機能端子表を参照。実装向き・ランド・受理は最終監査待ち。
- T5838＋1.8V LDO＋TXS0104EPWR、4GB SPI SD NAND、BQ25101約21.8mA、NTC＋充電停止、USB負荷分離、保護付き110mAh電池を維持。
- 録音LED＋状態LED、1ボタン。画面・キャラ・無線は追加しない。
- LSE＋内部クロック/USB CRSで動作を検討。水晶・負荷容量・USBクロック精度は未検証。

## サイズ・電力

21×31×0.8mmの4層両面基板へ実フットプリントを配置。上面にUSBとPH端子、裏面に低背部品を置く。電池は基板下へ重ねる。ケース案23.8×34×14mmで、Rev B比で長さ12.5mm減、幅1mm減、厚さ1.2mm増、直方体包絡体積約23%減。22×34×12mmの目標は達成していない。部品が置けたことと配線・組立可能性は別。

110mAh×仮使用率70%=77mAh。16hは電池端平均4.8125mA以下、20hは3.85mA以下という計算条件。3.3V化後の使用率70%は未検証で、実測時間の見積もりとして断定しない。平均2mA/3mA等を実測値として扱わない。

## 発注前の主要残件

- 全結線/DRC、USB差動配線、GND帰路、電源幅、ピン直近デカップリング。自動配置・配線の結果を電気的完成扱いにしない。
- 全ピンと代替機能の独立監査。MCUピン番号はKiCad公式ライブラリから抽出、ST DS14217と最終全数照合待ち。USB共有電源・ADC・起動・低電圧復帰を実機検証。
- 全品番/公差/高さ/在庫/JLC Standard両面実装受理。TBDの水晶、LED等を確定。ソース・BOMに載せただけで購入可能としない。
- PH嵌合プラグ、100mmの未加工線、セル膨張、NTC熱接触、底面マイク音道、ふた固定、紐/クリップ、USBプラグ挿抜クリアランス。
- 16h録音・36h保存・充電中録音・暗号・電源断・3 OS同期。これらのファームは未実装。

## 出典

2026-10-24確認。
- ST: https://www.st.com/en/microcontrollers-microprocessors/stm32u535ce.html
- STM32データシート: https://www.st.com.cn/resource/en/datasheet/stm32u535cb.pdf （DS14217 Rev5、パッケージ/端子/AF表）
- ESD保護: https://www.st.com/resource/en/datasheet/usblc6-2.pdf / https://www.st.com/en/protections-and-emi-filters/usblc6-2.html
- USBLC6-2P6カタログ: https://www.lcsc.com/product-detail/C15999.html （掲載は実装受理・在庫確保ではない）
- 電池・他部品の出典はRev B、docs/battery-sourcing.mdを継承。

## 再生成

`python3 hardware/tools/create_rev_c.py` → `generate_schematic.py rev-c` → `verify_design.py <kicad-cli> rev-c`。KiCad同梱Pythonで `layout_rev_c.py` を実行すると配置から再生成し既存配線を消すため注意。`route_rev_c.py export/import` はローカルFreerouting試行用。最新版の発注可否はorder-status.jsonを読む。

最終メタデータ同期は `sync_rev_c_metadata.py`、検査と発注不可レポート更新はKiCad Pythonで `check_rev_c.py`（未達時exit 2）。
