%已知h1、h2，求解温度分布
clc;clear;close all;
 load FJ_2.mat
%有限差分法，隐式
L1=0.6;L2=6;L3=3.6;L4=5;
T_en=75;tt=5400;
h1=116.79;h2=8.374;
[T]=qiujie(L1,L2,L3,L4,h1,h2,T_en,tt);
%绘最终温度分布图
figure('Color','w')
x=[0:length(T(:,1))-1]/10;
plot(x,T(:,end)')
hold on
text(L1,T(L1*10+1,end),'|','color','r')
text(L1+L2,T((L1+L2)*10+1,end),'|','color','r')
text(L1+L2+L3,T((L1+L2+L3)*10+1,end),'|','color','r')
text(L1+L2+L3+L4,T((L1+L2+L3+L4)*10+1,end),'|','color','r')
grid on
xlabel('L(mm)');ylabel('T(°)')
%绘三维温度分布图
t=0:5400;
figure('Color','w')
surf(x,t,T')
shading interp
xlabel('L(mm)');ylabel('t(s)');zlabel('T(°)')
axis([0 15.2 0 5400 35 80 ])
%储存温度分布
% xlswrite('problem1.xlsx',T')
%输出各层交界处温度值
result=zeros(7,5);
m=[1,10*L1+1,10*(L1+L2)+1,10*(L1+L2+L3)+1,10*(L1+L2+L3+L4)+1];
for jj=1:5
  result(:,jj)=[T(m(jj),1),T(m(jj),51),T(m(jj),101),T(m(jj),151),T(m(jj),2501),T(m(jj),3501),T(m(jj),4501)];
end
