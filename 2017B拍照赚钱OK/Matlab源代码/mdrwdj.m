clc
clear all
close all
x1=0:0.01:0.3;
y=153.57.*(-58.96*x1.^3+30.35*x1.^2-5.233*x1+0.7491);
plot(x1,y);
grid on
xlabel('任务分布密度','fontsize',20);
 ylabel('任务定价','fontsize',20);
 x2=0:0.05:0.3
 y=153.57.*(-58.96*x2.^3+30.35*x2.^2-5.233*x2+0.7491)