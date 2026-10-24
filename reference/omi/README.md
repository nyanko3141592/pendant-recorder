# Omi 参照ファイル（複製）
出典: https://github.com/BasedHardware/omi commit c10d3ca6efc8f9311b62f05da31e7eb03bd9184a
ライセンス: MIT（LICENSE-omi-root.txt, hardware-consumer/LICENSE）。t5838_aad.c は Irnas/Brilliant Labs 由来と記載あり。
改変していない参照用コピー。ビルド対象ではない。全体が必要なら:
  git clone --filter=blob:none https://github.com/BasedHardware/omi.git
（STEP/Gerber等の大きなファイルは複製していない。docs/omi-reference.md のパス参照）

- hardware-consumer/: README, BOM CSV, メイン基板・充電台の回路図PDF
- omi-dk2-schematics.pdf: DevKit2 回路図
- firmware/boards/: nRF5340 自作ボード dts / pinctrl
- firmware/omi/: Consumer の config.h, omi.conf, mic.c, t5838_aad.[ch], sd_card.c, battery.c
- firmware/devkit/: DK1/DK2 overlay, DK2 conf, sdcard.c, mic.c, usb.c
