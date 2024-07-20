import numpy as np
import pandas as pd

data = pd.read_excel('result1.xlsx')
#初始化
D0 = 70             #测线距中心线距离为0时海水深度
a = np.deg2rad(1.5) #海底坡面与水平面夹角
l0 = D0 / np.tan(a) #中心位置与理想岸边距离
print('中心位置与理想岸边距离l0 = ',l0)
ct = np.deg2rad(120) #多波束换能器的开角
a1 = (np.pi - ct)/2 - a #多波束换能器与坡面左侧夹角
a2 = (np.pi - ct)/2 + a #多波束换能器与坡面右侧夹角
Sea_depth = []          #海水深度
Covering_width = []     #覆盖宽度
Overlap_rate = []       #与前一条测线的重叠率
k = 0
for d in range(-800,800+1,200):
    D = (l0 - d)*np.tan(a) #不同测线距离海水深度
    Sea_depth.append(D)
    print('d = %d\t, D = ' % d, D,end = '\t')
    # 覆盖宽度
    W = D*np.sin(ct/2)*(1/np.sin(a1) + 1/np.sin(a2))
    print('W = ',W,end='\t')
    Covering_width.append(W)
    if(d == -800): #此测线距离不计算重叠率
        print()
    else:
        #与前一条测线重叠率
        rate = (1 - (200*np.cos(ct/2) / (Covering_width[k]*np.sin(a1)))) * 100
        Overlap_rate.append(rate)
        k+=1
        print('rate = ', rate)
#存入各个数据到表格中
for i in range(1,10): #存入海水深度
    data.iloc[0,i] = Sea_depth[i-1]
for i in range(1,10): #存入覆盖宽度
    data.iloc[1,i] = Covering_width[i-1]
for i in range(1,9): #存入重叠率
    data.iloc[2,i+1] = Overlap_rate[i-1]
data.to_excel('result1.xlsx',index=None)