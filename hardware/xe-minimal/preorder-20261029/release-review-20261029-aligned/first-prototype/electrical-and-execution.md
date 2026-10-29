# 電気判断と実行条件

## 設計レビューの結論

基板b3cdfc…を初号試作用に維持する。4層/145本通常through via、DRC・ERC・未接続・parityの既存ゼロ結果を同一hashで照合する。C30の値50pF/50V/C0Gは変えず、BOMだけを同定格・同パッケージ品へ変更した。

電池内蔵保護を維持し、BQ25185の4.1V設定（既存上限計算4.1205V）、9–11mA充電設計、U13 USB電流制限、U14過電圧切離し、外部U12温度windowとQ4/MCU許可を維持。U12は冷側BAT_TS>reference、熱側BAT_TS<referenceでopen-drainが許可を落とす接続。NTC open/shortとも充電抑止方向。reset時は充電許可を出さない。部品/回路の理想論理確認と実際の熱応答・故障時波形を混同しない。

温度windowの7.5k/20kΩは抵抗値の境界であり、NTCのB定数や熱結合なしに温度保証へ変換しない。初期評価は電池シミュレータ・NTC抵抗代替から開始し、実セルは極性/絶縁/充電停止を確認した後に接続する。初回通電前に現物を検査することは、基板を作る前に実測ログを要求することとは違う。

主電源銅箔の既存見積りは100mA時VBUS_CHARGER約23mV/BAT約17mV（20℃公称Cu）。抵抗性の大きな不成立はここには見られないが、IC内部/connector/return/起動突入は含まない。C13/C14/C15/C31/C32/C33のDC bias実効容量、U11起動ピーク、低電池時のLDO dropoutは通電試験で確認する。40mAは保存起動ピークの上限ではない。電池側110mA上限を維持する。

USBはFull Speed12Mbps。現DP19.606mm/DM20.558mm、via各2本、差0.952mm。伝搬速度を150mm/nsと仮置きすると片道約0.137ns、skew約0.0064ns。これは短い経路でFSの初号試作を行う判断材料であり、90Ω保証でも反射解析でもない。同層銅の非対称、分岐・via・referenceの局所細首は残る。初号試作は現配線を採用し、波形/列挙/複数ケーブル/3OS転送を試す。全field solverやHS規格の工程認定を前提に設計を停止しない。USB90Ωの量産適合を宣言しない。

一般4層製造の公開仕様は0.15mm through drillを許容し加算料金がある。0.2mmを掲げるimpedance-serviceの適用問題を避け、初号試作は**制御インピーダンス認定を付けない一般4層**を採用。層構成は既存JLC04081H-3313を設計基準とし、注文画面で実製造stackup/厚さ/小径孔を照合する。変更があればUSB・機構へ影響するのでそのまま発注しない。

実装方向は68点のterminal mapを正とする。CPL角度だけでテープ方向を認定しない。U1/U2/J2/U12の既存pin-mapと、全端子座標を同梱。注文時のplacement previewでは特にU1 pin1、U3/U11/U13/U14、Q3/Q4、LED極性、J1/J2の表裏をtop-view座標で照合する。逆実装を買い手に直させない。

## 発注を実行できる時に行うこと（今回は禁止）

1. sourcing-bom.csvの正確な型番でJLC部品在庫と必要ロス数量を再確認。U1/U12/J1は通常Pre-orderで必要量を入庫させる。未入庫のまま基板を先行させない。C30はC501830。
2. 一般4層0.8mm、両面Standard PCBA、小径through孔、分割済み出荷を指定。BOM/CPLと全端子座標でplacement previewを承認する。現段階で承認済みとはしない。
3. 通常Standard PCBAのFunction test/programmingサービスを使用する。公開仕様は実装後書込み、HEX/BINと端子定義の提出、最初の1台の動画確認を想定する。**サービスの存在は、1GB媒体のformat/identity/readbackまで受け入れられた証拠ではない。** 買い手書込みを避けるため、この処理を含めて通常注文工程で受理されることが条件。問い合わせや送信は今回行わない。

## 初回通電・書込み前の具体的手順

1. J2は空、J1へ電流制限付き5V。J3 pin1はVTREFであって給電端子にしない。無通電短絡/ピン極性/向き、reset中charge request LOWを確認してから立ち上げる。過電圧・短絡試験は実セルを外す。
2. 正式に使用権のあるUSB VID/PIDと証拠を設定する。fixtureの仮IDを製品へ流用しない。USB IDが未定のため現在flashable imageはない。
3. 電池シミュレータでADC/停止/復旧を確認し、固定電池を安全に試験してloaded cutoffとADC誤差余裕を決める。初期実験用の設定と購入者用の設定を混同しない。既存config生成ツールが要求する証拠を満たし、factory-programming/evt-programming-manifest.template.jsonへ値/hashを記入する。実測待ちはこの通電段階の残件であってCAD作業停止条件ではない。
4. リポジトリの `firmware/stm32/app/build_configured.sh PUBLIC_CONFIG_DIRECTORY NEW_OUTPUT_DIRECTORY` で現sourceからbuild。出力のUNQUALIFIEDラベルを検証なしに外さない。J3の既存端子定義に従い、全領域readbackとoption bytes/BORを照合する。
5. 媒体のCSDから実addressable sector数を得る。`python3 host/create_factory_storage_image.py NEW_IMAGE --sectors ACTUAL_COUNT` で新規空FAT32を作る。`python3 host/verify_factory_storage.py READBACK_IMAGE` で書込み後の実読戻しを検査する。合成1882812sectorを実媒体値として固定しない。製品identityを設定し、受信者の秘密鍵は工場へ渡さない。公開鍵の初回登録は既存write-once HIDフロー。
6. まずUnit1で充電抑止、NTC open/short、rail安定、保存、USBを確認してからUnit2–5へ展開。全台のUID・image hash・format/readback・安全試験結果を結ぶ。実セルの充電許可は実温度で安全範囲と停止を確認後。

## 試作後の評価

初回の主目的は25℃で16h無中断録音、復号後の欠落ゼロ、使用感。4.4mAは診断用の目標値とし、16h達成の独立要件と混同しない。容量と電流の両方を測り、追加で10/35℃・個体差を確認する。30h保存は3session、TMP/電源断復旧/満杯、3OS USB取込み、充電専用ケーブルを試す。

実電池を入れる前にダミーで組立/接着/1m落下、紐穴/USB挿抜を試す。NTC/温度/充電/pack損傷なしを確認した個体で装着評価へ進む。旧ASSEMBLY-AND-EVT.txtの詳細試験は参考として保持し、全量産耐久試験を初号基板発注前の条件にしない。

公開根拠（2026-10-29確認）：
- https://jlcpcb.com/help/article/pcb-assembly-price
- https://jlcpcb.com/help/article/what-is-jlcpcb-parts-pre-order-service
- https://jlcpcb.com/help/article/pcba-programming-service
- 電気・USB数値の原証拠は ../evidence/ 内のcurrent-usb-*、charger-trace-resistance、temperature-window-pin-polarity-reviewを参照。
