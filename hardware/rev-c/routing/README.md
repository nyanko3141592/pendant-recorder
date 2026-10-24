# Rev C配線試行（未完了）

Freerouting 2.5.0 JAR、ローカル実行、KiCadへSESを戻してDRC実施。初回8 passで81未接続というルータ報告。KiCadで内層/表裏GNDポア、保守的なGNDビアを追加し、規定未満の配線幅を0.10mmへ修正した。DRCで報告された孤立ビア/行き止まり配線のみを順に除去した。最終集計は親ディレクトリのdrc.json/order-status.jsonが原本。

refined.sesは2回目の比較試行でルータ自身が8違反を報告したため原本へ採用していない。入力DSNは初回配線後の再試行入力であり、最終PCBと同一でない。trial.sesは初回結果。原本は ../pendant-rev-c.kicad_pcb。

基板端子密度が高く、自動配置/自動配線だけでは完結していない。電源部・デカップリング・USB差動対と帰路の手動再配置/配線が必要。ファイルが存在することを発注可能性の証明にしない。

ツールは https://github.com/freerouting/freerouting （GPL-3.0）。ツール本体はこのリポジトリへ再配布しない。
