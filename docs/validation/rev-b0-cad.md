# Rev B0 CAD検証 — 2026-10-24

> **履歴資料・発注禁止。** Rev B0は現行XE候補ではない。このページの回路、ケース、BOM、寸法、残件を現行製造入力へ使用しない。現行判定は [`../prototype-v1-order-decision.json`](../prototype-v1-order-decision.json)。

結果: **発注不可**。今回の成果はアンテナ内蔵nRF52840回路、配線試行、樹脂ケース構造案。

- 68部品、219接続論理端子、37 NC、46ネット。KiCad書出しネットリストとdesign.json一致。ERC違反0。
- 実PCBの262物理パッドのネット名をdesign.jsonと照合、一致。952配線セグメント、163ビア。接続先の一致と全結線は別の検査。
- 最終DRC 4: USB-CフットプリントのNPTH近傍0.1944mmに対し制約0.20mm。除外なし。
- 未接続2: 充電ICのBAT端子とGNDポアの接続。無理な追加配線で発生した短絡案は撤回。
- JLC掲載確認: U9 TXS0104EPWR C44955、U11 CSNP32GCR01-BOW C5440134。モジュール/マイクを含む全BOMの実装受理・確保は未完了。
- SolidCraftで24.8×46.5×12.8mmのケースと内部部品を作成。空洞/USB開口/蓋/表示窓を含む。固定機構・音道・NTC・実配線収納は未完了。
- 電流、録音、暗号化、USB/BLE、電源断、印刷/組立の実機試験は行っていない。

[回路・残件](../../hardware/rev-b/README.md)、[機構・画像](../../mechanical/structure-b0/README.md)、[機械可読判定](../../hardware/rev-b/order-status.json)。発注用Gerber/CPL ZIPは発行しない。
