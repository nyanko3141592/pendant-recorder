import base64,hashlib,json,zipfile,shutil
from pathlib import Path
P=Path(__file__).resolve().parent
# Read-only copies retain the exact previous outer-size comparison artifacts.
D=P/'original-size';D.mkdir(exist_ok=True)
for f in (P.parent/'print-size').iterdir():
 if f.suffix in ['.stl','.3mf'] or f.name in ['PRINT-README.txt','mesh-validation.json']:shutil.copy2(f,D/f.name)
images=[]
for v in ['A','B']:
 enc=base64.b64encode((P/v/'exploded.png').read_bytes()).decode()
 images.append(f'<section><h2>{v} — '+('横並び 40×41×10.8mm' if v=='A' else '積層 22×41×16.4mm')+f'</h2><img alt="{v}分解組立図" src="data:image/png;base64,{enc}"></section>')
html='''<!doctype html><html lang="ja"><meta charset="utf-8"><title>A/B FC1 組立図</title><style>body{font:16px system-ui;max-width:1200px;margin:32px auto;color:#20313b}h1{font-size:28px}.grid{display:grid;grid-template-columns:1fr 1fr;gap:24px}img{width:100%}p{line-height:1.7}table{border-collapse:collapse;width:100%}td,th{border:1px solid #abc;padding:10px}small{color:#536570}@media print{body{margin:10mm;font-size:11px}h1{font-size:20px}}</style><h1>A/B FC1 — 樹脂ダミーの組立図</h1><p>蓋・基板＋75部品包絡・電池・ケースを個別に印刷。灰青＝ケース/蓋、緑＝基板ダミー、金＝電池最大寸法ダミー、橙＝任意のハーネス予約ゲージ。<strong>分解図の部品間隔は説明用。</strong>収納位置は寸法JSONを参照。</p><div class="grid">'''+''.join(images)+'''</div><table><tr><th>順序</th><th>作業</th></tr><tr><td>1</td><td>電池を底の台に載せる。Aは横、Bは基板下。</td></tr><tr><td>2</td><td>USBの大きな包絡をケース開口側へ向け、基板を真上から4支持面へ載せる。</td></tr><tr><td>3</td><td>任意の橙色ゲージで前側の配線予約空間を見る。指定Z位置は手で保持する。</td></tr><tr><td>4</td><td>蓋をリムが下になるよう反転し、真上から着座。指掛かりから外す。スナップロックではない。</td></tr></table><p>取り出しは逆順。STL/3MFはmm・100%。ケースは開口上、蓋は外面下、電池は広い面下。基板はX90°回転・下辺を接地しブリムと張出しサポートを使用。</p><p><strong>検証：</strong>13組のメッシュ/単位/寸法、閉じた組立位置のCAD干渉0件、各案32離散取り出し位置で干渉0件。実機印刷・現物適合・連続掃引は未検証。</p><p><strong>未解決：</strong>全部品高さは仮定。Aの仮出口〜J2の水平差13.875mmは最短12mmリードより長い。ゲージは端子・リードの実形状ではなく、収納合格を示さない。Bも実ハーネス確認が必要。</p><small>FC1 / 2026-10-25。元の外形模型は同梱original-sizeに保持。詳細はPRINT-AND-ASSEMBLY.md。</small></html>'''
(P/'ASSEMBLY.html').write_text(html)
summary={'version':'FC1','date':'2026-10-25','stl_3mf_pairs':13,'closed_assembly':{},'withdrawal_discrete_poses_per_variant':32,'physical_print_tested':False,'final_harness_fit_qualified':False}
for v in ['A','B']:
 result=json.loads((P/v/'interference-results.json').read_text())[-1]
 assert result['count']==0 and not result['unchecked']
 summary['closed_assembly'][v]={'solid_bodies':result['checked'],'overlap_count':result['count'],'unchecked':result['unchecked']}
(P/'verification-summary.json').write_text(json.dumps(summary,indent=2))
files=[f for f in P.rglob('*') if f.is_file() and f.suffix not in ['.zip'] and f.name not in ['SHA256SUMS','drive-upload.json']]
(P/'SHA256SUMS').write_text(''.join(hashlib.sha256(f.read_bytes()).hexdigest()+'  '+str(f.relative_to(P))+'\n' for f in sorted(files)))
zipname=P/'Pendant_AB_fit-check_FC1_2026-10-25.zip'
with zipfile.ZipFile(zipname,'w',zipfile.ZIP_DEFLATED) as z:
 for f in files+[P/'SHA256SUMS']:z.write(f,'Pendant_AB_fit-check_FC1/'+str(f.relative_to(P)))
with zipfile.ZipFile(zipname) as z:assert z.testzip() is None
print(zipname,zipname.stat().st_size)
