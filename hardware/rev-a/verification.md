# 検査記録 — 2026-10-24

- KiCad 10.0.7で読込、SVG描画、XMLネットリスト出力成功。
- ERC: **エラー0、警告0**。除外ルールなし。GND/VDDA/VBUS/SYSに電源供給宣言を置いた（受動部品経由または外部供給）。これは電圧/電流を検証するものではない。
- 出力ネットリストをdesign.jsonと照合: **92実部品、283接続端子、25 NC端子、60ネットが一致**。4個のPWR_FLAGは実部品/BOMから除外。
- STのパッケージ別端子データで48ピン品にSDMMCがないことと64ピンの各信号を確認。抽出表と出典/ハッシュはpackage-pin-audit.json。
- SolidCraft 0.21.0でモデル再生成、保存、STEP出力、画像描画成功。4ボディ、外接寸法26×26×12mm。USB開口でシェルの体積が減ることも確認。
- 画像で回路のページ内収まりと筐体のUSB開口を確認。

再検査:

```sh
python3 hardware/tools/generate_schematic.py
python3 hardware/tools/verify_design.py /Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli
```

未実施: PCB/DRC、SPICE、回路実機試験、USB適合試験、電池充電温度試験、16時間測定、音響測定、筐体の固定/公差/全実部品の干渉確認。ERC合格を製造承認と扱わない。

インジケーター追加後に再検査: PA4〜PA7の4端子をNCからLED出力へ変更し、LED4個と抵抗4個を追加。上記件数とERC結果は追加後のもの。点灯パターン、SOC閾値、視認性、消費電流はファーム/実機未検証。
