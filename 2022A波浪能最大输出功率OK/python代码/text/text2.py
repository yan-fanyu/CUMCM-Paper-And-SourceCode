import math
import matplotlib.pyplot as plt


# 龙格-库塔法的定义
def runge_kutta(y, h, f):
    k1 = h * f(t, x1, x2)
    k2 = h * f(t + 0.5 * h, x1 + 0.5 * k1, x2 + 0.5 * k1)
    k3 = h * f(t + 0.5 * h, x1 + 0.5 * k2, x2 + 0.5 * k2)
    k4 = h * f(t + h, x1 + k3, x2 + k3)
    return y + (k1 + 2 * k2 + 2 * k3 + k4) / 6.


# 微分方程函数的定义
def func_x1(t, x1, x2):
    return x2


def func_x2(t, x1, x2):
    v1 = - t ** 2 / 4
    v2 = math.exp(v1)
    return 4 * v2 / x1 ** 3 - (1 + 2 * x2 ** 2) / x1


if __name__ == '__main__':
    dt = 0.001  # 步长
    # 边界条件
    t = 0
    x1 = 0.0063  # 初值
    x2 = 0
    x1s, x2s, ts = [], [], []
    # Run
    while t <= 16:  # 迭代边界
        x1 = runge_kutta(x1, dt, func_x1)
        x2 = runge_kutta(x2, dt, func_x2)
        t += dt
        x1s.append(x1)
        x2s.append(x2)
        ts.append(t)
    # Plot
    plt.subplot(2, 1, 1)
    plt.plot(ts, x1s, label='y')
    plt.legend()
    plt.grid()  # 图注
    plt.subplot(2, 1, 2)
    plt.plot(ts, x2s, label='dy / dx')
    plt.legend()
    plt.grid()
    plt.show()