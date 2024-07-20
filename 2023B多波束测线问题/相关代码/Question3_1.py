import numpy as np
import pandas as pd
data = pd.DataFrame(columns=['测量带条数','间隔距离','最小覆盖率','最大覆盖率'])
#初始化
Sea_mile = 1852             #单位转化
D0 = 110                    #测线距中心线距离为0时海水深度
Length = 2 * Sea_mile       #矩形海域长
Width = 4 * Sea_mile        #矩形海域宽
a0 = np.deg2rad(1.5)        #海底坡面
ct = np.deg2rad(120)        #多波束换能器的开角
Xmin = 0                    #测量船只移动最小距离
Xmax = Width                #测量船只移动最大距离
ans = 0                     #统计满足条件的个数
#计算最大覆盖宽度
dt = Length * np.tan(a0)    #中心海域与最深处高度差
H = D0 + dt                 #最深处深度
Wmax = 2*(H-Xmin*np.tan(a0))*np.tan(ct/2)
print('最大覆盖宽度：',Wmax)

#计算最小覆盖宽度
l0 = D0 / np.tan(a0)            #理想岸边距离
h = (l0 - Length)*np.tan(a0)    #最浅处海水深度
Wmin = 2*(H-Xmax*np.tan(a0))*np.tan(ct/2)
print('最小覆盖宽度：',Wmin)

#两侧测线距边界距离
x0 = Wmin / 2
print('北侧第一条测线距离：',x0)

for n in range(2,300):
    d = (Length - 2*x0) / n     #排除边界的测线间隔
    #print('测量带条数n = %d, 间隔d = %d' % (n+2,d),end='\t')
    rate_max = 1-d/Wmax
    rate_min = 1-d/Wmin
    #print('覆盖率范围：(%f,%f)' % (rate_min,rate_max))
    data = data.append({'测量带条数': n+2, '间隔距离': d,
                        '最小覆盖率': rate_min, '最大覆盖率': rate_max}, ignore_index=True)
    if rate_min > 0.1 and rate_max < 0.2:
        ans += 1
        #print('符合要求')
data.to_excel('result3_1.xlsx', index=None)
print('共有%d种情况符合要求' % ans)