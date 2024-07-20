clc;
clear all;
close all
means=[73.74 75 73.36 68.42 69.20 71.54 68.76 72.30 71.77 67.29 71.92 75 69.98];

li=means;
temp=[max(li);min(li)];
deno=temp(1,:)-temp(2,:);
[m,n]=size(li);
sj3=zeros(m,n);
while(m)
    sj3=(li(m,:)-temp(2,:))./deno;
    m=m-1;
end
 x=[0.0299    0.0012    0.0084    0.3210    0.1234    0.0168    0.1629    0.0204    0.0036    0.1856    0.0994    0.0012    0.0263];
 y=sj3;

 plot(x,y,'r*');
 grid on
 hold on
 x1=0:0.01:0.35
 y1=33.7.*x1.^3-4.626.*x1.^2-4.027.*x1+0.7908;
 plot(x1,y1);
 xlabel('任务分布密度','fontsize',10);
 ylabel('任务定价归一化结果','fontsize',10);
 grid on
 hold off

