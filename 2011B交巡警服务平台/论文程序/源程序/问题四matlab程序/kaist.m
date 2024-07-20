%%%%%%%kaist评价指标程序
function [jd]=kaist(n,v,t,s)
load zuidl;
ss=v*1000/60*t;
p=0;
jd=[];
jd_1=[];
if s==1    
    jd1=find(lc(n,:)<=ss);
    [x,l]=size(jd1);
    for i=1:l
        if jd1(i)==1&p~=i
            jd1(i)=n;
            jd1_1=caif(jd1(i),1);
            jd_1=union(jd_1,jd1_1);
            p=i;
        end
        if jd1(i)==n&p~=i
            jd1(i)=1;
            jd1_1=caif(jd1(i),1);
            jd_1=union(jd_1,jd1_1);
            p=i;
        end
        jd1_1=caif(jd1(i),1);
        jd_1=union(jd_1,jd1_1);
    end
    jd=union(jd_1,jd1);
end
if s==0
    jd1=find(lc(n,:)<=ss);
    [x,l]=size(jd1);
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
    jd=jd1;
end
    
    