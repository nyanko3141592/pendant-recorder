# Rev A1 配置検討 — 2026-10-24

**発注不可。部品配置の初期検討であり、配線済みの回路基板ではない。**

## 作成済み

- 92部品すべてにフットプリントを割り当て、308論理端子（282接続、26 NC）と実パッドの番号を照合。USBの重複パッド、マイク環状GNDなどは同一端子に複数パッドを持つ。
- KiCad 4層・0.8mm厚の基板データ。現在の配置枠は20×34mm。矩形の外接領域を使う自動配置であり、配線・信号品質・デカップリング・操作性は未最適化。
- 電池端子を既製パック用の2極JST PHへ変更。温度センサーTH1は基板実装し、絶縁材を介してセルに接触させる前提。現配置のTH1位置は最終位置ではない。
- マイク底面音孔、環状GND、分割ペースト開口を作成。音孔と反対面の部品の重なりを除去。
- 充電抵抗を6.19kΩ 1%へ変更。公称21.81mA、係数最大145と抵抗最小から23.66mA。既製パック標準22mAに近づけた。

## 現在の検査結果と発注を止める項目

ERC 0件。PCB DRCは**19件の違反、221件の未接続項目**。除外で消していない。配線は0本。

| 項目 | 検出内容 / 必要な対応 |
|---|---|
| 細ピッチパッド | BQ25101/TPS22916のパッド間隔0.17mmに対し、現在の一般クリアランス0.20mm。11件。JLC公開値は異ネットSMDパッド間0.15mmだが、0.23mm径のパッドは一般表の最小0.25mmより小さいため、対象パッケージの製造・実装受理確認が必要。単に一般ルールを緩めて合格とはしない |
| USB-C位置決め穴 | ライブラリの穴〜銅箔間0.1944mm、現ルール0.25mm。4件。部品メーカー推奨ランドと工場の穴公差を合わせて確認し、必要なら別コネクタ/ランドを選定 |
| マイク音孔 | 穴〜環状銅箔0.2125mm、現ルール0.25mm。4件。音孔径・ランド・公差をメーカー図面と工場条件で確定 |
| 未配線 | 221件。電源・デカップリング位置を先に再配置し、USB差動、SDMMC、マイク信号、電源/GNDの配線を行う |
| 実装調達 | 全品番のJLCマッチング・在庫・受理は未確認。BOMは注文用でない。水晶や受動部品の具体型番、容量のDCバイアスも未確定 |
| 筐体 | PHプラグの挿入空間、100±3mmの付属配線、NTC接触、電池膨張余裕、USB差込み、音響経路、ボタン/LED、SWD治具の接触を3Dで照合する |

20×34mmは今回の配置方式で収まった一例。より小さい試行が失敗しても、物理的な下限や最適解を意味しない。ケース壁を各1mm、組立隙間を各0.3mmと仮定すると基板だけで22.6×36.6mmの平面外形が必要になる。これは完成サイズではなく、配線・プラグ・電池・吊下げ部・ケース固定で増える可能性がある。厚さは未確定。以前の20×32×12mm外形にはこの基板は入らない。

## フットプリントの出典

- [BQ25101](https://www.ti.com/lit/ds/symlink/bq25101.pdf): YFP6、0.4mmピッチ、ボディ最大0.91×1.608mm、0.23mmランド。
- [TPS22916](https://www.ti.com/lit/ds/symlink/tps22916.pdf): YFP4、0.4mmピッチ。
- [TXS0104E](https://www.ti.com/lit/ds/symlink/txs0104e.pdf): YZT12、0.5mmピッチ。0.23mmランドはボール寸法からの暫定値で、実装設計確認が必要。
- [T5838 DS-000383 v1.2](https://d17t6iyxenbwp1.cloudfront.net/s3fs-public/2026-01/DS-000383-T5838-Datasheet-v1.2.pdf): 推奨ランドと底面図。基板上面視へ反転して配置。音孔0.6mm、ペースト開口とパッド公差は未監査。
- [SD NAND CSNP32GCR01](https://datasheet.lcsc.com/datasheet/pdf/bfa5f23b6901abecebf24c347afa6e3d.pdf?productCode=C5440134): 8×6.2mm LGA8。端子番号のない機械ランドを含む。
- [電池メーカー仕様](https://www.sengoku.co.jp/item/pdf/SPE-DTP401525%28PHR%29-3.7V-110mAh-en-2.0ver.pdf): 最大15.5×27×4.2mm、標準22mA・最大55mA充電。
- [JLCPCB公開製造条件](https://jlcpcb.com/capabilities/Capabilities): 一般条件と小径BGAランドの個別受理を区別する。

USB4105-GF-A、B3U-1000P、DMP2035U、BAT54WSは候補であり、実装品番・ピン配置・電気条件の監査は未完了。KiCad標準ライブラリを割り当てたことは部品の適合保証ではない。

## 再生成

リポジトリルートから、KiCad 10標準ライブラリを入れたmacOSで実行する。PCBの生成は配置編集を上書きするため、手動編集したら生成元への反映か別保存が必要。

```sh
python3 hardware/tools/prepare_layout.py
python3 hardware/tools/generate_schematic.py
'/Applications/KiCad/KiCad.app/Contents/Frameworks/Python.framework/Versions/3.9/bin/python3' hardware/tools/generate_board.py
python3 hardware/tools/verify_design.py /Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli
'/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli' pcb drc --format json -o /tmp/pendant-drc.json hardware/rev-a/pendant-rev-a.kicad_pcb
```

`placement-review.csv`は配置レビュー専用。Gerber、JLC用CPL、発注用BOMはまだ出力しない。
