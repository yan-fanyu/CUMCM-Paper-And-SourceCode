clc
clear all
close all
x=0:1:500;
y=exp(-(x/200).^2);
subplot(121)
plot(x,y);
grid on
xlabel('会员信誉值','fontsize',20);
ylabel('定价变化敏感度','fontsize',20);
y1=-1/100*(exp(-(x/200).^2));
subplot(122)
plot(x,y1);
grid on
xlabel('会员信誉值','fontsize',20);
ylabel('定价变化敏感度变化率','fontsize',20);
