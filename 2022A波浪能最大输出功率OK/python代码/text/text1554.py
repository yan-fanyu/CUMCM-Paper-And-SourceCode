import math
import matplotlib.pyplot as plt
import csv

step = 0.01
start = 0
end = 200

def V(u1):
    if u1 <= 2:
        return math.pi * u1
    else:
        return 2 * math.pi +(1-math.pow((2.8-u1)/0.8,3)) * (0.8 * math.pi/3)

def f1(x,u1,u2,w1,w2):
    return u2

def f2(x,u1,u2,w1,w2):
    return (6250 * math.cos(1.4005 * x) - 656.3616 * u2 -V(u1) * 1025 * 9.8 + 80000 * (w1 - u1) + 10000 * (w2 - u2))*(1/(4866+1335.535))

def f3(x,u1,u2,w1,w2):
    return w2

def f4(x,u1,u2,w1,w2):
    return (1/2433) * (-1*80000 * (w1 - u1) - 10000 * (w2 - u2))

def RK4(u1,u2,w1,w2,x):
    for i in range(len(x) - 1):
        k11 = f1(x[i], u1[i], u2[i], w1[i], w2[i])
        k21 = f2(x[i], u1[i], u2[i], w1[i], w2[i])
        L11 = f3(x[i], u1[i], u2[i], w1[i], w2[i])
        L21 = f4(x[i], u1[i], u2[i], w1[i], w2[i])

        k12 = f1(x[i] + step / 2, u1[i] + step * k11 / 2, u2[i] + step * k21 / 2, w1[i] + step * L11 / 2, w2[i] + step * L21 / 2)
        k22 = f2(x[i] + step / 2, u1[i] + step * k11 / 2, u2[i] + step * k21 / 2, w1[i] + step * L11 / 2, w2[i] + step * L21 / 2)
        L12 = f3(x[i] + step / 2, u1[i] + step * k11 / 2, u2[i] + step * k21 / 2, w1[i] + step * L11 / 2, w2[i] + step * L21 / 2)
        L22 = f4(x[i] + step / 2, u1[i] + step * k11 / 2, u2[i] + step * k21 / 2, w1[i] + step * L11 / 2, w2[i] + step * L21 / 2)

        k13 = f1(x[i] + step / 2, u1[i] + step * k12 / 2, u2[i] + step * k22 / 2, w1[i] + step * L12 / 2, w2[i] + step * L22 / 2)
        k23 = f2(x[i] + step / 2, u1[i] + step * k12 / 2, u2[i] + step * k22 / 2, w1[i] + step * L12 / 2, w2[i] + step * L22 / 2)
        L13 = f3(x[i] + step / 2, u1[i] + step * k12 / 2, u2[i] + step * k22 / 2, w1[i] + step * L12 / 2, w2[i] + step * L22 / 2)
        L23 = f4(x[i] + step / 2, u1[i] + step * k12 / 2, u2[i] + step * k22 / 2, w1[i] + step * L12 / 2, w2[i] + step * L22 / 2)

        k14 = f1(x[i] + step, u1[i] + step * k13, u2[i] + step * k23, w1[i] + step * L13, w2[i] + step * L23)
        k24 = f2(x[i] + step, u1[i] + step * k13, u2[i] + step * k23, w1[i] + step * L13, w2[i] + step * L23)
        L14 = f3(x[i] + step, u1[i] + step * k13, u2[i] + step * k23, w1[i] + step * L13, w2[i] + step * L23)
        L24 = f4(x[i] + step, u1[i] + step * k13, u2[i] + step * k23, w1[i] + step * L13, w2[i] + step * L23)

        u1[i + 1] = u1[i] + step / 6 * (k11 + 2 * k12 + 2 * k13 + k14)
        u2[i + 1] = u2[i] + step / 6 * (k21 + 2 * k22 + 2 * k23 + k24)
        w1[i + 1] = w1[i] + step / 6 * (L11 + 2 * L12 + 2 * L13 + L14)
        w2[i + 1] = w2[i] + step / 6 * (L21 + 2 * L22 + 2 * L23 + L24)
    return [u1,u2,w1,w2]


if __name__ == "__main__":

    x = []
    temp = start
    while temp <= end:
        x.append(temp)
        temp += step

    u1 = [0 for i in range(len(x))]
    u2 = [0 for i in range(len(x))]
    w1 = [0 for i in range(len(x))]
    w2 = [0 for i in range(len(x))]

    [u1,u2,w1,w2] = RK4(u1,u2,w1,w2,x)


    with open("D:\Desktop\\T1.1.csv", "w", newline="") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows([u1,u2,w1,w2])

    plt.rcParams['font.sans-serif'] = ['SimHei']
    plt.rcParams['axes.unicode_minus'] = False
    plt.plot(x, u2, color="red" ,linewidth=1.0, linestyle="-")  # 将散点连在一起
    plt.plot(x, w2, color="blue", linewidth=1.0, linestyle="-")
    plt.xlabel('时间/s')
    plt.ylabel('位移/m')
    plt.show()

    cha = [(w1[i] - u1[i]) for i in range(len(w1))]
    plt.plot(x, cha, color="red", linewidth=1.0, linestyle="-")  # 将散点连在一起
    plt.xlabel('时间/s')
    plt.ylabel('位移/m')
    plt.show()

    print(u1[999])












