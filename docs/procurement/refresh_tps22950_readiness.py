#!/usr/bin/env python3
from pathlib import Path
p=Path(__file__).with_name('xe-production-readiness-2026-10-28.md');s=p.read_text()
s=s.replace('充電電圧と終端電流は安全側へ修正済みだが、外付けUSB入力リミッタは未統合である。','充電電圧と終端電流を安全側へ修正し、さらに `TPS22950CDDCR / C7587833` とR51=20kΩを前段へ統合した。保証値によるUSB総入力上限は66.06mA以下。実機の電流制限・熱遮断・復帰は未測定。')
s=s.replace('基板上70リファレンスのうち64をJLC実装部品','基板上71リファレンスのうち65をJLC実装部品')
old='0. **充電電圧・電流は修正済み、USB入力リミッタ待ち** — BQ25185をR42=130k（4.1V公称、保証上限4.1205V）、R10=30k（9–11mA、終端上限1.1mA）へ変更した。ただし130kは内部ILIM500を選ぶため、JLC在庫の `TPS2553DBVR / C55266` をILIM-IN直結の最大100mA前段として正本CADへ統合し、USBサスペンドと空電池復帰を検証するまで、充電有効化、物理EVT、CAM生成、発注を行わない。'
new='0. **充電電圧・電流・USB入力制限はCAD統合済み、実機認定待ち** — BQ25185はR42=130k（4.1V公称、保証上限4.1205V）、R10=30k（9–11mA、終端上限1.1mA）。前段の `TPS22950CDDCR / C7587833` はR51=20kΩ、ON=VINで、保証値による総入力上限は66.06mA。ERC/DRC/未接続/回路図パリティは全0だが、USBサスペンド、空電池復帰、電流制限、熱遮断を実機確認するまで充電有効化、CAM生成、発注を行わない。'
assert old in s;s=s.replace(old,new)
s=s.replace('残るhole-over-padはU1.40/PDM_DATA、U1.10/VBUS_N、U3.9/CHG_Nの3か所。','hole-over-padはU13.5/VBUS_CHARGER、U1.40/PDM_DATA、U1.10/VBUS_N、U3.9/CHG_Nの4か所。')
s=s.replace('JLC自動フローが3本のPOFV','JLC自動フローが4本のPOFV')
p.write_text(s)
