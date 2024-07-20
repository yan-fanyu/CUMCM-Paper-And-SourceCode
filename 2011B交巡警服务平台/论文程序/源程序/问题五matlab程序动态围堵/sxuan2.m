function jd1=sxuan2(jd,x)
n=size(x,2);
nn=find(jd==x(n-1));
k=1;
jd1=0;
for i=1:size(jd,2)
    if i~=nn
        jd1(k)=jd(i);k=k+1;
    end
end
