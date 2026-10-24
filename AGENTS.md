# AGENTS.md — pendant-recorder

## 最新: 非丸形・既製小型電池を許可（0007）
2026-10-25。ユーザーが調達性重視で丸形制約を解除。docs/decisions/0007-off-the-shelf-battery.mdを優先。国内DTP401525(EZ3)110mAhとTinyCircuits150mAh SH完成品を比較、採用未確定。110mAhは平均5mA/容量70%仮定では15.4hで未達、16h条件を緩めない。D1.1/D2は未変更・発注不可。

## 発注準備・費用（2026-10-25追記）
docs/procurement/preorder.mdにリリース判定表、cost.md/budget.json/calculate_budget.pyに5台予算を記録。製作59,864〜131,864円、道具含む81,909〜181,909円は仮置き（USD換算160円は予算用）。正式見積り未取得、電池NRE/MOQ増分・再試作を除く。照会文の現行ビア寸法を0.35/0.15へ統一し5台/10台の内訳見積り要求を追加。メール未送信、発注不可false維持。

## D1.1 全接続配線・DFM照会準備（最新、発注不可）
2026-10-25。D23mm/0.8mmを維持し6層化。MCU180°回転、デカップリング/水晶配置、R4移動、MIC_ENをPB1/19番→PB5/41番へ変更。0.10mm線幅/間隔、0.35mmビア/0.15mm穴。ERC0/DRC0/未接続0/回路図等価性0、1202配線/ビア。GCT USB4105 B4図面を視認し、GNDランドのみ長さ1.15→1.12mmの専用PendantD1.prettyへ変更（信号パッド/穴は維持、業者DFM受理は未確認）。69実装参照すべてに品番/カタログ候補をsourcing-candidates.json/csvへ記録したが調達確保・適合性は未確定。export_review.pyでGerber/drill/BOM/CPL照会用ZIPを生成、製造リリースではない。order-status.jsonはfalse維持。place.py/route.pyは--discard-routing必須の旧破壊的ツール。試行はplacement-refinementへ保存。
D2ケースを最新配置へ再生成しUSB高さ包絡3.56mm/蓋裏逃げ、マイクPCB穴0.6mmへ訂正。完成電池の最大寸法/コネクタ/極性/充電温度、BQ25101 JEITA温度適合、実効容量/水晶/USBと電源配線品質、ケース公差/組立材/完成治具が未完了。docs/d1-electrical-review.md参照。Grepow/JLCへの照会文はdocs/sourcingに作成済み、送信許可の質問は未回答でメール未送信。発注・支払い未実施。


## D1部分配線・D2ケース（最新、発注不可）
2026-10-24。D1に4層配線試行を追加し、最小線幅/間隔0.10mmへ変更（JLC公開能力に基づくが個別受理未確認）。DRC8（USB穴間隔4・末端配線4）、未接続53、回路図等価性0、876配線/ビアオブジェクト。hardware/omi-fit-d1/order-status.jsonが正本。place.py/route.pyの再実行は配線を上書きするので注意。mechanical/structure-d2へ外径内蔵紐通し・3支持座・2点バヨネット蓋・音道のSolidCraft/STEPを追加。D25.5×14.5mmは予約寸法。完成電池・印刷公差/保持強度・接着材・ボタン延長・音道シール等は未完了。docs/d1-order-gates.mdに発注残件と電池RFQ草案（未送信）。Gerber製造リリース/発注/実機試験は未実施。

## ペンダント装着（最新追加）
首掛け装着を明示要件化。紐固定部を含めた完成寸法で比較し、上部/背面への紐通し内蔵、重心、肌当たり、衣擦れ、音道、USBと紐の干渉、取付強度を検討。docs/requirements.md末尾参照。D1のD25.5×14.5mmは装着部未設計の本体寸法。今回の要件追記ではCAD未変更。

## D1円形再設計（最新成果物）
角丸D0をユーザーが却下。hardware/omi-fit-d1にD23mm円形基板と回路ドラフト、mechanical/structure-d1にD25.5×14.5mm円形ケースのSolidCraft/STEP/比較画像を作成。全76参照維持、U9はTXS0104ERUTR（RUT12ピンへ再割当）、TP1〜6は1mm、USBボディ張出し・全パッド円内。ERC0/回路図等価性0/DRC4/未接続182/配線0で発注不可。完成電池・固定・音道・公差・実測は未完了。D0/C/B/Aは比較原本。

