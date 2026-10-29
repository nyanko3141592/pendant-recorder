# XE JLC標準書込み工程の準備状態

状態: **標準サービス候補、製品バイナリ未生成、対応審査・実機確認前**。注文、アップロード、業者連絡は行っていない。

JLCPCBの公開Programming ServiceはStandard PCBAのAdvanced Optionsから選択でき、実装後のIC書込みに対応する。公開条件として、対象MPN、基板上の書込みinterface定義、基板画像、HEXまたはBIN、書込み手順を提出し、JLC側の対応可否審査と初号機確認を受ける必要がある。これは購入者の手書込みをなくせる標準注文オプションだが、公開情報だけではSTM32U585CIU6と本基板の受理を保証できない。

## 単一候補の書込み方式

- MCU: `STM32U585CIU6 / C5271026`
- 注文区分: Standard PCBA
- 書込み時期: PCBA実装後
- interface: J3の5-pad SWD。部品実装は不要
- pin順: 1=VTref 3.3V sense、2=SWDIO、3=NRST、4=SWCLK、5=GND
- 書込み電源: 最初はJ3 VTrefをsenseとして使い、基板は電流制限した正規3.3V railから給電する。J3 pin 1からの逆給電は禁止
- 書込み対象: 全個体共通のflashableな製品用HEXまたはBIN一つ。購入者鍵、テスト鍵、仮VID/PID、未認定cutoffを含むfixture buildは禁止
- option bytes: BOR level 4を設定し、書込み後にreadback
- 検証: flash verify、option-byte readback、`PENDANT.JSON` のhardware/firmware/source revision、MCU UID、USB列挙、充電既定無効、storage rail OFFを記録

J3の幾何とpinoutは `hardware/xe-minimal/factory-programming/check_j3_swd_interface.py` で正本PCBから検査する。提出用の上面図候補は `hardware/xe-minimal/factory-programming/j3-swd-interface.svg`。実基板写真ではないため、初回PCBA写真が得られた後に置換する。

## 製品バイナリ生成前の必須入力

独立して閉じる必要がある根本ブロッカーは次の3件だけである。

1. 販売に使用できる正式USB VID/PIDと割当証跡。現在の合成テスト値は製品へ使用しない。
2. 5個のDTP401525-XE実測から合格したbattery cutoff。温度、録音、storage条件も同じEVT版へ固定する。
3. Standard PCBA Programming optionがJ3 SWD、BOR4 readback、UID/基板serial記録を受理した証跡。個別部品支給や購入者書込みへfallbackしない。

初回USB HID登録、write-once公開鍵保存、購入者秘密鍵を製造物へ含めない処理は実装・非実機回帰済みであり、別の設計入力ではない。上記1と2が揃えば、`build_evt_image.py`がcleanな同一hardware/firmware/source revisionからBIN、ELF、MAPと各SHA-256を生成する。したがってこれら4成果物を独立した未決課題として数えない。`UNCOMMITTED`、`UNQUALIFIED`、fixture版は引き続き製品書込みデータとして拒否する。

## 現時点の判定

- 基板interface: CAD上確認済み、物理pogo接触未確認
- 工場用手順: 定義済み
- 製品用バイナリ: **未生成**
- 正式VID/PID: **未取得**
- 根本ブロッカー: **3件**（正式USB ID、5電池cutoff実測、JLC工程受理）
- 初回recipient登録: **共通ファーム、HID、write-once flash、CLIは実装済み。実機3 OSと書込み中電源断は未確認**
- JLC対応審査: **未実施**
- 購入者書込み不要: **未確認**

購入者ごとの公開鍵をコンパイルした個別バイナリ方式は量産候補から外した。上記と決定0013の初回登録実装が閉じるまでは、空のMCUまたは固定購入者鍵を搭載したPCBAを完成品扱いしない。

公開根拠:

- https://jlcpcb.com/help/article/pcba-programming-service
- https://jlcpcb.com/capabilities/pcb-assembly-capabilities

