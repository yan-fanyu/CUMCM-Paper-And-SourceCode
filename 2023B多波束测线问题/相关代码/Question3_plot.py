import numpy as np
import matplotlib.pyplot as plt

# 定义常量
Sea_mile = 1852         # 海里（m）
Length = 2 * Sea_mile   # 海域长度（m）
Width = 4 * Sea_mile    # 海域宽度（m）

# 问题2得到的各间距距离
s = [359, 546, 507, 470, 436, 404,
     375, 348, 323, 299, 278, 257,
     239, 221, 205, 191, 177, 164,
     152, 141, 131, 121, 113, 104,
     97, 90, 83, 77, 72, 67, 62,
     57, 53, 49, 46, 42, 39]

# 初始化测线列表
x = [s[0]]      # 测线的横坐标列表（m）
y1 = [0]        # 测线的起点纵坐标列表（m）
y2 = [Length]   # 测线的终点纵坐标列表（m）

for i in range(len(s)):
    x.append(x[-1] + s[i])                      # 添加下一条测线的横坐标
    y1.append(Length if len(x) % 2 == 0 else 0)  # 添加下一条测线的起点纵坐标
    y2.append(0 if len(x) % 2 == 0 else Length)  # 添加下一条测线的终点纵坐标

# 绘制示意图
plt.figure(figsize=(8,4))               # 创建画布
plt.plot(x, y1, 'bo', label='start')    # 绘制起点
plt.plot(x, y2, 'ro', label='end')      # 绘制终点
plt.plot([x, x], [y1, y2], 'k--')       # 绘制测线
plt.xlabel('X (m)')                     # 设置横轴标签
plt.ylabel('Y (m)')                     # 设置纵轴标签
plt.title('Line diagram')               # 设置标题
plt.legend()                            # 显示图例
plt.show()                              # 显示图像
