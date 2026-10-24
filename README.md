# pendant-recorder

**小さく身につけて録音し、USBで自分のPCへ音声を取り出すOSS録音機。**

V1はUSB-C充電、充電なし連続16時間以上の録音、36時間以上の圧縮音声保存、登録鍵によるローカル復号・WAV取出しに集中します。無線と画面を外した円形D1を設計中（Rev Cから派生）。文字起こし・要約・クラウド・課金はV1必須外です。

**まだ発注不可・実機未検証です。** 回路図、実フットプリント配置、配線試行、ケース収納案までの設計成果物であり、16時間動作や無加工組立を達成した製品ではありません。

- [D2：紐通し・蓋固定・音道を追加したケース](mechanical/structure-d2/README.md) — 強度/公差未検証
- [最新D1：直径25.5mmの円形ケース・円形基板・比較モデル](mechanical/structure-d1/README.md) / [D1回路図](hardware/omi-fit-d1/schematic.pdf) — 部分配線・発注不可
- [V1の範囲・合格条件](docs/v1-scope.md) / [現行要件](docs/requirements.md)
- [Rev C回路・PCB・BOM](hardware/rev-c/README.md) / [回路図PDF](hardware/rev-c/pendant-rev-c.pdf)
- [現行D1の発注可否](hardware/omi-fit-d1/order-status.json) / [発注までの残件・電池確認仕様](docs/d1-order-gates.md)
- [旧Rev B・Rev C・Omi・500円玉のサイズ比較](mechanical/size-comparison-c0/top.png)
- [ケース内部の分解表示](mechanical/structure-c0/exploded.png)

Rev Cの収納案は23.8×34×14mm。旧Rev Bの24.8×46.5×12.8mmより長さ12.5mm減、厚さ1.2mm増。配線・実際の電池線材・ケース固定・音道・公差の成立確認は未完了です。Rev A/Bは比較原本として保持します。

USB-C接続直後は充電のみで録音状態を維持。明示同期時だけ録音を止め、macOS/Windows/Linuxへ暗号化音声をコピー・復号し、通常WAVとして保存します。検証・永続化済みの一致録音だけ本体から削除する仕様です。ファームと本番CLIは未実装。

JLC等へ基板製造と両面部品実装を依頼し、完成電池・治具で手はんだなしに組み立てることを発注条件にします。実装受理・治具・付属電池収納の確認はこれからです。

## 構成
- `docs/design.md` 設計書（構成、ボード比較、電力の見積もり、音声フォーマット、時刻、USB、省電力、ケース）
- `docs/bom.md` 部品表（価格は概算・要確認）
- `docs/open-questions.md` 未決事項
- `docs/omi-reference.md` Omiのハード／ファーム調査（出典つき）
- `reference/omi/` Omiの参照ファイル（MIT）
- `AGENTS.md` Cursorエージェント向けの要約
- `firmware/` PlatformIO の骨組み（XIAO ESP32S3 Sense 向け、スタブ）
- `host/` Mac側スクリプトのスタブ（マウント検出、コピー、ローカル文字起こし）

- 電池残量・充電・録音・同期・異常を本体で確認できるインジケーターは必須。回路追加済み、表示ファームと筐体への反映は未実装。

## 状態
設計のたたき台です。数値のうち「推定」「要検証」と書いたものは、まだ実測していません。

## 製品方針とv1

販売の軸は組立・動作確認済みデバイス。ソースを公開し、自分で作る人も完成品を購入する人も使える形にします。アプリ課金/API代理販売は当面行わず、寄付は任意の将来項目です。

**v1は「業者実装済み基板を発注 → ファーム実装 → はんだなしで組立・実機検証 → 改版」の最初のサイクルです。販売完成版ではありません。** 現在は未配線で発注不可。必要品を買って電池を挿し、完成治具で書込み・検査できる状態を目指します。

- [製品方針の決定記録](docs/decisions/0001-product-and-v1.md)
- [発注・実装・試験・販売候補までの開発フロー](docs/development-flow.md)
- [検証記録テンプレート](docs/validation/TEMPLATE.md)
- [貢献手順](CONTRIBUTING.md) / [MITライセンス](LICENSE) / [第三者通知](THIRD_PARTY_NOTICES.md)

ローカル処理は外部への送信を減らすための方針であり、機密保護の保証ではありません。録音の暗号化・紛失時保護は未実装です。機密録音を公開リポジトリやissueへ投稿しないでください。
