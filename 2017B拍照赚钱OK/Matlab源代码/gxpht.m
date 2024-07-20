clc;
clear all
close all;
g=[0,25,1,0,7,268,103,0,14,136,17,3,155,83,0,1,22,0,0,0];
gm=g./835;
x=[0,0,0,0,0,77,1362,1531,11,53,202,161,1059,691,116,48,45,44,0,0,];
xm=x./5400;
plot(gm,xm,'r*')
grid on
hold on
x=0:0.01:0.35
y=x
plot(x,y)
hold off
xlabel('任务供给密度','fontsize',10);
 ylabel('任务需求密度','fontsize',10);
figure
jd=[112.8 113.2 113.6 114.0 112.8 113.2 113.6 114.0 112.8 113.2 113.6 114.0 112.8 113.2 113.6 114.0 112.8 113.2 113.6 114.0];
wd=[22.6 22.6 22.6 22.6 23.0 23.0 23.0 23.0 23.4 23.4 23.4 23.4 23.8 23.8 23.8 23.8 24.2 24.2 24.2 24.2 ];
stem3(wd,jd,gm,'r^');
hold on
stem3(wd,jd,-xm,'b*');
hold on
legend('z>0供给密度','z<0需求密度')
x1=22.6:0.1:24.4
y1=112.5:0.1:114
[X,Y]=meshgrid(x1,y1)
Z=X*0;
%[x,y,z]=sphere(20)
surf(X,Y,Z);
shading interp
%set(gca,'ZLim',[-100 100])
% axis equal
alpha(0.6)
 xlabel('纬度','fontsize',20);
 ylabel('经度','fontsize',20);
 zlabel('任务供给、需求密度图','fontsize',10);
hold off
