%求解二层、四层的最优厚度
%程序运行可能约5mins
clc;clear;close all;
h1=116.790;h2=8.374;
T_en=80;tt=1800;
L1=0.6;L3=3.6;
%遍历找到L2、L4
min_L2=25;
for L2=0.6:0.1:25
 min_L4=6.4;
for L4=0.6:0.1:6.4
[T]=qiujie(L1,L2,L3,L4,h1,h2,T_en,tt);
TT=T(end,:);%提取人体表面温度
count=find(TT>44);%找出温度超44°的点
if TT(end,end)<=47&&length(count)<=5*60&&L2<=min_L2%先找到二层厚度最小
    min_L2=L2;
    if L4<min_L4%再找到四层厚度最小
        min_L4=L4;
        T_max=TT(end);
        pass=length(count);%超出时间
    end
end
end
end
