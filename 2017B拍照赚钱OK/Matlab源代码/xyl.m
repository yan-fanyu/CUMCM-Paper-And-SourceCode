clc
clear all
close all
x=25:0.1:205;
y=1-exp(-(x/82.35).^2);
subplot(121)
plot(x,y);
grid on
xlabel('���񶨼�','fontsize',20);
ylabel('������','fontsize',20);
dy=2*(1/82.35).*(x./82.35).*(exp(-(x/82.35).^2));
subplot(122)
plot(x,dy);
grid on
xlabel('���񶨼�','fontsize',20);
ylabel('������������','fontsize',20);
