import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
pd.set_option('expand_frame_repr',False)
df=pd.read_csv(r"xishu.csv")
y_ticks = ['表面风化','颜色','类型','纹饰']
x_ticks = ['纹饰','类型','颜色','表面风化']  # 自定义横纵轴标签
plt.rcParams['font.sans-serif'] = ['SimHei'] #可以正常显示中文
plt.rcParams['axes.unicode_minus'] = False #正常显示负号
ax = sns.heatmap(df,annot=True,fmt='.4f',cmap="Reds",vmax=1, vmin=-1,xticklabels=x_ticks, yticklabels=y_ticks,annot_kws={'size':16},cbar=False)
#  annot=True表示每一个格子显示数字;fmt='.0f'表示保留0位小数，同理fmt='.1f'表示保留一位小数
#  camp表示颜色，在另一个博主的文章中讲解的很清晰
#  vmax=350, vmin=20表示右侧颜色条的最大最小值，在最大最小值外的颜色将直接以最大或最小值的颜色显示，
#  通过此设置就可以解决少数值过大从而使得大部分色块区别不明显的问题
#  xticklabels=x_ticks, yticklabels=y_ticks，横纵轴标签
#ax.set_title('分速度报警类型分布')  # 图标题
ax.set_xlabel('纹饰',size=16)  # x轴标题
ax.set_ylabel('风化程度',size=16)  # y轴标题

#调整图片字体大小
font = {'family':'simhei',
         'weight': 'normal',
         'size': 16,
         };
#ax.legend(['未风化','风化'],prop=font,labelspacing=1);#这样就可以设置标签字体大小
ax.tick_params(labelsize=16)  #设置色标刻度字体大小
cb=ax.figure.colorbar(ax.collections[0]) #显示colorbar
cb.ax.tick_params(labelsize=16) #设置colorbar刻度字体大小。
plt.rcParams["figure.figsize"] = (12, 6)

plt.show()
figure = ax.get_figure()

figure.savefig('xishu.png',dpi=24*12)  # 保存图片