## D0収納検討（旧比較案）
ユーザーの「設計してシミュ見せて」に対しhardware/omi-fit-d0とmechanical/structure-d0へ配置/構造/稼働時間感度分析を追加。23×23mm角R2基板、全76参照、J2をSH横型へ。ケース25.5×25.5×14.5mmは未検証目標、Omi円柱近似より体積約21%大。DRC4・未接続182・配線0で発注不可。完成丸形パックD17×6.1mmは未調達の予約寸法。回路原本はRev Cを維持。電池持ち図は容量/電流の算術モデルでSPICE/実測ではない。

## Omiサイズ再検討（最新）
2026-10-24ユーザーが丸形150mAh第一候補・PH小型化・省電力ファームの開発方針に合意。完成パック調達と最終品番の確定、発注承認は別。
ファームの省電力化を含めOmiサイズを再検討する許可あり。docs/omi-size-feasibility.mdに電池形状・PH廃止・150mAh候補・平均5mA開発目標を記録。25〜25.5mm径/15mm厚は未成立の収納目標、150mAh完成パック調達も未確認。Rev C原本/発注不可状態は維持。16h連続録音の条件を無音省略で緩めない。

## Rev C0（最優先の現行作業）
ユーザーの再設計指示を受けhardware/rev-cを新設。無線なしSTM32U535CEU6、SPI SD、3.3V本体電源、ADC概算残量、110mAhを維持した76部品案。基板21×31mm、収納23.8×34×14mmは検討値、発注不可。現行コンセプト/合格条件はdocs/v1-scope.mdとdocs/requirements.md。発注状態はhardware/rev-c/order-status.json。旧Rev A/Bは比較原本。最新指示により比較用回路変更は許可済みだが実機/調達/収納成立は未確定。

## 最優先: 小ささ・16hへの変更（0006）
最新ユーザー指示はUSB-C充電、連続録音16時間以上、その範囲で小ささ最優先。BluetoothはNice to haveへ変更し、内蔵アンテナ/無線必須を解除。docs/decisions/0006-size-first-16h.mdを優先する。圧縮音声36h保存、鍵による暗号化、USB取出し、無はんだ組立は維持。表示器は提案のみで最小案へ追加しない。22×34×12mm/20×32×12mmは未配線の検討枠で保証寸法ではない。Rev A/Bは比較原本として保持し発注不可残件を維持。MCU/電池変更の確定は比較後に相談。

## Rev B0の実作業（2026-10-24）
回路図/PCB/接続表はhardware/rev-b/へ作成。68部品、MDBT50Q-1MV2、SPI SD、TXS0104EPWR（旧DSBGAからTSSOPへ）。22×43.5mmの配線試行で、発注可否はorder-status.jsonとdrc.jsonを優先。発注不可の残件を消さず追跡する。mechanical/structure-b0に24.8×46.5×12.8mmのSolidCraft構造案とレンダリング。ケース固定・音道・NTC・実寸収納は未完了。旧Rev Aは比較原本。

## 最優先の最新決定（0004）
ユーザーがBluetooth対応MCUへの変更を許可。nRF52840を第一候補にRev Bを新設計、現Rev Aは比較原本。アンテナ内蔵Bluetoothモジュールをv1から業者実装する（決定0005）。ソフトv1は無線停止・USB同期、ソフトv2でBluetooth同期を目指す。アンテナ省略は撤回。docs/decisions/0004-hardware-first-v1.mdを優先。同期後はPC保存・復号・完全性検証と永続化の確認が済んだ一致録音だけ自動削除する（過去の自動削除オフをこの範囲で置換）。未同期の上書き/満杯時循環削除は不可。無音区切りは保存省略と区別し、録音欠落防止を優先。表示は簡潔な状態/概算残量でよくLED5点固定は解除。ハード販売が中心、公式は最低限の音声取出しのみ。

## 最新のユーザー選好
電池持ちは24時間超を必須、保存容量は圧縮音声36時間以上を必須とする（36h電池動作の要求ではない）。この条件を満たすならBluetooth対応ハードをv1から搭載したい意向。nRF52840等を優先評価し、アンテナ/RF/更新経路を含めて設計する候補とする。現STM32は比較原本、採用変更と24h成立は未確定。docs/decisions/0003-v1-tradeoff-proposal.md末尾を優先。

## 最優先の選定相談
コアは連続録音と登録鍵を持つローカルPCへの音声取出しのみ。24hは実機の必須合格条件。Bluetoothは任意で、録音持続・薄さ・面積・調達等へ悪影響がなければ候補比較を許可する（従来の無線チップ禁止をこの条件で緩和）。採用未確定。docs/decisions/0003-v1-tradeoff-proposal.mdで計算/比較を提示し、CPU/電池の変更を確定する前にユーザーへ相談する。今回MCU/回路の変更なし。

