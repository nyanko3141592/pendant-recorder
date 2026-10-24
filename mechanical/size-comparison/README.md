# A2 / Rev B / Omi / 500円玉の同縮尺比較

既存の structure-a2/assembled.json と structure-b0/assembled.json を、寸法を変えずに同じSolidCraftシーンへ配置したもの。両モデルの下端を揃えた上面図と斜視図を収録。

|対象|幅 × 長さ × 厚さ (mm)|
|---|---|
|旧 A2|24.8 × 41.5 × 12.8|
|Rev B0|24.8 × 46.5 × 12.8|
|Omi（簡略外形）|直径25 × 厚さ15|
|500円玉|直径26.5|

Rev Bは長さが5mm増加（約12%）。幅・厚さは同じ。ケースは設計検討モデルであり、製造保証寸法ではない。

500円玉の直径は財務省の公表値: https://www.mof.go.jp/policy/currency/coin/general_coin/list.htm
硬貨の模様・二色境界・縁は簡略表現。厚さ1.8mm＋縁0.12mmは視覚表現用の仮定であり、公称寸法として扱わない。

- top.png: 上面からの外形比較
- angled.png: 厚さを含めた斜視比較
- comparison.solidcraft / comparison.step: 編集用CAD / 交換用モデル
- generate.py: 既存モデルからシーンを再生成

再生成:
```
python3 mechanical/size-comparison/generate.py
solidcraft-cli run mechanical/size-comparison/comparison.json --save mechanical/size-comparison/comparison.solidcraft --out mechanical/size-comparison/comparison.step --quiet
solidcraft-cli snapshot mechanical/size-comparison/comparison.solidcraft --out mechanical/size-comparison/top.png --width 1800 --height 1000 --view top --no-grid --no-axes
solidcraft-cli snapshot mechanical/size-comparison/comparison.solidcraft --out mechanical/size-comparison/angled.png --width 1800 --height 1000 --view iso --no-grid --no-axes
```

## Omi比較の追加

Omiは公式商品ページの2.5cm × 1.5cm（直径 × 高さ）に基づく直径25mm・高さ15mmの簡略円筒。実機CADではなく、角の丸み、穴、シリコンケース、チェーンは再現していない。既存調査の25.5mmとは丸め差があるため、この図は公式商品表記25mmを使用。
出典（2026-10-24確認）: https://www.omi.me/pages/product および https://www.omi.me/pages/gpt

左から旧A2、Rev B、Omi、500円玉。回路・各試作モデル自体の寸法は変更していない。
