%%%zongtipingjia.m给出各分区包括全市的总体评价与改进紧迫度
clc;clear;
load pinj;
m=1;
for ss=1:3
    if ss==1
        pingjia=pinj';
    end
    if ss==2
        pingjia=pinj2';
    end
    if ss==3
        pingjia=pinj3';
    end       
[x,l]=size(pingjia);
for tt=1:2
for i=1:x-1
    if tt==1
        pp=pingjia(i,:).*pingjia(x,:);
    else
    pp=pingjia(i,:);
    end
    max1=max(pp);min1=min(pp);c1=max1-min1;pp1(i,:)=(pp-min1)./c1;
end
jieguo=sum(pp1);
[a,b]=sort(jieguo);
jieguo1(m,:)=jieguo;
paixu(m,:)=b;m=m+1;
end
end
paixu