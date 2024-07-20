import numpy as np
import pandas as pd

data = pd.read_csv('result2.csv',encoding='gbk')
#初始化
Sea_mile = 1852         #单位转化
a0 = np.deg2rad(1.5)    #海底坡面与水平面夹角
D0 = 120                #测线距中心线距离为0时海水深度
ct = np.deg2rad(120)    #多波束换能器的开角
k = 0

for b0 in range(0,315+1,45):
    Covering_width = []        #覆盖宽度
    print('当β = %d时' % b0,end=' ')
    Beta_Angle = np.deg2rad(b0) #贝塔角
    a = np.sin(Beta_Angle) * a0 #真实投影角
    print('a= ',np.rad2deg(a))
    a1 = (np.pi - ct) / 2 - a   #多波束换能器与坡面左侧夹角
    a2 = (np.pi - ct) / 2 + a   #多波束换能器与坡面右侧夹角
    for i in np.arange(0,2.2,0.3):
        x = i * Sea_mile        #测量船距海域中心点处的距离，单位米
        #覆盖宽度计算
        if Beta_Angle==0:       #特殊情况
            W = 2*(D0+x*np.tan(a0))*np.tan(ct/2)
            Covering_width.append(W)
            print(W)
        else:
            W = (D0 + x*np.tan(a)/np.tan(Beta_Angle))* np.sin(ct / 2) * (1 / np.sin(a1) + 1 / np.sin(a2))
            Covering_width.append(W)
            print(W)
    for i in range(len(Covering_width)):
        data.iloc[k, i + 1] = Covering_width[i]
    k += 1
data.to_csv('result2.csv', index=None,encoding='gbk')

