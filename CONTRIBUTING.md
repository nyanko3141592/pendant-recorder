# Contributing

回路、基板、機構、ファーム、Macアプリ、検証結果への貢献を歓迎します。現状は未完成の試作設計です。[開発フロー](docs/development-flow.md)と[決定記録](docs/decisions/0001-product-and-v1.md)を先に確認してください。

1. 小さな変更単位でbranchを作り、変更理由・影響する要件・検証方法をPRに記載してください。
2. 推定と実測を区別し、部品型番・データシートURL・確認日・測定条件を残してください。
3. 手はんだが必要になる変更、自動的な録音削除、無断の外部送信を標準動作に追加しないでください。
4. 実録音・個人情報・APIキー・注文住所をコミットしないでください。試験は合成/公開可能な素材を使ってください。
5. 回路原本はhardware/rev-a/design.json。生成物の再生成手順と変更内容を一致させてください。未配線モデルを製造用と表示しないでください。
6. 第三者素材は出典とライセンスをTHIRD_PARTY_NOTICES.mdに記載し、元の通知を保持してください。独自の貢献は本プロジェクトのMITライセンスで提供する前提です。

回路検査: `python3 hardware/tools/verify_design.py /Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli`（KiCadが必要）。ERC合格は実機動作や製造可能性の保証ではありません。ファーム/アプリの本番ビルド手順は未整備です。
