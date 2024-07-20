clc
clear all
close all
x=25:0.01:125;
y1=1.1*exp(-(x/125));
y2=1*exp(-(x/112.5));
y3=1.2*exp(-(x/137.5));
subplot(121)
plot(x,y1,'b');
hold on
plot(x,y2,'r');
hold on
plot(x,y3,'g');
hold off
grid on
legend('c=1.1,b=125','c=1,b=112.5','c=1.2,b=137.5');
  xlabel('任务定价','fontsize',10);
 ylabel('任务难易度吸引力','fontsize',10);
 y4=-1.1*(1/125)*exp(-(x/125));
y5=-1*(1/112.5)*exp(-(x/112.5));
y6=-1.2*(1/137.5)*exp(-(x/137.5));
subplot(122)
plot(x,y4,'b');
hold on
plot(x,y5,'r');
hold on
plot(x,y6,'g');
hold off
grid on
legend('c=1.1,b=125','c=1,b=112.5','c=1.2,b=137.5');
  xlabel('任务定价','fontsize',10);
 ylabel('任务难易度吸引力变化率','fontsize',10);
 
 