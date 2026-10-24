# SolidCraftによる寸法検討

SolidCraft公式 v0.21.0 を `/Applications/SolidCraft.app` に導入。CLIは `~/.local/bin/solidcraft-cli`。ダウンロードは https://github.com/tangency-labs/solidcraft/releases/tag/v0.21.0 。APIのSHA-256とローカルファイルが一致した。

- macOS DMG: `f6d0b02e3142e4a966114467c89824a1a42e7042bf92a0f3d1299634244cf68c`
- CLI ZIP: `b86e19b128c0dcffd5e4365beaf991f98d1a176ed1734a3ae5fabba7e750c6ea`

`pendant-fit-study.solidcraft` は編集可能な4ボディのモデル、STEPは交換用、`fit-study.json`は再生成用の履歴。26mm径、12mm厚、1.2mm壁、22×0.8mm基板ダミー、16×4.5mm電池ダミーを配置。USB開口は仮寸法。Omiの円形外形と電池を基板裏に置く構成を参考にしている。

**製造用筐体ではない。** 電池型番と22mm基板は未確定で、Rev AのLQFP64試作は30mm角が前提。このモデルは小型化版の寸法予算だけを示す。マイク底面音孔/シール、ボタン、LED、吊り下げ、蓋の固定、公差、電池膨張余裕、USB実部品との干渉はまだ設計していない。基板配置後にOmiのSTEPも照合して仕上げる。

```sh
solidcraft-cli run mechanical/fit-study.json --save mechanical/pendant-fit-study.solidcraft --out mechanical/pendant-fit-study.step
```
