clc;
clear all;
close all
sj=xlsread('E:\数学建模\建模论文\2017CUMCM\B\附件一：已结束项目任务数据改1.xls',1,'B2:D314');
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
means,a

