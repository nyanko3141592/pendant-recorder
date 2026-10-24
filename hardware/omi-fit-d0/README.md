# D0: Omi外形を目指す配置検討（発注不可）

2026-10-24。現行Rev C回路の全76参照（69実装部品＋7接点群）を保持し、23×23×0.8mm、角R2mmの両面基板へ再配置。これは配線前の設計検討であり、Rev C原本を置き換える製造リリースではない。

変更はJ2をPHからJST SH SM02B-SRSS-TBの2極横型にするもの。BAT/GNDの電気的接続は保持。電池は150mAh丸形の保護付き完成パック候補だが、品番・外形・極性・完成短尺ハーネスは未確定。NTCは現回路同様、業者実装TH1を絶縁熱伝導パッドで電池へ接触させる想定。裸セル直結やNTC省略を許可しない。

回路図の原本は[Rev C](../rev-c/pendant-rev-c.pdf)。このフォルダに新しい回路図のリリースはない。`parts.json` は配置検討の部品対応表であり、発注BOMではない。

## 検査結果

- 全76参照が存在。PCB各パッドのネットを部品対応表と照合し、不一致0。
- 最終KiCadフットプリントの矩形包絡は角丸基板外形内。重なり検討は両面別で実施。
- USB貫通パッドの裏面領域を予約し、短絡と他部品への貫通穴干渉を解消。
- DRC 4件（USB内部の穴クリアランス）、未接続182件、配線0。**発注不可**。
- Rev Cと同じ設計ルールを使用、除外リストは空。回路図とのKiCad parity検査は未実施。
- 直径23mmの円形基板は初回150 seedの配置探索で全数配置できず。これは不可能の証明ではない。角丸四角案は全数配置できたが配線性・電源/信号品質は未確認。

`order-status.json` と `drc.json` に機械可読の結果を保存。部品高さ、はんだ、線材、音道、治具、温度応答の物理検証は別途必要。

## 再生成

KiCad 10のpcbnewが使えるPythonで `place.py` を実行。現在は角丸四角案を生成する。`kicad-cli pcb drc --format json --output drc.json omi-fit-d0.kicad_pcb` の後、同じPythonで `verify.py`。KiCad標準フットプリントと `../rev-c/Pendant.pretty` に依存する。

[配置画像](../../mechanical/structure-d0/placement.png) / [ケースと計算](../../mechanical/structure-d0/README.md)

[コネクタのメーカー資料](https://www.jst-mfg.com/product/pdf/eng/eSH.pdf)。KiCad footprintにはヘッダだけでなく、検討上の嵌合・線曲げ予約を加えて配置した。完成ハーネスの実収納は未確認。
