clc
clear all
close all
x=0:1:500;
y=exp(-(x/200).^2);
subplot(121)
plot(x,y);
grid on
xlabel('��Ա����ֵ','fontsize',20);
ylabel('���۱仯���ж�','fontsize',20);
y1=-1/100*(exp(-(x/200).^2));
subplot(122)
plot(x,y1);
grid on
xlabel('��Ա����ֵ','fontsize',20);
ylabel('���۱仯���жȱ仯��','fontsize',20);
