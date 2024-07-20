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
plot(sj(:,1),sj(:,2),'r*');
grid on
xlabel('纬度','fontsize',20);
 ylabel('经度','fontsize',20);


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

l=1;
while(l<size(sj,1)+1)
    if(sj(l,1)<22.7)
        m(l,1)=1;
    else  if(sj(l,1)<22.9)
        m(l,1)=2;
        else  if(sj(l,1)<23.1)
        m(l,1)=3;
            else if(sj(l,1)<23.3)
                m(l,1)=4;
                else 
                    m(l,1)=5;
                    
                end
            end
        end
    end
    l=l+1;
end
h=1;
while(h<size(sj,1)+1)
    if(sj(h,2)<113.2)
        m(h,2)=1;
    else  if(sj(h,2)<113.4)
        m(h,2)=2;
        else  if(sj(h,2)<113.6)
        m(h,2)=3;
            else if(sj(h,2)<113.8)
                m(h,2)=4;
                else if(sj(h,2)<114.0)
                    m(h,2)=5;
                    else if(sj(h,2)<114.2)
                            m(h,2)=6;
                        else if(sj(h,2)<114.4)
                                m(h,2)=7;
                            else
                                m(h,2)=8;
                            end
                        end
                    end
                    
                    
            end
        end
        end
    end
    h=h+1;
end

te=1;
sm=zeros(2066,1);
while te<=2066
    
sm(te,1)=a(m(te,2),m(te,1))./2066;

te=te+1;
end
x2=sm;
yn=18.68.*(-58.96*x2.^3+30.35*x2.^2-5.233*x2+0.7491+4);
figure 
x3=0:0.01:0.55
yn1=18.68.*(-58.96*x3.^3+30.35*x3.^2-5.233*x3+0.7491+4);
plot(x3,yn1);
grid on
axis([0 0.6 20 90]); 
xlabel('任务分布密度','fontsize',20);
 ylabel('任务定价','fontsize',20);

        
        
        