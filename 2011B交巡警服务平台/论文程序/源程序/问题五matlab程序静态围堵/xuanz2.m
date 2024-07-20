%%4.7%%第二次选择程序
function [jd2,t]=xuanz2(jd1,n,v,x)
jd=caif(jd1,1);
jd2=xuanz1(jd,n,x);
if jd2(1,1)==0
    t=0;
else
load juli;
t=juli3(jd1,jd2)/1000/v*60;
end

