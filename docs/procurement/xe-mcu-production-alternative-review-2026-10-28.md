# XE MCU量産代替監査 — 2026-10-28

## 結論

正本U1は `STM32U585CIU6 / C5271026`。同じ非SMPS UFQFPN48のピン配置、Cortex-M33、2MB flash/786KB RAM、USB、STのvolume production・10年longevity、JLC Economic/Standard実装対応を確認した。U585用RNG設定、OTG_FS割込み・クロック、TinyUSB DWC2を組み込んだ非flashable full-module buildとconfigured-application buildはリンク成功し、DWC2 subsetもTinyUSB 0.21.0 commit固定・全hash一致で正本へvendor化した。回路図、PCB、BOM、firmware default targetはU585へ同期しERC/DRC/parity 0。JLC公開部品ページは現時点で在庫数を表示せずExtended扱いのため、過去観測在庫37を現行在庫として使わない。実機USB/PDM/電流試験と通常在庫再確認前なので発注HOLDを維持する。

## 比較

| 候補 | 公開状態 | 判定 |
|---|---|---|
| STM32U535CEU6 / C22454224 | 旧正本。JLC観測在庫0 | U585へ置換済み。比較・rollback候補として記録のみ維持 |
| STM32U535CCU6 / C23370085 | 同系統256KB、JLC観測在庫0 | 容量上は候補だが在庫問題を解決しない |
| STM32U535CCT6 / C22471166 | LQFP48、JLC観測在庫0 | 基板再配置が必要で、在庫問題も解決しない |
| STM32U535NEY6QTR / C22456595 | WLCSP56、観測在庫73、Standard PCBA/X-ray必須 | 隠れ接合、少量在庫、全面再配線、歩留まりリスクのため継続量産案として不採用 |
| STM32U535RBT6 / C27526231 | LQFP64 10×10mm、カタログ掲載 | 現24×27mm基板とケースを大きく変え、在庫表示も確認できないため不採用 |
| STM32U073CCU6 / C22455185 | UFQFPN48、ST volume production・10年longevity、256KB flash/40KB RAM/56MHz/USB | 現U535の274KB RAM、Cortex-M33、MDF/PDM経路と互換ではない。現ファーム、PDM処理、暗号化、pinout、電流予算の全面再認定が必要なのでdrop-in代替にしない |
| STM32U585CIU6 / C5271026 | 非SMPS UFQFPN48、Cortex-M33、2MB flash/786KB RAM、JLC Economic/Standard、現行公開ページは在庫数非表示・Extended、ST volume production・10年longevity | **正本候補**。U535/U585のUFQFPN48 pinoutは一致するが、USB IP/ドライバとクロック、PDM/MDF、消費電力を実機認定するまで量産承認しない |
| STM32U585CIT6 | LQFP48 7×7mm、2MB flash/786KB RAM、ST volume production・10年longevity | リード付き長期代替として有力。ただしJLC部品番号・通常在庫を確認できず、同一中心への単純footprint交換はDRC 314、short 45、未接続27となるため全面再配置が必要。現試作へは不採用 |

## 判断理由

- 上位要件は安全性と110mAhでの16時間連続録音であり、在庫を埋めるためだけに未測定のMCUへ変更できない。
- 現ファームのlink使用量が256KB flash内でも、RAM容量、PDM取得、暗号処理、USB、pin alternate function、低消費電力動作が同じとは限らない。
- WLCSP56は小さいが、標準部品・通常工程・代替性を優先する要件に対して不利である。
- LQFP64は実装継続性では有利になり得るが、ケースとPCBの全面変更を正当化する通常在庫根拠がない。
- U585はU535よりflash/RAM余裕があり、同じ7×7 mm非SMPS UFQFPN48なので基板外形とケースを維持できる。ただしJLC公開ページの掲載・実装対応は通常在庫の保証ではなく、U575/U585系列を同一firmware familyとして維持できる設計にする必要がある。
- U585のUSBはU535と同じPA11/PA12を使えるが、現TinyUSB設定はU535 FSDEVへ固定されている。`STM32U585xx` target、OTG_FS driver、startup/linker、HAL、クロックを切り替えた実ビルドと三OS実機試験なしに採用しない。

## 再開条件

次のいずれかが成立したときだけ再選定する。

1. 全非実機回帰をU585 default targetで記録し直す。
2. 発注直前にU585がpre-orderや部品支給ではない通常在庫として5台以上利用可能であることを再確認し、5台EVTで16時間、安全、36時間、三OSを最初から通す。
3. U535が通常在庫へ戻った場合も、U535/U585のどちらを量産系列にするかを同じ試験結果で決める。

## 出典

- JLC STM32U585CIU6: https://jlcpcb.com/partdetail/STMicroelectronics-STM32U585CIU6/C5271026
- ST STM32U585CI: https://www.st.com/en/microcontrollers-microprocessors/stm32u585ci.html
- ST STM32U585 datasheet: https://www.st.com/resource/en/datasheet/stm32u585ci.pdf
- ST USB hardware comparison: https://www.st.com/resource/en/application_note/an4879-introduction-to-usb-hardware-and-pcb-guidelines-using-stm32-mcus-stmicroelectronics.pdf

注文、予約、pre-order、部品支給、業者問い合わせは行っていない。
