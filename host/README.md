# 現行の暗号化録音取り込み（開発中）

`import_recordings.py` は標準age暗号文を認証・復号し、16kHz mono PCM WAVを保存します。age/ffmpegと登録済み秘密鍵が必要です。保存先は平文音声を含みます。

```sh
python3 host/import_recordings.py --discover --watch --destination "$HOME/Recordings" --identity /path/to/identity.txt
```

接続済みボリュームのルートに次の `PENDANT.JSON` があるものだけを検出します。ドライブ名は任意。macOSは `/Volumes`、Linuxは `/proc/self/mountinfo`、Windowsはドライブ一覧を列挙します。OSによるマウントは別途必要です。

```json
{"product":"pendant-recorder","schema_version":2,"hardware_revision":"XE-PROTOTYPE-V1-27P5-PACK-NTC-CASE-V5-1GB-OVP-LATCH","firmware_version":"XE-EVT1-UNQUALIFIED","source_revision":"0123456789abcdef0123456789abcdef01234567","audio_profile":"ima16k-mono-1024-age-v1"}
```

識別ファイルは4096byte以下の通常ファイル限定で、認証には使いません。現行の基板・ケース版、ファーム版、ソースrevision、音声形式が揃わないもの、未知版・不正形式・symlinkは除外します。例の版名とrevisionは説明用であり、量産時は承認済みrelease名とcleanなGit commitを設定します。明示指定は `--discover` の代わりに `--volume /path/to/device`。`--watch` は3秒ごとに再検出し、複数台も順次処理します。既取得データはハッシュ検証で重複を防ぎ、元録音は既定で残します。削除は `--cleanup-verified` の明示指定時のみで、Windowsでは未対応です。macOSの自動起動設定は生成できます（後述）。実際の常駐登録と安全な取り外しは未実施です。 二重起動は保存先ごとのOSファイルロックで防ぎます。強制終了時はOSがロックを解放するため再起動できます。`.import-lock-v2` ファイルは残っていて正常なので削除しないでください。旧版の `.import-lock` フォルダがある場合は併用を拒否します。旧プロセスが終了済みであることを確認してから整理します。macOSで別プロセスの排他・強制終了後の再取得を検証済み。Windowsのロック分岐は実機未検証です。

ファームウェアのUSB引渡し処理は、この識別ファイルの書込み成功を必須にしました。C側が出力した内容をホスト側が認識する試験は合格しています。ただし実ファイルシステムへの書込みcallback、実機USB MSC連携、Windows/Linux実機試験は未完です。ホストの識別負例試験とage→PCM/再実行/誤鍵/破損/明示削除試験をmacOSで実施。

## 購入者の鍵と販売側の書込み

量産候補では購入者がPC上でage秘密鍵を作り、初回USB接続時に本体ボタンを2秒以上連続して押している間だけ、公開鍵 `recipient.txt` をHID経由でwrite-once登録します。秘密鍵 `identity.txt` は購入者のPCと安全なバックアップに保持します。工場は購入者鍵を含まない共通ファームを書き込みます。購入者にビルド・デバッガ書込み・コネクター加工を求めません。`provision_recipient_hid.py` は秘密鍵を読み込まず、正式VID/PIDと実機3 OS検証完了まではリリース用として扱いません。

録音MSCはread-onlyです。`--cleanup-verified` はPCからファイルをunlinkせず、全対象のコピー・復号・PCM検査・永続化が成功した後だけHIDへID範囲を予約します。削除予約には、本体ボタンを2秒以上押し続けた状態でコマンドを送る物理確認が必要です。確認不足なら元録音を残したまま失敗するため、ボタンを押し続けて再実行します。一度受理するとボタンを離すまで再承認しません。本体は安全な取り外しまたはUSB切断後にストレージ所有権を取り戻し、確定済み `.AGE` だけを削除します。`.TMP` と対象外名は削除しません。実機3 OSでの取外し・削除完了、2秒判定とボタン摩耗は未検証です。

POSIX向けの準備手順は [RECIPIENT_SETUP.txt](RECIPIENT_SETUP.txt) を参照してください。Windowsの鍵生成は、現在のユーザーSIDだけを許可した継承可能なDACLを新規フォルダー作成時に設定し、照合してから鍵を生成する実装を追加しました。共有パス・reparse pointを含む親・ACL非対応ボリュームは拒否します。Windows実機でのACL継承・別ユーザーアクセス拒否・暗号化復号は未検証です。現時点で3 OSすべての購入者向けセットアップが完成したとは扱いません。生成される `firmware-recipient.h` は開発者用で、購入者の組立手順には含めません。

