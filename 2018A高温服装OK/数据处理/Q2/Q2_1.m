%求解二层的最优厚度
clc;clear;close all;
L1=0.6;L3=3.6;L4=5.5;
h1=116.790;h2=8.374;
T_en=65;tt=3600;
%遍历找到L2
min_L2=25;
for L2=0.6:0.1:25
[T]=qiujie(L1,L2,L3,L4,h1,h2,T_en,tt);
TT=T(end,:);%提取人体表面温度
count=find(TT>44);%找出温度超44°的点
if TT(end,end)<=47&&length(count)<=5*60&&L2<min_L2
    min_L2=L2;
    T_re=TT;
    T_max=TT(end);
    pass=length(count);%超出时间
end
end
%绘图,皮肤随时间的温度变化
figure('Color','w')
x=0:tt;
plot(x,T_re,'b-','LineWidth',1.7)
hold on
plot(x,ones(1,length(x))*T_max,'k:','LineWidth',1.5);
xlabel('t(秒)');ylabel('T(摄氏度)')
legend('L2=17.5')
axis([0 tt 35 45])
