%灵敏度分析，分布对L1、L2、L3、L4进行
%L1、L2、L3、L4初始值与问一条件一致,变化程度：+-0.5
clc;clear;close all;
L1=0.6;L2=6;L3=3.6;L4=5;
h1=116.790;h2=8.374;
T_en=75;tt=5400;
x=-0.5:0.1:0.5;
[T]=qiujie(L1,L2,L3,L4,h1,h2,T_en,tt);
TT=T(end,end);
T_L1=zeros(11,1);jj=1;
for ii=L1-0.5:0.1:L1+0.5
[T]=qiujie(ii,L2,L3,L4,h1,h2,T_en,tt);
T_L1(jj)=(T(end,end)-TT)/TT*100;
jj=jj+1;
end
T_L2=zeros(11,1);jj=1;
for ii=L2-0.5:0.1:L2+0.5
[T]=qiujie(L1,ii,L3,L4,h1,h2,T_en,tt);
T_L2(jj)=(T(end,end)-TT)/TT*100;
jj=jj+1;
end
T_L3=zeros(11,1);jj=1;
for ii=L3-0.5:0.1:L3+0.5
[T]=qiujie(L1,L2,ii,L4,h1,h2,T_en,tt);
T_L3(jj)=(T(end,end)-TT)/TT*100;
jj=jj+1;
end
T_L4=zeros(11,1);jj=1;
for ii=L4-0.5:0.1:L4+0.5
[T]=qiujie(L1,L2,L3,ii,h1,h2,T_en,tt);
T_L4(jj)=(T(end,end)-TT)/TT*100;
jj=jj+1;
end
%绘图
figure('Color','w')
plot(x,T_L1,'k*',x,T_L2,'g*',x,T_L3,'b*',x,T_L4,'m*','MarkerSize',10)
hold on;
plot(x,T_L1,'k-',x,T_L2,'g:',x,T_L3,'b-.',x,T_L4,'m--','Linewidth',1.7)
axis([-0.5 0.5 -1.5 1.5])
legend('L1','L2','L3','L4','L1','L2','L3','L4')
grid on;
xlabel('增量(mm)');ylabel('变化率(%)');