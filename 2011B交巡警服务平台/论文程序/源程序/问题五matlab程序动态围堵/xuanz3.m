%%4.8%%第三次选择程序
function [jd1]=xuanz3(jd,jd2,t)
load juli;
[x,l]=size(jd);
v=60;m=1;
for i=1:l
    jdd=kaist(jd(i),v,t,0);
    [x1,l1]=size(jdd);
    for j=1:l1
        dd(j)=juli3(jdd(j),jd2);
    end
    [min1,minu]=min(dd);
    jd1(m)=jdd(minu);m=m+1;
    clear dd;
    clear jdd;
end
    
    