clc;
clear all;
close all

sj=xlsread('E:\数学建模\建模论文\2017CUMCM\B\附件一：已结束项目任务数据改1.xls',1,'B2:E836');
i=1;
j=1; 
t=1;
a=zeros(5,4);
   jd1=113;
   jd2=112.6;
%    sum=0;
%    means=zeros(5,4);


while (i<=5)
    w1=22.8;
   w2=22.4;
    while (j<=4)
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
w1=w1+0.4;
w2=w2+0.4;
j=j+1;
    end
    j=1;
    i=i+1;
    
    jd1=jd1+0.4;
    jd2=jd2+0.4;
end

l=1;
while(l<size(sj,1)+1)
    if(sj(l,1)<22.8)
        m(l,1)=1;
    else  if(sj(l,1)<23.2)
        m(l,1)=2;
        else  if(sj(l,1)<23.6)
        m(l,1)=3;
            else 
                m(l,1)=4;
            end
        end
    end
    l=l+1;
end
h=1;
while(h<size(sj,1)+1)
    if(sj(h,2)<113)
        m(h,2)=1;
    else  if(sj(h,2)<113.4)
        m(h,2)=2;
        else  if(sj(h,2)<113.8)
        m(h,2)=3;
            else if(sj(h,2)<114.2)
                m(h,2)=4;
                else 
                    m(h,2)=5;
            end
        end
        end
    end
    h=h+1;
end

te=1;
sm=zeros(835,1);
while te<=835
    
sm(te,1)=a(m(te,2),m(te,1))./835;

te=te+1;
end
x2=sm;
yn=153.57.*(-58.96*x2.^3+30.35*x2.^2-5.233*x2+0.7491);


        
        
        