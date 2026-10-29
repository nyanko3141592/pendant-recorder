# Mini USB v9 — 回路・丸形収納の比較試作

2026-10-25。USB-Cデータ書き出し＋充電、連続16時間、専用台なし、無線なしを維持する設計案。**発注不可。** 回路図と実フットプリント配置は更新したが、配線完成版ではない。

## 今回の変更

- 実装80点→68点（パッド等を含め74フットプリント）。STM32U535CEU6のQFN48は維持。高価なWLCSP/HDIへの変更を避け、4層の配線成立性を試験中。4層化は未資格化。
- T5838＋TXS0104E＋1.8V LDOを、3.3V直結PDMのIM69D130に変更。AAD/WAKE/THSELを削除。0.768MHz・16kHz/48倍デシメーションを評価候補とする。低電力モードはSNR64dBで、静かな声の音質と電力を実機比較する。データシートの0.3mAは1.8V条件であり、3.3Vでの実測値ではない。
- BQ25185で充電と電源切替を統合。24kΩで4.2V/入力100mA、15kΩで充電20mA候補。SYS10µFの実効容量、ISET10nF、低電圧・ピーク負荷は要検証。
- 温度保護は削除しない。TLV7042の2つのオープンドレイン出力でQ4ゲートをクランプ。MCU許可信号→10kΩ→ゲート、ゲート100kΩプルダウン。冷・熱のどちらか異常ならゲートLow、Q4 OFF、CEのVBUS100kΩプルアップで充電停止。MCUリセット時も許可なし。理想論理のみ確認、POR/瞬断/短絡/公差は未資格化。
- 電池NTCは外部窓比較器で監視。BQ25185内蔵TSの固定10kΩを温度センサー扱いしない。既存10k/B3370仮定の狭い充電窓（公称約20–30℃）を保持。実際のパック仕様が未確定なので設定値も最終値ではない。
- LEDを1個に集約。表示要求時の点滅で残量表示、常時点灯を避ける。
- 記憶容量を4GB→512MiBのCSNP4GCR01-DPWに変更した価格削減候補。LCSC公開表示は欠品。データシートのピン配置は確認済みだがフットプリント製造受理は未確認。4GB版への復帰は同じ収納包絡内で可能性があるものの、ランド再照合が必要。

## 収納

新案26×28×14mm、平面R12.9、縁R2。旧印刷基準26×31×14mm・R5を上書きしていない。正面面積は約25.4%減。OmiのD25.5×15mm寸法包絡比では正面面積約14.6%増。Omi模型は円筒の寸法ゲージで、実製品CADではない。

基板は24×26mmカプセルをUSB側y=24.5mmで切った形。0.8mm厚、下面z=8.5mm。電池15×17×6mm、100mAh候補包絡は維持。低い部品を基板裏に回し、電池上端との公称隙間を確保。電池の保護基板・完成リード・コネクタ配線・膨張公差は未資格化。ケースはテープ仮止め、2点仮支持で、量産用の爪・紐穴・防水・音道シールではない。

## 検査結果

- `erc.json`: ERC 0。
- `drc.json`: 未配線配置原本の幾何DRC 0、回路図等価性0、未配線175件。これを配線済みと扱わない。
- `route-trial.kicad_pcb`: 4層の試験配線。`route-trial-drc.json`に15違反、5未接続。GND面・USB差動/リターンパス・デカップリング配線の再設計が必要。製造用Gerberは出していない。
- 実部品の寸法ではなく、フットプリント外接矩形＋仮高さの保守的な立体包絡。ケース/蓋と部品/電池に重なりなし。部品と電池も重なりなし。支持面の接触あり。
- 5組のSTL/3MFで閉メッシュ、法線整合、単一接続体、正体積、Z=0、mm単位を確認。全三角形間の自己交差を網羅検査したものではない。
- Bambu A1 mini 0.4/PLA/0.2mm/3壁/15%/サポートありで4部品スライス完了。推定23分1秒・5.04g。プリンタ送信/物理印刷は未実施。

## 16時間の条件とトレードオフ

100mAhの70%を使えると仮定すると、平均消費電流は4.375mA以下が必要。達成は未実測。電池の容量を先に減らしていない。

512MiBでは16kHzモノラルIMA-ADPCM、10秒ごとのWAVをage v1暗号化、4KiBクラスタ・暗号化余裕1KiB/区間と仮定し16時間で495,452,160byte。FS予備16MiBを引いた残りは24,641,536byte。実CSD容量/実ファイルサイズ/空き容量検査が必要で、複数日録音や16時間PCM16には使えない。自動削除・上書きはしない。

## 資料

- `pendant-mini-usb-v9.kicad_sch` / `schematic.pdf` / `design.json`: ピン単位回路原本。
- `pendant-mini-usb-v9.kicad_pcb`: 未配線配置原本。`route-trial.*`は別の試験。
- `connections.csv` / `bom.csv`: 設計確認用。JLC発注承認済みBOMではない。
- `review.json`: 電力・容量の算術、理想論理表、発注前と実機の残件。
- モデル: `/Users/takahashinaoki/Downloads/Pendant-mini-usb-v9/`
- 比較原本: `/Users/takahashinaoki/Downloads/Pendant-rounded-fit-v7/`
- 再生成スクリプトは配置/回路を上書きする。手修正後には無条件で再実行しない。

## 出典・調達の状態

2026-10-25閲覧。カタログ掲載は在庫確保・見積り画面の照合完了を意味しない。

- [Infineon IM69D130 datasheet](https://www.infineon.com/dgdl/Infineon-IM69D130-DS-v01_00-EN.pdf): 3.3V直結、PDM、端子、低電力モードの根拠。JLC候補[C536262](https://jlcpcb.com/partdetail/InfineonTechnologies-IM69D130V01/C536262)。末尾発注品番との同一性を要確認。
- [TI BQ25185 datasheet](https://www.ti.com/lit/ds/symlink/bq25185.pdf): 端子・設定・電源経路。JLC候補[C19725033](https://jlcpcb.com/partdetail/TexasInstruments-BQ25185DLHR/C19725033)。[LCSC参考](https://www.lcsc.com/product-detail/C19725033.html?s_z=n_MS2548)は1個$1.7472の表示、PCBA価格ではない。
- [TI TLV7042](https://www.ti.com/product/TLV7042/part-details/TLV7042DDFR): オープンドレイン出力。[LCSC C2867856](https://www.lcsc.com/de/product-detail/C2867856.html)。在庫表示がページ間で相違し未確定。
- [CSNP4GCR01-DPW](https://www.lcsc.com/product-detail/C50396672.html): 512MiB、公開表示欠品・1個参考$12.4734。旧4GBの途中JLC見積り約$40.16/個より低い参考値だが、今回の購入可能価格ではない。総額が安くなることは未確認。
- [Omi consumer hardware](https://docs.omi.me/doc/hardware/consumer): 小型基板、SD NAND、電池と基板の重ね方を参照。専用充電台/無線/HDI加工をそのまま採用していない。
