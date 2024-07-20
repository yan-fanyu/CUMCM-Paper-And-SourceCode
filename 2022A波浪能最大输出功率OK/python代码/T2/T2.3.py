#第二题第二问，退火算法求解
import math
import matplotlib.pyplot as plt
import csv
import copy
import random

step = 0.01
start = 0
end = 450

c1 = 0
d1 = 0

T = 1

def V(tt):
    if tt <= 2:
        return math.pi * tt
    else:
        return 2 * math.pi +(1-math.pow((2.8-tt)/0.8,3)) * (0.8 * math.pi/3)

def f1(x,u1,u2,w1,w2):
    return u2

def f2(x,u1,u2,w1,w2):
    return (4890 * math.cos(2.2143 * x) - 167.8395 * u2 -V(u1) * 1025 * 9.8 + 80000 * (w1 - u1) + c1 * math.pow(abs(w2 - u2) , d1) * (w2 - u2))*(1/(4866+1165.992))

def f3(x,u1,u2,w1,w2):
    return w2

def f4(x,u1,u2,w1,w2):
    return (1/2433) * (-1*80000 * (w1 - u1) - c1 * math.pow(abs(w2 - u2) , d1) * (w2 - u2))

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
        # print(u1[i])

def newans(one,two,st1,st2):
    rd = random.randint(1, 4)
    one1 = one
    two1 = two

    if rd == 1:
        one1 += st1
    if rd == 2:
        one1 -= st1
    if rd == 3:
        two1 += st2
    if rd == 4:
        two1 -= st2
    if one1 <= 100000 and two1 <= 100000 and one1 >= 0 and two1 >= 0:
        return [one1,two1]
    else:
        return [one,two]


if __name__ == "__main__":
    list1 = []
    temp = start
    while temp <= end + 0.00001:
        list1.append(temp)
        temp += step

    u1 = [0 for i in range(len(list1))]
    u2 = [0 for i in range(len(list1))]
    w1 = [0 for i in range(len(list1))]
    w2 = [0 for i in range(len(list1))]

    x = copy.deepcopy(list1)
    aver = []
    list = range(0,100001,5000)

    li = []
    step2 = 0.1
    start2 = 0
    end2 = 1
    temp = start2
    while temp <= end2 +0.0001:
        li.append(temp)
        temp += step2
    c1 = 100000
    d1 = 0.4129

    ii = 0
    for yy in range(10000):

        u1[0] = 0
        u2[0] = 0
        w1[0] = 0
        w2[0] = 0
        [tempc,tempd] = newans(c1,d1,0.5,0.00001)
        tc = c1
        td = d1

        c1 = tempc
        d1 = tempd

        RK4(u1, u2, w1, w2, x)
        p = [c1 * math.pow(abs(w2[i] - u2[i]), d1) * (u2[i] - w2[i]) * (u2[i] - w2[i]) for i in range(40000, 45000)]
        tempii = sum(p) / len(p)
        if tempii > ii:
            print(c1,d1,tempii)
            ii = tempii
        else:
            rr = random.randint(0, 100000000)/100000000
            if rr < math.exp(-1 * (ii - tempii) / T):
                print(c1, d1, tempii)
                ii = tempii
            else:
                c1 = tc
                d1 = td

        T = T * 0.5



    # ans = []
    # for c in list:
    #     aa = []
    #     for d in li:
    #         u1[0] = 0
    #         u2[0] = 0
    #         w1[0] = 0
    #         w2[0] = 0
    #         print(c,d)
    #         c1 = c
    #         d1 = d
    #         RK4(u1, u2, w1, w2, x)
    #         p = [c1 * math.pow(abs(w2[i] - u2[i]) , d1) * (u2[i] - w2[i]) * (u2[i] - w2[i]) for i in range(40000, 45000)]
    #         ii = sum(p) / len(p)
    #         aver.append([c,d,ii])
    #         aa.append(ii)
    #     ans.append(aa)
    #
    #
    # with open("D:\Desktop\\T2.2.csv", "w", newline="") as csvfile:
    #     writer = csv.writer(csvfile)
    #     writer.writerows(aver)
    #
    # with open("D:\Desktop\\T2.4.csv", "w", newline="") as csvfile:
    #     writer = csv.writer(csvfile)
    #     writer.writerows(ans)














