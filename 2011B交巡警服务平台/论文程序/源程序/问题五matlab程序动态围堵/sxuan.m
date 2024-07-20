%%4.3%%节点筛选程序
function [jd_1]=sxuan(jd)
load pingt;
pingt=pingt';
k=1;tt=0;
[x,l]=size(pingt);
[x1,l1]=size(jd);
for i=1:l
    for j=1:l1
        if pingt(i)==jd(j)
    tt(k)=j; k=k+1;
        end   
    end
end
if tt~=0
jd([tt])=0;
m=1;
for i=1:l1
    if jd(i)~=0
        jd_1(m)=jd(i); m=m+1;
    end   
end
else
    jd_1=jd;
end

        

