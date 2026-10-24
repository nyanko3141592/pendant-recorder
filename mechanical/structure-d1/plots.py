import json,math
from pathlib import Path
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch,Rectangle,Circle
P=Path(__file__).resolve().parent;ROOT=P.parents[1]
plt.rcParams.update({'font.family':'Hiragino Sans','font.size':12,'axes.unicode_minus':False})
fig,ax=plt.subplots(figsize=(10,6.7),layout='constrained');fig.patch.set_facecolor('#f3f6f8');ax.set_facecolor('#f3f6f8')
i=np.linspace(2,10,200)
ax.fill_between(i,150*.5/i,150*.85/i,color='#2c937e',alpha=.12,label='150mAh・使用可能容量50〜85%の仮定幅')
ax.plot(i,150*.7/i,color='#218975',lw=3,label='150mAh・70%仮定')
ax.plot(i,110*.7/i,color='#8795a3',lw=2,ls='--',label='旧110mAh・70%仮定')
ax.axhline(16,color='#cb6c42',lw=1.8,label='必須：16時間');ax.scatter([5,6,7],[21,17.5,15],color='#218975',s=45,zorder=4)
for x,y in [(5,21),(6,17.5),(7,15)]:ax.annotate(f'{x}mA → {y:g}時間',(x,y),xytext=(12,12) if x!=6 else (-105,-50),textcoords='offset points',fontsize=11,arrowprops=dict(arrowstyle='-',color='#7b918d') if x==6 else None)
ax.set(xlim=(2,10),ylim=(0,40),xlabel='電池端子での平均消費電流［mA］',ylabel='計算上の連続録音時間［h］',title='150mAh丸形電池：稼働時間の感度分析')
ax.grid(alpha=.15);ax.legend(loc='upper right',fontsize=10);fig.text(.07,-.01,'消費電流は未実測。70%は仮定であり、低温・劣化・電源回路の終止条件を保証しない。',fontsize=10)
fig.savefig(P/'runtime.png',dpi=180,bbox_inches='tight');plt.close(fig)
d=json.loads((ROOT/'hardware/omi-fit-d1/placement.json').read_text());fig,axs=plt.subplots(1,2,figsize=(12,6.8));fig.patch.set_facecolor('#f3f6f8')
for ax,side,title in zip(axs,['F','B'],['表面：USB-C／電池コネクタ','裏面：MCU／保存メモリ等']):
 ax.set_aspect('equal');ax.add_patch(Circle((0,0),11.5,fc='#e5f0eb',ec='#2f6c59',lw=2))
 for r,v in d['placements'].items():
  if v['side']!=side:continue
  x,y,w,h=v['bbox'];color='#d5b476' if r.startswith('J') else ('#82a7b3' if r.startswith('U') else '#c8d5d0')
  ax.add_patch(Rectangle((x,y),w,h,fc=color,ec='#5b7476',lw=.5));ax.text(x+w/2,y+h/2,r,ha='center',va='center',fontsize=7)
 ax.set(xlim=(-13,13),ylim=(-13,13),title=title,xlabel='mm',ylabel='mm');ax.set_facecolor('#f3f6f8')
fig.suptitle('直径23mmの円形基板：全76箇所を配置',fontsize=17)
fig.text(.5,.02,'両面とも同じ上面座標で表示。矩形はフットプリント包絡。J1本体は張出し、全パッドは円内。未配線・発注不可。',ha='center',fontsize=11)
fig.subplots_adjust(bottom=.14,wspace=.25);fig.savefig(P/'placement.png',dpi=180,bbox_inches='tight');plt.close(fig)
# Analytic envelope comparison, not mass or finished case CAD volume.
area=lambda w,h,r:w*h-(4-math.pi)*r*r
metrics={'case_C0_envelope_mm3':area(23.8,34,2)*14,'case_D0_envelope_mm3':area(25.5,25.5,3.5)*14.5,'case_D1_envelope_mm3':math.pi*(25.5/2)**2*14.5,'omi_cylinder_reference_mm3':math.pi*(25.5/2)**2*15}
metrics['D0_vs_C0_percent']=(metrics['case_D0_envelope_mm3']/metrics['case_C0_envelope_mm3']-1)*100
metrics['D0_vs_omi_percent']=(metrics['case_D0_envelope_mm3']/metrics['omi_cylinder_reference_mm3']-1)*100
metrics['D1_vs_D0_percent']=(metrics['case_D1_envelope_mm3']/metrics['case_D0_envelope_mm3']-1)*100
metrics['D1_vs_C0_percent']=(metrics['case_D1_envelope_mm3']/metrics['case_C0_envelope_mm3']-1)*100
metrics['D1_vs_omi_percent']=(metrics['case_D1_envelope_mm3']/metrics['omi_cylinder_reference_mm3']-1)*100
metrics['note']='Outer envelope approximation, excludes openings, attachments, curvature and tolerances; Omi simplified cylinder.'
(P/'comparison-metrics.json').write_text(json.dumps(metrics,indent=2)+'\n');print(metrics)
fig,ax=plt.subplots(figsize=(14,5.8));fig.patch.set_facecolor('#f3f6f8');ax.set_facecolor('#f3f6f8')
for x,label,w,h,r,t,col in [(-68,'旧 C0',23.8,34,2,14,'#c4ccd3'),(-34,'前案 D0',25.5,25.5,3.5,14.5,'#bdcec7'),(0,'今回 D1（円形）',25.5,25.5,None,14.5,'#68b9a5'),(34,'Omi（外形近似）',25.5,25.5,None,15,'#e0ded3'),(68,'500円玉',26.5,26.5,None,None,'#d9bd76')]:
 if r is None:ax.add_patch(Circle((x,h/2),w/2,fc=col,ec='#344f60',lw=1.5))
 else:ax.add_patch(FancyBboxPatch((x-w/2,0),w,h,boxstyle=f'round,pad=0,rounding_size={r}',fc=col,ec='#344f60',lw=1.5))
 ax.text(x,-5,label,ha='center',fontsize=12,weight='bold');ax.text(x,-10,f'直径 {w:g} mm' if r is None else f'{w:g} × {h:g} mm',ha='center',fontsize=11)
 if t:ax.text(x,-15,f'厚さ {t:g} mm',ha='center',fontsize=11)
 if t:ax.add_patch(Rectangle((x-w/2,-35),w,t,fc=col,ec='#344f60',lw=1))
ax.text(-84,-28,'側面',ha='right',fontsize=10)
ax.set(xlim=(-91,84),ylim=(-44,40),aspect='equal');ax.axis('off');ax.set_title('同縮尺の外形比較：円形基板と円形ケースへ再設計',fontsize=17,pad=10)
ax.text(0,-42,'D1は未配線の構造案。装着部・固定・公差・完成電池の収納は未確定。',ha='center',fontsize=10)
fig.subplots_adjust(left=.025,right=.99,bottom=.02,top=.89);fig.savefig(P/'comparison-scale.png',dpi=180);plt.close(fig)
