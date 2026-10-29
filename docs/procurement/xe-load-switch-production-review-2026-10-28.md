# U10量産実装方式レビュー — 2026-10-28

## 結論

旧正本の `TPS22916CYFPR / C2680319` は0.4 mmピッチDSBGA-4で、JLCではStandard PCBAかつX-ray対象だったため廃止した。

リード付きの第一置換候補は `TPS22917DBVT / C2680344`。JLC公開ページでSOT-23-6、Economic/Standard PCBA、在庫450（観測時点、未予約）を確認した。TI資料では1.0–5.5 V、2 A、常時逆流防止、出力放電、ON時0.5 µA typ、OFF時10 nA typで、3.3 Vストレージ電源スイッチとして必要機能を満たす。

`TPS22917DBVT` を正本へ採用した。CTは未接続、QODはVOUTと同じSD_V3へ接続。部品移動と再配線のため基板幅を24.0 mmから27.5 mmへ拡張した。ERC 0、DRC 0、未接続0、回路図/PCBパリティ0を確認済み。旧24 mm用ケース・パネル・CAMは失効しており、物理実測も未完のため発注保留は継続する。

## 比較

| 項目 | 現行 TPS22916CYFPR | 候補 TPS22917DBVT |
|---|---|---|
| JLC番号 | C2680319 | C2680344 |
| パッケージ | DSBGA-4、0.4 mm pitch | SOT-23-6、リード付き |
| JLC工程 | Standard、X-ray | Economic / Standard |
| 接合検査 | 外観不可 | リード外観検査可 |
| VIN | 1.0–5.5 V | 1.0–5.5 V |
| 逆流防止 | あり | あり |
| 出力放電 | あり | QOD端子で設定可能 |
| ON時自己消費 | 0.5 µA typ | 0.5 µA typ |
| 観測在庫 | 公開ページ表示なし、要再確認 | 450、未予約 |
| 現基板互換 | 廃止 | 27.5 × 27.0 mm正本へ採用済み |

## 採用ゲート

1. SOT-23-6版でERC 0、DRC 0、未接続 0、回路図/基板一致 0。**達成済み**。
2. CT設定とQOD接続をTI推奨条件で固定し、SD電源の立上り、停止時放電、逆流を実測。
3. 16時間電流予算を再計算し、最終的には固定110 mAh実機で16時間連続録音を確認。
4. 27.5 mm幅のケース、マイク音道、実装高さ、電池隙間を再生成・確認。
5. 発注直前にJLC通常在庫と実装工程を再確認。

## 出典

- JLC TPS22916: https://jlcpcb.com/partdetail/TexasInstruments-TPS22916CYFPR/C2680319
- JLC TPS22917: https://jlcpcb.com/partdetail/TexasInstruments-TPS22917DBVT/C2680344
- TI TPS22917: https://www.ti.com/product/TPS22917

注文、部品予約、製造データのアップロード、業者問い合わせは行っていない。
