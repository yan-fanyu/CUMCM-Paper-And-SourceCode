import numpy as np
import pandas as pd
data = pd.DataFrame(columns=['当前测线位置序号','海水深度','距上一条测线距离','覆盖率'])
#初始化
Sea_mile = 1852             #单位转化
D0 = 110                    #测线距中心线距离为0时海水深度
Length = 2 * Sea_mile       #矩形海域长
Width = 4 * Sea_mile        #矩形海域宽
a0 = np.deg2rad(1.5)        #海底坡面
ct = np.deg2rad(120)        #多波束换能器的开角
a1 = (np.pi - ct) / 2 - a0  #多波束换能器与坡面左侧夹角
a2 = (np.pi - ct) / 2 + a0  #多波束换能器与坡面右侧夹角
target_rate = 0.1           #最优覆盖率

#计算起始测线位置
dt = Length * np.tan(a0) #中心海域与最深处高度差
H = D0 + dt              #最深处深度
s0 = H / np.tan(a0+a1)   #起始测线距西边界距离

#计算末位置测线
l0 = D0 / np.tan(a0)            #理想岸边距离
h = (l0 - Length)*np.tan(a0)    #最浅处海水深度
sn = Width - h * np.tan(ct/2)   #末位置测线距西边界距离

s = []          #各个测线间距
s.append(s0)
i = 2
cnt = 0
data = data.append({'当前测线位置序号': 1, '海水深度': np.tan(a0+a1)*s0,
                                    '距上一条测线距离': s0,'覆盖率': '——'}, ignore_index=True)
while sum(s) < sn:
    rate_temp = 0
    sx_temp = 0
    D_temp = 0
    cnt = 0
    for sx in range(20,600):
        #print('第%d个测线，迭代%d次' % (i,cnt))
        cnt += 1
        #print('距离上一条航线 %d 米' % sx)
        D = H - (sx + sum(s)) * np.tan(a0)  # 当前海水深度
        #print('\t海水深度:', D)
        W = D * np.sin(ct / 2) * (1 / np.sin(a1) + 1 / np.sin(a2))
        #print('\t测量宽度:', W)
        # ans = ((1 - rate) * W * np.sin(a1)) / np.cos(ct / 2)
        rate = 1 - (sx * np.cos(ct / 2) / (W * np.sin(a1)))
        #print('\t覆盖率：', rate)
        #print('\t当前测量到：', sum(s))
        if rate < 0.12:
            if rate < target_rate:
                data = data.append({'当前测线位置序号': i, '海水深度': D_temp,
                                    '距上一条测线距离': sx_temp,'覆盖率': rate_temp}, ignore_index=True)
                s.append(sx_temp)  #最优
                break
            else:
                D_temp = D
                sx_temp = sx
                rate_temp = rate
                ...
            ...
        ...
    i += 1
    ...
data.to_excel('result3_2.xlsx', index=None)
print('总测线长度为：',Length*len(s))


