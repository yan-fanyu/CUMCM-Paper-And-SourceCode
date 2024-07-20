import matplotlib.pyplot as plt
import numpy as np
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False
#条形图的绘制
labels = ['浅绿', '浅蓝', '深绿', '深蓝', '紫','绿','蓝绿','黑']

men_means = [2,8,3,2,2,1,6,0]
women_means = [1,12,4,0,2,0,9,2]

width = 0.35  # 条形图的宽度
fig,ax = plt.subplots()
ax.bar(labels, men_means,width,label='未风化')
ax.bar(labels,women_means,width,bottom=men_means,label='风化')
ax.set_ylabel('数目',size=16)
ax.set_xlabel('颜色',size=16)
ax.set_title('古代玻璃制品表面风化与其颜色的关系',size=16)
plt.yticks(np.arange(0,22,2))

#调整图片大小
font = {'family':'simhei',
         'weight': 'normal',
         'size': 15,
         };
ax.legend(['未风化','风化'],prop=font,labelspacing=1);#这样就可以设置标签字体大小
ax.tick_params(labelsize=16)  #设置色标刻度字体大小
plt.rcParams["figure.figsize"] = (6, 5)

plt.show()
plt.savefig('C1(1).png',dpi = 1600); #保存图像，dpi可以调整图像的像素大小