## 製品方針・v1の定義（最新）
完成デバイス販売を主軸にし、回路・筐体・ファーム・Mac同期アプリを公開する。独自成果物はMIT、第三者ライセンスは保持。アプリ課金/API代理販売は当面範囲外、寄付は任意・未設定。v1は業者実装基板の発注→コード実装→実機試験→改版の最初のサイクルで、販売完成版ではない。完成治具と付属電池で、手はんだ・リード加工・圧着なしに組立/書込み/測定できることを発注条件とする。docs/decisions/0001-product-and-v1.md、docs/development-flow.md、docs/validation/TEMPLATE.mdを参照し、各版と結果を記録する。

## 最新追加要件: 紛失保護・初期外観設計
登録Macの秘密鍵がないと録音を復号できない保存時暗号化をv1要件に追加。公開鍵のみ本体に恒久保存、秘密鍵はMac Keychain、平文保存フォールバック禁止を第一案とする（未実装）。MSCは暗号化ファイル、復号後にWAV。docs/decisions/0002-encryption-and-industrial-design.md参照。外観後回しを撤回し、動作試作と装着用外観を初期から並行設計。v1は樹脂3Dプリント、将来金属外装を見据えて内部保持/絶縁と外装を分離検討する。

## 最新追加: OS非依存の相互運用
macOS/Windows/Linuxを対象とし、USB・暗号化形式・鍵移行・CLI契約を公開する。docs/protocol/README.md参照（Draft 0、未実装）。CLI/共通ライブラリを先行しGUIは任意。Mac Keychainに形式を依存させずOSごとの鍵保管を分離。Homebrew導入を候補にするが、公開済みパッケージではない。

## 公式v1ホストツールの最小範囲（最新）
macOS/Windows/Linuxで本体から同期し、登録鍵で復号して通常WAVをPCへ保存するところまでを必須とする。文字起こし・要約・Notion連携は必須範囲外の任意後段。syncは復号済みWAVと機械可読な保存先/結果を返す。暗号文をコピーしただけで完了としない。PCへの平文WAV保存はこの明示的な同期操作で許可、本体の平文保存禁止と自動削除禁止は維持。

## ゴール
Omi（BasedHardware/omi）のペンダントを**できるだけ真似て**、ただし BLE送信・アプリ・クラウドを外し、
「本体のmicroSDに1日録音 → 帰宅後USB-CでMacにつなぐと充電＋USBドライブ（MSC）で吸い出し → Macでローカル文字起こし（kotoba-whisper/mlx-whisper）→ 要約してNotion」にする。

## 要件（2026-10-24 Naoki確定, docs/requirements.md）
1. 有線通信のみ（BLE/Wi-Fiは一切なし）
2. USB-C 1本で充電のみ／充電＋同期（USB MSC）。接続直後は充電のみ、録音状態を維持。同期は明示操作時のみ
3. 連続24時間録音を設計目標とする。平均2.0mA以下を目指し、既製DTP401525(PHR) 110mAhを第一候補にする（docs/battery-sourcing.md）（docs/runtime-target.md）。未実測
4. できるだけコンパクト（ペンダント）。カスタム基板OK
5. 電池残量・充電・録音・同期・異常の本体インジケーター必須。暫定は残量3点＋録音1点＋状態1点。短押しで状態確認、表示操作で録音/SD所有権を変更しない

## 制約
- 完成厚さはOmi相当を上限（暫定15.0mm、突出部込み）。目標12〜13mm、未検証。旧24×38×15.2mm構造モデルは不採用。docs/density-study.md末尾参照。
- 手元での手はんだゼロを優先。USB-C・ボタン・LED・電池コネクタまで業者実装。電池は付属コネクタのまま接続。NTCも手はんだ不要な構成を検証し、省略しない。SWDはポゴ治具等。docs/jlcpcb-assembly.md参照
- 専用スマホアプリ・クラウド・サブスク依存なし。Mac同期アプリはOSSで開発し、ローカル文字起こし/要約を基本とする。Notion等の外部送信は任意・初期値オフ。
- v1は個人製作可能性と基板密度を優先。JLCPCB Standard PCBAで両面の部品実装まで依頼する方針（docs/jlcpcb-assembly.md、全品番の受理は未確認）＋自分で最終組立を設計前提にし、シンプルな3Dプリントケース。外観は初期から並行設計（決定0002が優先）
- 装着用v1はOmi相当の小ささを目指し、円形には限定しない。既製パックの調達・完成寸法を起点に密度を上げる。24×24×14mm/21×21mm基板への固定を解除。DTP401525の最大15.5×27×4.2mmを基準に20×32×12mmを攻める配置枠とするが、配線・PHコネクタを含め未検証（docs/battery-sourcing.md）。30mm角は電気検証用のみ。12gは軽量化目標、サイズ成立は未検証
- 日本語の音質（16kHzモノラル以上）
- MSC中はファームがSDに触らない（FS破壊防止）

