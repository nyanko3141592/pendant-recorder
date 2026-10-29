# ネックレスコードの絡まり・絞扼リスク

状態: **量産リリース条件未完了。成人が管理下で使う試作に限定し、子供向け・乳幼児周辺・睡眠中・機械作業中の使用を認めない。**

ケースの紐受けを強くする試験と、首へ過大荷重が掛かる前にコードを安全離脱させる設計は別問題である。CPSCは紐・コード・ネックレスが物へ引っ掛かる、または首へ巻き付くことで絞扼につながると警告している。英国OPSSもコード長に起因する絞扼リスクを重大リスクとして扱っている。安全離脱部品そのものが脱落して小部品危険を生じたリコール例もあるため、「breakaway」の名称だけで合格にしない。

量産候補の装着用コードは、次を満たす単一の市販完成品SKUに固定する。

- 2–3mm相当で3.2mm穴へ無理なく通り、切断・圧着・結線加工を購入者へ要求しない。
- 首周り用としてメーカーが用途と離脱特性を公開した安全離脱機構を持つ。
- 通常通販で継続購入でき、lotとメーカー型番を追跡できる。
- メーカー公称離脱範囲と製品リスク評価で承認した範囲が一致する。
- 新品、汗相当湿潤後、10,000回摺動後について、複数方向・10回以上の離脱荷重を実測し、全回が承認範囲内に入る。
- 離脱後に危険な小部品、鋭利部、導電部露出を生じず、規定回数の再結合後も離脱特性を維持する。

適用市場、対象年齢、衣服・アクセサリー分類を確定する前に普遍的な離脱荷重値を設定しない。国内通常通販の第一候補は `RastaBanana RNST04BK` に一本化したが、公開されている約3kgは公称説明であって保証min/max分布ではない。末端ループの3.2mm穴適合も未実測なので `CANDIDATE_SELECTED/NOT_ADOPTED/NOT_RUN` とし、連続した生コードや結び目だけのコードを量産装着品として認めない。候補根拠は `docs/sourcing/xe-breakaway-cord-candidate.json` を正とする。

ケースの50N proof、15N/10,000-cycle疲労、穴内摺動は、離脱部を迂回した校正済み治具で紐受けの構造強度を評価する。装着用コードへ50Nを要求して安全離脱機能を無効化しない。

一次資料:

- U.S. CPSC, *Strings, Cords and Necklaces Can Strangle Infants*: https://www.cpsc.gov/s3fs-public/5095.pdf
- UK OPSS, *Robot Men Tooth Chew Necklace* product safety report: https://assets.publishing.service.gov.uk/media/68c2f52a8c6d992f23edd914/2508-0119-product-safety-report-chew-necklace.pdf
- U.S. CPSC, safety snap clasp detachment recall: https://www.cpsc.gov/Recalls/2025/Chews-Life-Recalls-Silicone-Rosary-and-Decade-Teethers-Due-to-Choking-Hazard
