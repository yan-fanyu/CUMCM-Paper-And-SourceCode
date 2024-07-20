clc;
clear all;
close all;
sj=xlsread('E:\数学建模\建模论文\2017CUMCM\B\附件一：已结束项目任务数据改1.xls',1,'B2:D314');
[x]=sj(:,1);
[y]=sj(:,2);
[z]=sj(:,3);
figure
scatter3(x,y,z);
figure
 nxdemand=linspace(min(x),max(x),100);
 nydemand=linspace(min(y),max(y),100);
 [x1,y1]=meshgrid(nxdemand,nydemand);
 [X1,Y1,Z1]=griddata(x,y,z,x1,y1,'v4');
 surf(X1,Y1,Z1);
 xlabel('经度','fontsize',20);
 ylabel('维度','fontsize',20);
 zlabel('任务完成情况','fontsize',20);

