clc;
clear all;
close all;
sj=xlsread('E:\��ѧ��ģ\��ģ����\2017CUMCM\B\����һ���ѽ�����Ŀ�������ݸ�1.xls',1,'B2:D314');
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
 xlabel('����','fontsize',20);
 ylabel('ά��','fontsize',20);
 zlabel('����������','fontsize',20);

