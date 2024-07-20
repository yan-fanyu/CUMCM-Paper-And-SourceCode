clc;
clear all;
close all
means=[75 74.5 67.46 69.3 72 68.76 74 67.01 70.94 ];

li=means;
temp=[max(li);min(li)];
deno=temp(1,:)-temp(2,:);
[m,n]=size(li);
sj3=zeros(m,n);
while(m)
    sj3=(li(m,:)-temp(2,:))./deno;
    m=m-1;
end
x=[0.0032 0.0064 0.3802 0.1278 0.0032 0.0671 0.0032 0.3514 0.0575];
y=sj3;
plot(x,y,'r*');
hold on
x1=0:0.01:0.4;
y1=-52.73*x1.^3+39.49*x1.^2-9.7*x1+0.8858;
y2=-52.73*3*x1.^2+39.49*2*x1-9.7;
plot(x1,y1);
grid on
 xlabel('任务分布密度','fontsize',10);
 ylabel('任务定价归一化结果','fontsize',10);
 grid on
 hold off
  figure
 plot(x1,y2);
 grid on
 xlabel('任务分布密度','fontsize',10);
 ylabel('任务定价变化速率','fontsize',10);

