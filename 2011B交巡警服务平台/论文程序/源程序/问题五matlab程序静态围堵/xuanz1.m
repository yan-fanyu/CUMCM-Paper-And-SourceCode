%%4.6%%第一次选择程序
function [jd1]=xuanz1(jd,n,x)
jd=sxuan(jd);
if sum(x)==0||size(x,2)<3
    jd=jd;
else
    jd=sxuan2(jd,x);
end
if jd(1,1)~=0
[x1,l1]=size(jd);
if n==1
load juli;
load jiekou;
jiekou=jiekou';
chukou=jiekou(14:30);
chukou=sxuan(chukou);
[x2,l2]=size(chukou);
for i=1:l2
    for j=1:l1
        dd(i,j)=juli3(chukou(i),jd(j));
    end
end
d1=min(dd);
max1=max(d1);min1=min(d1);c=max1-min1;d2=(max1-d1)/c;
sum1=sum(d2);d3=d2./sum1;
end

if n==2
    d3=ones(1,l1)./l1;    
end

lunpan(1)=d3(1);
for i=2:l1
lunpan(i)=lunpan(i-1)+d3(i);
end
jdd=rand;
a=find(lunpan>=jdd);
if size(a,2)==0
    a=l1;
end
jd1=jd(a(1));
else
    jd1=0;
end


    
