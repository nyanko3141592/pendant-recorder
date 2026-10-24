# v1録音圧縮プロファイル（候補・MCU未実装）

本体の標準候補は16kHz/monoのIMA-ADPCM、比較・音質検証用はPCM16。音声を圧縮してから認証付き暗号化する。暗号文を圧縮して容量を減らそうとしない。無音保存省略はv1の24時間達成条件に使わない。

| 方式 | 24時間の音声データ概算 | v1判断 |
|---|---:|---|
| PCM16 mono 16kHz | 2.7648GB | 基準音質・不具合切分け用 |
| IMA-ADPCM / 1024-byte block | 0.693572GB | 標準候補。実装負荷を抑えて保存量を約1/4にする |
| Opus / 仮24kbps | 0.2592GB＋コンテナ等 | 将来比較。MCUのエンコード電流/RAM/Flash/音質の実測なしに採用しない |
| FLAC等の可逆圧縮 | 音声に依存 | 容量を固定できずv1の電池・容量根拠には使わない |

GBは10進。各値にファイル管理、暗号化、最終ブロックのパディング等が加わる。IMAの理論64kbpsだけの計算より、ブロックヘッダー分を含めて約64.220kbpsになる。

IMA-WAV候補: format tag 0x0011、16,000Hz、1ch、4bit code、blockAlign=1024、samplesPerBlock=2041。1ブロック約127.56ms。SD書込みは複数ブロックをバッファしてまとめるが、実電流と電源断時損失を測定してバッファ量を決める。

標準CLIの最終出力は **16bit PCM WAV** とする。登録鍵で認証/復号したADPCMをデコードし、ユーザーは圧縮方式を知らずに音声を利用できる。したがって本体/USB上は約0.694GB/日でもPC上のPCMは約2.765GB/日必要。将来の圧縮WAV出力は任意オプションにし、無断上書きしない。

有効サンプル数を暗号化・認証されたメタデータに保持する。今回のFFmpeg試験では10秒=160000サンプルが完全ブロックへ丸められ、デコード後161239サンプルとなった。CLIは元の有効長へ切り戻す。最終ブロックの余白を録音時間として足さない。未完了ファイルは回復可能な完全ブロックと未確定の末尾を区別する。

暗号化付加分の例: 4096byte毎に17byteのsecretstream認証情報＋4byteフレーミングなら約0.513%。24時間では約3.56MB増となる例。鍵包装/ヘッダー/終端等は別。方式未確定なので正式な容量保証ではない。

## 実行した試験

`python3 tools/check_audio_profile.py --report docs/validation/audio-profile-host.json`

合成した440/880Hz音と無音の10秒をFFmpegでIMA-WAVへ圧縮し、形式・ブロック境界・復号後PCMの音声仕様と長さを確認。結果は[機械可読レポート](../validation/audio-profile-host.json)。これはMacホストでのフォーマット試験のみで、MCU実装・認証暗号・日本語認識精度・電流・他OSの実行は未検証。

参照: [FFmpeg ADPCM実装](https://github.com/FFmpeg/FFmpeg/blob/master/libavcodec/adpcmenc.c)、[libsodium secretstream](https://libsodium.gitbook.io/doc/secret-key_cryptography/secretstream)。将来のコーデック識別子・ヘッダーは相互運用仕様を固定してから採番する。
