clc
clear all
close all
x=35:0.1:125;
y=1-exp(-(x/72.07).^2);
subplot(121)
plot(x,y);
grid on
xlabel('���񶨼�','fontsize',20);
ylabel('������','fontsize',20);
dy=2*(1/72.07).*(x./72.07).*(exp(-(x/72.07).^2));
subplot(122)
plot(x,dy);
grid on
xlabel('���񶨼�','fontsize',20);
ylabel('������������','fontsize',20);



figure
x1=0:0.01:0.3;
dj=397.76*(-58.96*x1.^3+30.35*x1.^2-5.233*x1+0.7491);
plot(x1,dj);
grid on
xlabel('����ֲ��ܶ�','fontsize',20);
 ylabel('��������������','fontsize',20);
 x2=0:0.01:0.3
 y=397.76.*(-58.96*x2.^3+30.35*x2.^2-5.233*x2+0.7491)