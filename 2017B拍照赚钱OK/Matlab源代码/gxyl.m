clc
clear all
close all
x=25:0.1:205;
y=1.1.*exp(-(x./125));
subplot(121)
plot(x,y);
xlabel('���񶨼�','fontsize',20);
ylabel('������','fontsize',20);
grid on
y1=-1.1*1/95.*exp(-(x./95));
subplot(122)
plot(x,y1);
xlabel('���񶨼�','fontsize',20);
ylabel('������������','fontsize',20);

grid on