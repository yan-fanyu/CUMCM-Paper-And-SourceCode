clc;
clear all;
close all
means=[73.69 75 72.9 69.19 69.13 71.5 68.77 72.19 71.67 67.98 71.92 75 65.63 ];

li=means;
temp=[max(li);min(li)];
deno=temp(1,:)-temp(2,:);
[m,n]=size(li);
sj3=zeros(m,n);
while(m)
    sj3=(li(m,:)-temp(2,:))./deno;
    m=m-1;
end
x=[0.046 0.0019 0.0096 0.2845 0.1207 0.0249 0.2203 0.0307 0.0057 0.0862 0.159 0.0019 0.0077];
y=sj3
plot(x,y,'r*');
hold on
x1=0:0.01:0.3;
y1=-58.96*x1.^3+30.35*x1.^2-5.233*x1+0.7491;
y2=-58.96*3*x1.^2+30.35*2*x1-5.233;
plot(x1,y1);
grid on
 xlabel('任务分布密度','fontsize',10);
 ylabel('任务定价归一化结果','fontsize',10);
 hold off
 figure
 plot(x1,y2);
 grid on
 xlabel('任务分布密度','fontsize',10);
 ylabel('任务定价变化速率','fontsize',10);
 
 
 
 
