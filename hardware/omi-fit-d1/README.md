# D1 円形基板・回路ドラフト

2026-10-24。ユーザーの再設計指示によりD0角丸案を比較原本へ戻し、**直径23mm、厚さ0.8mm、6層・両面実装**の円形基板へ全76参照を再配置した。69実装部品＋7接点群。全接続を配線したが、調達・電気設計の適合性・業者DFMが未完了で発注不可。

2026-10-25最新検査：DRC0、未接続0、ERC0、回路図等価性0。マイコンを180°回転し、デカップリング/水晶配置とR4位置を改良。MIC_ENはPB1（19番）からPB5（41番）へ変更。0.10mm線幅/間隔、0.35mmビア/0.15mm穴。USBはメーカー寸法図を確認した専用GNDランド1.12mmへ変更し、DFM受理は未確認。配線ルール変更と試行の詳細は[routing/README.md](routing/README.md)、発注条件は[発注残件](../../docs/d1-order-gates.md)を参照。以下の初期配置検証は配線前の履歴。

## 回路の変更

- MCU STM32U535CEU6、SD NAND 4GB、マイクT5838、充電/温度検知/電源分離はRev Cの構成を維持。
- J2: PHからJST SH SM02B-SRSS-TBへ。2極BAT/GND。完成短尺ハーネスと保護付き150mAh丸形パックは未調達。
- U9: TXS0104EPWR（TSSOP14）からTXS0104ERUTR（UQFN12）へ。同じ機能だがピン番号が異なるためTI SCES651K Table 5-4に従い全12ピンを再割当。旧TSSOPのNC2ピンは削除。UQFNのJLC受理・供給は未確認。
- TP1〜6: 1.5mmから1.0mmのパッドへ。測定治具の先端径と位置精度は再検証が必要。J3の標準TC2030結線・フットプリントは維持。

[回路図PDF](schematic.pdf)、`omi-fit-d1.kicad_sch`、`design.json`、`connections.csv`を追加。`bom.csv`は設計用一覧であり発注BOMではない。Rev Cは比較原本として残す。

## 配置方法と検証

USB-Cの金属/樹脂ボディは基板外へ張り出せるが、全銅箔パッドと穴は円形基板内に収める。円形にフットプリント矩形全体を押し込んでUSBを奥へ追い込む条件は解除。ケースには別途USB開口を設けた。

各フットプリントの既存courtyardを含む包絡外へ0.02mmを追加。D0で任意に追加していた0.12mmから整理したもので、銅箔/穴の設計ルールは緩和していない。マイク音孔とJ3穴の反対面領域、USB貫通部の反対面を予約した。J2は差込み/線曲げの暫定包絡を含める。

- ERC: 0。
- 回路図/PCB等価性: 0問題。
- 独立パッドネット照合、円形外形包含: 0問題。J1はボディ包絡を除外し**個々のパッド外形**で判定。
- DRC: 4件、全てUSB穴クリアランス。未接続182件、配線0。除外リストなし。**発注不可**。

これらは配置と接続定義の整合性であり、配線性、電源品質、音声性能、16h録音、実物の収容を保証しない。最新結果は `order-status.json` / `drc.json` / `erc.json`。

## 初期配置の再現（最新配線を破棄するため通常実行しない）

1. KiCad 10 pcbnewのPythonで `place.py`（未配線PCB/部品表）。
2. `parts.json` を `design.json` のpartsへ反映し、リポジトリルートで `python3 hardware/tools/generate_schematic.py omi-fit-d1`。
3. KiCad Pythonで `sync_metadata.py`（ネット名/UUID/BOM接点属性同期）。
4. `kicad-cli sch erc --format json --output erc.json omi-fit-d1.kicad_sch`。
5. `kicad-cli pcb drc --schematic-parity --format json --output drc.json omi-fit-d1.kicad_pcb`、KiCad Pythonで `verify.py`。

[TI TXS0104Eデータシート](https://www.ti.com/lit/ds/symlink/txs0104e.pdf)、[JST SH資料](https://www.jst-mfg.com/product/pdf/eng/eSH.pdf)。標準KiCadフットプリントを利用し、独自フットプリントはRev Cを参照。

[円形ケース/比較画像/STEP](../../mechanical/structure-d1/README.md)

## 業者照会用成果物

[Gerber・BOM・CPLのDFM照会ZIP](DFM-REVIEW-NOT-FOR-ORDER.zip)は製造承認済みではない。[manifest](manufacturing-review/manifest.json)に基板ハッシュと未完了条件を記録。[品番候補CSV](sourcing-candidates.csv)は69参照を照合済みだが、調達確保・代替適合性・実効容量等は別途確認する。

最新PCBを直接検査するにはKiCad CLIのDRC/ERCとverify.pyを使用。place.py/route.pyは旧試行を再現する破壊的ツールとして--discard-routingガードを追加した。export_review.pyはDRC/未接続/等価性0を必須として照会パッケージを作るが、発注可にはしない。
