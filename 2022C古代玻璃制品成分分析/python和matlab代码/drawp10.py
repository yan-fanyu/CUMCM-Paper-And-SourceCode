# encoding=utf-8
import matplotlib.pyplot as plt
from pylab import *         #支持中文
mpl.rcParams['font.sans-serif'] = ['SimHei']

def remove_edge(plt):
    fig, ax = plt.subplots()
    ax.spines["top"].set_visible(False)
    #ax.spines["bottom"].set_visible(False)
    ax.spines["right"].set_visible(False)
    #ax.spines["left"].set_visible(False)
    # 改变长宽比
remove_edge(plt);
names = ['-30%', '-25%', '-20%', '-15%', '-10%','-5%','+5%','+10%','+15%','+20%','+25%','+30%']
x = range(len(names))

y = [92.5, 92.5, 100, 100, 100,100,100,100,100,100,100,100]
#y1= [100, 100, 100, 100, 100,100,100,100,100,100,92.5,92.5]

#plt.plot(x, y, 'ro-')
#plt.plot(x, y1, 'bo-')
plt.xlim(-1, 12) # 限定横轴的范围
plt.ylim(75, 101) # 限定纵轴的范围

plt.plot(x, y, marker='o', mec='r', mfc='w',label=u'二氧化硅最大值')
#plt.plot(x, y1, marker='*', ms=10,label=u'二氧化硅最小值')

#plt.legend() # 让图例生效
plt.xticks(x, names, rotation=45)
plt.margins(0)
plt.subplots_adjust(bottom=0.15)
plt.xlabel(u"扰动幅度",size=24) #X轴标签
plt.ylabel("准确率（%）",size=24) #Y轴标签
#plt.title("A simple plot") #标题
plt.rcParams["figure.figsize"] = (10, 6)
plt.tick_params(labelsize=24)

plt.savefig('sio2mx.png',dpi=20*12)  # 保存图片
#plt.savefig('sio2mn.png',dpi=20*12)  # 保存图片

plt.show()
