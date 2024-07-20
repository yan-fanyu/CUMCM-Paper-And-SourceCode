%根据Q3搜索的L2、L1结果，获取相关信息
clc;clear;close all;
h1=116.790;h2=8.374;
T_en=80;tt=1800;
L1=0.6;L2=19.3;L3=3.6;L4=6.4;
[T]=qiujie(L1,L2,L3,L4,h1,h2,T_en,tt);
TT=T(end,:);%提取人体表面温度
count=find(TT>44);%找出温度超44°的点
T_max=TT(end);%t=30mins时人体的温度
pass=length(count);%超出时间


