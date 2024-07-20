clc;
clear all;

sj=xlsread('E:\数学建模\建模论文\2017CUMCM\B\附件一：已结束项目任务数据改1.xls',1,'B2:E836');
i=1;
j=1; 
t=1;
a=zeros(5,4);
   jd1=113;
   jd2=112.6;
   sum=0;
   means=zeros(5,4);


while (i<=5)
    w1=22.8;
   w2=22.4;
    while (j<=4)
        while(t<size(sj,1)+1)
   if   ((sj(t,1)<w1&sj(t,1)>w2&sj(t,2)<jd1&sj(t,2)>jd2))
       a(i,j)=a(i,j)+1;
       sum=sum+sj(t,3);
   end
   t=t+1;
        end
        means(i,j)=sum/a(i,j);
        sum=0;
t=1;
w1=w1+0.4;
w2=w2+0.4;
j=j+1;
    end
    j=1;
    i=i+1;
    
    jd1=jd1+0.4;
    jd2=jd2+0.4;
end
a
% 
% li=means;
% temp=[max(li);min(li)];
% deno=temp(1,:)-temp(2,:);
% [m,n]=size(li);
% sj3=zeros(m,n);
% while(m)
%     sj3(m,:)=(li(m,:)-temp(2,:))./deno;
%     m=m-1;
% end
% sj3
% a
% 
% X_col=sum(means,1)./size(means,1);
% S_col=sqrt(sum((means-X_col(ones(size(means,1),1),:)).^2,1)./(size(means,1)-1));
% DataUnit=(means-X_col(ones(size(means,1),1),:))./S_col(ones(size(means,1),1),:);%标准化结果
% C_col=max(abs(DataUnit),[],1);
% DataOut=(DataUnit+C_col(ones(size(DataUnit,1),1),:))./(2*C_col(ones(size(DataUnit,1),1),:))%归一化后的结果
% means

