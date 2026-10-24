# Rev B / Rev C / Omi / 500円玉

左から旧Rev B、新Rev C0（収納ドラフト）、Omi（簡略円筒）、500円玉（簡略形状）。既存のCAD寸法を維持して同じシーンへ配置。

|対象|外形 mm|
|---|---|
|Rev B|24.8×46.5×12.8|
|Rev C0|23.8×34×14|
|Omi|直径25×厚さ15|
|500円玉|直径26.5|

C0は長さ12.5mm減、幅1mm減、厚さ1.2mm増。直方体包絡体積14.761cm³→11.329cm³（約23.3%減）、正面包絡面積は約29.8%減。丸みを引いた実体積ではない。C0は発注・収納検証前で、この外形へ全て確実に収まるという保証ではない。Omiよりまだ長い。

- [上面比較](top.png): --view topで同縮尺比較。
- [斜視比較](angled.png): 厚みを見る参考。
- [SolidCraft](comparison.solidcraft) / [STEP](comparison.step)

Omiは https://www.omi.me/pages/product の直径25mm・高さ15mmから簡略化。500円玉は https://www.mof.go.jp/policy/currency/coin/general_coin/list.htm の直径26.5mm。硬貨の厚さ1.8mm＋縁0.12mmは視覚用仮定、意匠は省略。Omiの曲面、シリコンカバー、チェーンは含まない。

`python3 mechanical/size-comparison-c0/generate.py` → SolidCraft CLI run → snapshot（1800×1000、top/iso、no-grid/no-axes）。