`sync_and_transcribe.py` は以前の平文録音向け試作です。現行の暗号化録音には `import_recordings.py` を使います。文字起こし・要約・外部サービス連携は必須機能に含めません。

## macOSログイン時の監視起動（設定生成まで実装）

実機に対応するage秘密鍵と、永続的な場所にあるage/ffmpegを用意してから生成します。鍵ファイルは所有者のみ読み書きできる権限（600）が必要です。このコマンドは鍵内容を読み出さず、既存設定を上書きせず、常駐登録もしません。

```sh
python3 host/prepare_macos_autostart.py \
  --identity /absolute/path/identity.txt \
  --destination "$HOME/Recordings" \
  --age /absolute/path/age --ffmpeg /absolute/path/ffmpeg \
  --output /absolute/path/local.pendant-recorder.import.plist
```

生成したplistのProgramArgumentsを確認後、`~/Library/LaunchAgents/local.pendant-recorder.import.plist`へ配置し、`launchctl bootstrap gui/$(id -u) "$HOME/Library/LaunchAgents/local.pendant-recorder.import.plist"`で登録します。停止・登録解除は`launchctl bootout gui/$(id -u)/local.pendant-recorder.import`、状態確認は`launchctl print gui/$(id -u)/local.pendant-recorder.import`。ログイン中だけ動作し、終了時は30秒以上の起動間隔で再試行します。Python・ソース・依存コマンドの場所を移した場合は設定を再生成してください。

設定構文と空白を含むパスは検証済みですが、実機録音を使った自動起動・取り込みは未検証です。通常のCLIで鍵と復号を確認してから登録してください。自動削除は設定に含めません。大量の重複ログが増え続けないよう常駐用ログファイルは指定していません。障害診断時は常駐を停止してCLIを前面で実行します。

接続監視中のマウント一覧取得失敗・ディレクトリ走査中のI/O例外は、それぞれ `discovery_failed` / `scan_failed` として報告し、次の周期で再試行します。単発実行では失敗終了します。例外注入で次周期の取り込み復帰を検証済みですが、物理USB抜去・再接続試験は未実施です。

## 工場向け公開設定の生成（開発中）

`prepare_factory_config.py` は共通ファーム用の明示したUSB VID/PID・低電圧停止値・ファーム版・ソースrevisionから `device-config.h` と設定台帳を生成します。旧来の購入者別公開recipient埋込みも開発互換として残しますが、量産候補はrecipientを含まない共通ファームです。秘密鍵の入力・生成・転送や、実機への書込みは行いません。危険な版文字列、チェックサム不正、既存出力先、試験用識別子0x1234/0x5678を拒否します。USB識別子の使用権や停止電圧の適合性をこのツールが保証するものではありません。

`firmware/stm32/app/build_configured.sh PUBLIC_CONFIG_DIRECTORY NEW_OUTPUT_DIRECTORY` で公開設定を用いたアプリケーションをビルドできます。通常のlinkcheckは試験用識別子を使い、設定済みアプリケーションではその定義を外します。出力は実機未検証の `application-UNQUALIFIED.bin` で、出荷承認を意味しません。正式USB識別子の割当確認、停止電圧の検証、書込み・読戻し、購入者の鍵での試験録音復号は未完です。ユーザーへのファーム書込み作業は要求しない方針を維持します。

## 工場での読戻し照合（ツールのみ実装）

書込み担当者は、採用イメージのロード先頭アドレスからBINと同じバイト数を実機から読み戻し、別ファイルに保存します。`python3 host/verify_flash_readback.py --build-directory /path/to/build --readback /path/to/readback.bin` で、build-manifestのハッシュとBIN、読戻しファイルの完全一致を確認します。短い読戻し・余分な末尾・内容相違・生成後に変更されたBINは拒否します。

一致はバイト照合だけを意味します。機器の個体識別、読戻し元アドレス、オプションバイト、起動、録音、購入者の鍵での復号を別途確認する必要があります。元BINをコピーしたファイルでも一致するため、この出力だけを実機書込みの証拠にしません。現在は合成ファイルの正例・破損・切詰め・追記・BIN変更を試験済みで、実機読戻しは未実施です。
