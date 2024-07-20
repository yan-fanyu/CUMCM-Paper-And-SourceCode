function [jd1]=xiaozhen(jd1,n)
[x,l]=size(jd1);
p=0;
    for i=1:l
        if jd1(i)==1&p~=i
            jd1(i)=n;
            p=i;
        end
        if jd1(i)==n&p~=i
           jd1(i)=1;
           p=i;
        end
    end