a1=-194.7;
b1=-13.4;
c1=15.6;
d1=-0.5;
a2=-194.8;
b2=-9.6;
c2=14.8;
d2=-0.5;
a3=-159.7;
b3=-14.5;
c3=14.8;
d3=-0.5;

% 代号-得分-等级
E_Z_DJ = [
1	0.1451	1
2	0.1427	1
3	0.1218	1
4	0.1205	1
5	0.1287	2
6	0.142	1
7	0.1428	1
8	0.1424	1
9	0.1456	1
10	0.1357	2
11	0.1166	1
12	0.1295	2
13	0.1425	1
14	0.1275	1
15	0.5216	1
16	0.2621	1
17	0.1427	1
18	0.142	1
19	0.1445	1
20	0.1296	2
21	0.1288	2
22	0.1428	1
23	0.1294	2
24	0.1432	1
25	0.1161	1
26	0.1424	1
27	0.1425	1
28	0.1794	2
29	0.2514	1
30	0.1389	2
31	0.1512	1
32	0.1321	2
33	0.1291	2
34	0.1299	2
35	0.1307	2
37	0.131	2
38	0.1358	2
39	0.1303	1
40	0.1157	1
41	0.1154	1
42	0.7335	1
43	0.1326	2
44	0.1174	1
46	0.1148	1
47	0.1162	1
48	0.1433	1
49	0.1147	1
50	0.1317	1
51	0.1324	2
53	0.1151	1
54	0.145	1
55	0.1149	1
56	0.1162	1
57	0.1697	2
58	0.1288	2
59	0.1465	1
60	0.1432	2
61	0.1431	2
62	0.13	2
63	0.1283	2
64	0.2041	1
65	0.1323	2
66	0.1286	2
67	0.1292	2
68	0.5266	1
69	0.1407	1
70	0.1285	2
71	0.1287	2
72	0.116	1
73	0.1154	1
74	0.2955	2
75	0.147	1
76	0.1295	2
77	0.1257	1
78	0.1194	1
79	0.1287	2
80	0.1166	1
81	0.1474	1
83	0.1282	2
84	0.1553	1
85	0.1364	2
86	0.183	1
88	0.1466	1
89	0.1584	1
90	0.1194	1
91	0.143	1
92	0.1179	1
93	0.1317	2
94	0.1923	1
95	0.5707	2
96	0.1541	1
97	0.1633	2
98	0.1367	2
104	0.1418	1
105	0.1451	1
106	0.1393	2
110	0.1549	1    
];
E = E_Z_DJ(:, 1);
DJ = E_Z_DJ(:, 3);
Z = E_Z_DJ(:, 2);

% FA = a1*x^3+b1*x^2+c1*x+d1;
% FB = a2*x^3+b2*x^2+c2*x+d2;
% FC = a3*x^3+b3*x^2+c3*x+d3;
sigma = 4:1:15;
D = 10:1:100;  % 投放金额
T = 1;  %周期为 1 年
M = 2000; % 总贷款额度2000万

Sigma = [];
DD = [];
Beta = [];
W = [];
N = 10000000;    % 迭代次数
Z_S = ones(100, length(E));  % 每个利率
Z_D = ones(100, length(E));  % 每个投资


nnn = 0;
for i=1:1:N
    Sigma = [];
    DD = [];
    w = 0;
    for j=1:length(E)
        Sigma(j) = 0.04 + (0.15-0.04).*rand(1,1);
        x = Sigma(j);
        DD(j) = 10 + (100-10).*rand(1,1);
        d = DD(j);
        if DJ(j) == 1
           Beta(j) =  a1*x^3+b1*x^2+c1*x+d1;
        elseif DJ(j) == 2
            Beta(j) =  a2*x^3+b2*x^2+c2*x+d2;
        else
            Beta(j) =  a3*x^3+b3*x^2+c3*x+d3;
        end
        w = w + d*x*(1-Beta(j))*Z(j);
    end
    if w > 32
        nnn  = nnn+1;
        W(nnn) = w;
        Z_S(nnn,:) = Sigma(:);
        Z_D(nnn,:) = DD(:);
    end
end

XX = 1:1:nnn;
plot(XX, W, '*');
           
            
        
        
