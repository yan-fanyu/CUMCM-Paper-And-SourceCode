from numpy import *
import csv

M, N = 100, 100
a, b = 1, 1
hx, hy = a / M, b / N
p, q = 1 / hx ** 2, 1 / hy ** 2
r = -2 * (p + q)

U = zeros((M - 1, M - 1))
for i in range(M - 1):
    U[i, i] = r
    if i < M - 2: U[i, i + 1] = p
    if i > 0:   U[i, i - 1] = p
V = diag([q] * (M - 1))


with open("D:\Desktop\\one.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(U)

with open("D:\Desktop\\two.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(V)

Zero_mat = zeros((M - 1, M - 1))

with open("D:\Desktop\\three.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(Zero_mat)
A_blc = empty((N - 1, N - 1), dtype=object)  # 矩阵A的分块形式


with open("D:\Desktop\\four.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(A_blc)
for i in range(N - 1):
    for j in range(N - 1):
        if i == j:
            A_blc[i, j] = U
        elif abs(i - j) == 1:
            A_blc[i, j] = V
        else:
            A_blc[i, j] = Zero_mat

with open("D:\Desktop\\five.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(A_blc)
A = vstack([hstack(A_i) for A_i in A_blc])  # 组装得到矩阵A

with open("D:\Desktop\\six.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(A)

x_i = linspace(0, a, M + 1)
y_i = linspace(0, b, N + 1)

with open("D:\Desktop\\seven.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(x_i)
with open("D:\Desktop\\eight.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(y_i)
F = vstack([-2 * pi ** 2 * sin(pi * x_i[1:M].reshape((M - 1, 1))) * sin(pi * j) for j in y_i[1:N]])
with open("D:\Desktop\\night.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(F)
u = dot(linalg.inv(A), F).reshape(M - 1, N - 1)
with open("D:\Desktop\\ten.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(u)
u_f = vstack([zeros((1, M + 1)),  # 最后组装边界条件得到全域的解
              hstack([zeros((N - 1, 1)), u, zeros((N - 1, 1))]),
              zeros((1, M + 1))])
with open("D:\Desktop\\eleven.csv", "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerows(u_f)
