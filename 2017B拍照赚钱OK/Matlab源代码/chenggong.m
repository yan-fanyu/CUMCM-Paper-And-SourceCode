clc;
clear all;
close all
sj=xlsread('E:\��ѧ��ģ\��ģ����\2017CUMCM\B\����һ���ѽ�����Ŀ�������ݸ�1.xls',1,'B315:D836');
li=sj(:,3)
temp=[max(li);min(li)];
deno=temp(1,:)-temp(2,:);
[m,n]=size(li);
sj3=zeros(m,n);
while(m)
    sj3(m,:)=(li(m,:)-temp(2,:))./deno;
    m=m-1;
end
sj(:,3)=sj3;
[x]=sj(:,1);
[y]=sj(:,2);
[z]=sj(:,3);
subplot(121)
scatter3(x,y,z); 
xlabel('γ��','fontsize',20);
 ylabel('����','fontsize',20);
 zlabel('���񶨼�','fontsize',20);
 

 nxdemand=linspace(min(x),max(x),100);
 nydemand=linspace(min(y),max(y),100);
 [x1,y1]=meshgrid(nxdemand,nydemand);
 [X1,Y1,Z1]=griddata(x,y,z,x1,y1,'v4');
%  surf(X1,Y1,Z1);

 subplot(122)
  contourf(X1,Y1,Z1) %�ȸ���ͼ
  xlabel('ά��','fontsize',20);
 ylabel('����','fontsize',20);