## 決定事項
- **回路原本は hardware/rev-a/README.md / design.json / pendant-rev-a.kicad_sch**。試作MCUはSTM32U535RCT6（LQFP64）。旧CBU6（48ピン）にはSDMMC端子がない。T5838は底面音孔・1.8V専用＋TXS0104E、SD NAND 4GB（SDMMC 4bit）、BQ25101（約21.8mA、6.19kΩ）＋USB負荷分離、MAX17048、3.0V本体電源＋3.3V USB電源、保護付きLiPo 100mAh級。22mm版のMCUパッケージは未確定。Rev A1は20×34mmの未配線配置ドラフトで発注不可。hardware/rev-a/layout-review.md参照。
- 第2候補は nRF52840 カスタム基板（Omiコード流用）。実測で差が小さければ切替
- XIAO nRF52840 Sense（Omi DK2クローン）と ESP32S3（`firmware/`）は動作確認用
- 保存はFAT/exFAT上の暗号化コンテナ（Omi Consumerの生セクタ形式は使わない）。復号後はIMA-ADPCM WAV、PCM WAV切替可。暗号化方式/実装は未完了
- 時刻はUSB接続時にMacが `TIME.TXT` を書く方式

## 情報の場所
- docs/jlcpcb-assembly.md — JLCPCBで実装まで依頼する条件、公開例、未確認項目
- docs/battery-sourcing.md — 最新の既製パック優先・調達比較・寸法予算。以前の固定外形より優先
- docs/density-study.md — 最新の非円形・高密度配置方針。旧円形制約より優先
- docs/runtime-target.md — 最新の連続24時間目標。旧16時間・48時間の目標より優先
- docs/two-day-runtime.md — 旧48時間の電池・サイズ比較（履歴）
- docs/v1-build.md — 最新のv1範囲、実装難度、製作・小型化方針
- docs/omi-reference.md — Omiの全調査（部品・ファイルパス・ファーム・出典URL）
- docs/requirements.md — 確定要件と導出仕様
- hardware/rev-a/ — 最新回路ドラフト、接続表、BOM、訂正と発注前の未検証項目
- mechanical/ — SolidCraftの26×12mm寸法検討モデル（製造用ではない）
- docs/custom-pcb.md — カスタム基板の比較・電力見積り・ブロック図・段階計画（最新の推奨）
- docs/design.md — 初期設計（§10はOmi-clone比較。custom-pcb.mdが優先）
- docs/bom.md / docs/open-questions.md
- reference/omi/ — Omiの参照ファイル（MIT、改変なし、ビルド対象外）
- firmware/ — ESP32S3用スタブ、host/ — Mac側スクリプトのスタブ

## 次の作業（docs/custom-pcb.md §7）
1. ST NUCLEO（U545等）＋T5838＋SD NAND/microSDで ADF→ADPCM→SDMMC→FAT の最小ファーム
2. VBUS検知は充電のみ。同期要求時に録音停止→USB MSC、切断後`TIME.TXT`でRTC設定して同期前の録音状態へ戻す
3. PPK2で平均電流を実測（XIAO nRF52840 試作とも比較）→ MCUと電池容量を確定
4. 部品調達・小ロット実装可否、全フットプリントを確定→既製電池パックの実寸を起点に高密度配置・配線→Omi相当サイズの簡易筐体。30mm角は電気検証用のみ
5. host/ のマウント検知→コピー→文字起こしを仕上げる

## 注意
- 推定値・未確認値はそう書く。出典URLを残す
- データ（録音）を消す処理は初期値オフ（ユーザー方針：戻せない削除はしない）

## 発注準備の最新進捗
J3は標準TC2030-NL/CTX結線（1 VTref,2 SWDIO,3 NRST,4 SWCLK,5 GND,6 NC）へ更新。docs/solderless-programming.md参照。ERC0、DRC19、未接続221で発注不可。sourcing-review.jsonに品番照合を記録。音声はdocs/protocol/audio-profile.mdのIMA-ADPCM 1024byte/2041samplesを候補にし、通常sync出力は有効サンプル長に切り戻したPCM16 WAV。ホスト合成音の形式試験のみ完了。

## 保存形式・電源断の最新要件
独自音声形式/暗号化コンテナの新設禁止。docs/protocol/power-loss-recovery.md参照。短区間の標準IMA-WAVを標準age v1の独立ファイルで逐次確定する案を評価（未実装）。確定済み区間の回収、途中区間の認証失敗検出、実機ランダム電源断試験をv1に含める。10秒等の損失上限を未検証で保証しない。平文のSD一時保存と不完全録音の自動削除は禁止。
