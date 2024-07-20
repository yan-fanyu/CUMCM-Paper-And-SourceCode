clc;
clear all;
close all

sj=xlsread('E:\数学建模\建模论文\2017CUMCM\B\附件三：新项目任务数据.xls',1,'B2:C2067');
i=1;
j=1; 
t=1;
a=zeros(8,5);
   jd1=113.2;
   jd2=113;
%    sum=0;
%    means=zeros(8,5);


while (i<=8)
    w1=22.7;
   w2=22.5;
    while (j<=5)
        while(t<size(sj,1)+1)
   if   ((sj(t,1)<w1&sj(t,1)>w2&sj(t,2)<jd1&sj(t,2)>jd2))
       a(i,j)=a(i,j)+1;
%        sum=sum+sj(t,3);
   end
   t=t+1;
        end
%         means(i,j)=sum/a(i,j);
%         sum=0;
t=1;
w1=w1+0.2;
w2=w2+0.2;
j=j+1;
    end
    j=1;
    i=i+1;
    
    jd1=jd1+0.2;
    jd2=jd2+0.2;
end
mi=a/2066;
