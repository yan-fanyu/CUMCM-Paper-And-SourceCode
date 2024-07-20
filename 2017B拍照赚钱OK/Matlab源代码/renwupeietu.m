clc;
clear all;
close all
sj=xlsread('E:\数学建模\建模论文\2017CUMCM\B\附件二：会员信息数据2.xlsx',1,'B2:D1060');
% li=sj(:,3)
% temp=[max(li);min(li)];
% deno=temp(1,:)-temp(2,:);
% [m,n]=size(li);
% sj3=zeros(m,n);
% while(m)
%     sj3(m,:)=(li(m,:)-temp(2,:))./deno;
%     m=m-1;
% end
% % sj(:,3)=sj3;
% [x]=sj(:,1);
% [y]=sj(:,2);
% [z]=sj(:,3);
% figure
% scatter3(x,y,z);
%  xlabel('维度','fontsize',10);
%  ylabel('经度','fontsize',10);
%  zlabel('任务请求上限','fontsize',10);
% figure
%  nxdemand=linspace(min(x),max(x),100);
%  nydemand=linspace(min(y),max(y),100);
%  [x1,y1]=meshgrid(nxdemand,nydemand);
%  [X1,Y1,Z1]=griddata(x,y,z,x1,y1,'v4');
%  surf(X1,Y1,Z1);
%  xlabel('维度','fontsize',10);
%  ylabel('经度','fontsize',10);
%  zlabel('任务请求上限','fontsize',10);
%  figure
%  contourf(X1,Y1,Z1) %等高线图
%   xlabel('维度','fontsize',10);
%  ylabel('经度','fontsize',10);
%  colorbar
%  figure
%  pcolor(X1,Y1,Z1);
%  shading interp%伪彩色图

 
 
i=1;
j=1; 
t=1;
a=zeros(5,4);
   jd1=113;
   jd2=112.6;
   
sum=zeros(5,4);


while (i<=5)
    w1=22.8;
   w2=22.4;
    while (j<=4)
        while(t<size(sj,1)+1)
   if   ((sj(t,1)<w1&sj(t,1)>w2&sj(t,2)<jd1&sj(t,2)>jd2))
%        a(i,j)=a(i,j)+1;
       sum(i,j)=sum(i,j)+sj(t,3);
   end
   t=t+1;
        end
%         means(i,j)=sum/a(i,j);
      
t=1;
w1=w1+0.2;
w2=w2+0.2;
j=j+1;
    end
    j=1;
    i=i+1;
    
    jd1=jd1+0.4;
    jd2=jd2+0.4;
end
sum

