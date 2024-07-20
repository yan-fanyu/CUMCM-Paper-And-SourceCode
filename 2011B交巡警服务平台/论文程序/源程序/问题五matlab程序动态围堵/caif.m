function [jd3]=caif(jd,n)
load juli;
jd3_2=[];
jd3_3=[];
if n==1||n==2||n==3
    jd3_1=find(juli2(jd,:)~=0);
    jd3=jd3_1;
end
if n==2||n==3
    [x,l]=size(jd3_1);
    for i=1:l
        jd3_2_1=find(juli2(jd3_1(i),:)~=0);
        jd3_2=union(jd3_2,jd3_2_1);
    end
    jd3=jd3_2;
end
if n==3
    [x,l]=size(jd3_2);
    for i=1:l
        jd3_3_1=find(juli2(jd3_2(i),:)~=0);
        jd3_3=union(jd3_3,jd3_3_1);
    end
    jd3=jd3_3;
end