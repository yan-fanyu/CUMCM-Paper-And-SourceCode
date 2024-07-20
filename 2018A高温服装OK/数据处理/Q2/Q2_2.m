%不同L2厚度对人体温度的影响
clc;clear;close all;
L1=0.6;L3=3.6;L4=5.5;
h1=116.790;h2=8.374;
T_en=65;tt=3600;
L2=[0.6,6,12,18,25];
[T1]=qiujie(L1,L2(1),L3,L4,h1,h2,T_en,tt);
[T2]=qiujie(L1,L2(2),L3,L4,h1,h2,T_en,tt);
[T3]=qiujie(L1,L2(3),L3,L4,h1,h2,T_en,tt);
[T4]=qiujie(L1,L2(4),L3,L4,h1,h2,T_en,tt);
[T5]=qiujie(L1,L2(5),L3,L4,h1,h2,T_en,tt);
%提取人体表面温度
TT1=T1(end,:);
TT2=T2(end,:);
TT3=T3(end,:);
TT4=T4(end,:);
TT5=T5(end,:);
x=0:tt;
figure('Color','w')
plot(x,TT1,'c-',x,TT2,'g:',x,TT3,'b',x,TT4,'m--',x,TT5,'r-.','Linewidth',1.7)
legend('L2=0.6mm','L2=6.0mm','L2=12mm','L2=18mm','L2=25mm')
axis([0 3600 36 46])
xlabel('t(秒)');ylabel('T(摄氏度)')