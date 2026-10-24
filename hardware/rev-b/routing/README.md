# 配線試行記録

Freerouting 2.5.0のJAR版をローカル実行。入力DSNは途中配線を含む再試行用。trial.sesをKiCadへ戻したあと、GNDポア・ビアを追加し、USBの不要な片側接続ビアとRF禁止領域内の候補ビアを削除した。最終原本は親ディレクトリのKiCad PCB。

ルータ出力だけでは18接続が未完了。KiCadでポア充填と接続補正後、最終的に2未接続が残る。短絡するBAT追加配線案は不採用・最終原本に含めていない。電源IC周辺の再配置が必要。

stitch-candidates.jsonは候補の履歴であり、全てを残した指示書ではない。原本の実装済みビアを優先。最終DRC/発注状態は ../drc.json と ../order-status.json。

ネイティブCLI 2.5.0はシリアライズ例外で使用できず、JAR版で続行。2.1.0の比較試行は採用しなかった。ツール本体は配布物に含めない。[Freerouting](https://github.com/freerouting/freerouting)はGPL-3.0、使用したCAD出力をツール本体の再配布として扱わない。
