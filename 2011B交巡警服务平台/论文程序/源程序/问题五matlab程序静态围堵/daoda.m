%%4.5%%交巡警到达节点程序
function [jj,nn2,jg]=daoda(jd2,t,nn)
if t~=0
load juli;
load pingt;
v=60;
jj=0;
nn1=0;
pingt=pingt';
[x,l]=size(pingt);
if nn==1||nn==2||nn==3
jd=caif(jd2,1);
[x1,l1]=size(jd);

for i=1:l
    for j=1:l1
        dd(i,j)=exp(juli3(pingt(i),jd(j))/1000);
    end
end
jg_1=guihua(dd);
jg_1=jg_1';
jg_1_x=pingt([jg_1(1,:)]);
jg_1_l=jd([jg_1(2,:)]);
jg1=[jg_1_x;jg_1_l];
for i=1:l1
    t1(i)=juli3(jg_1_x(i),jg_1_l(i))/1000/v*60;
end
tmax1=max(t1);
if tmax1<=t
    jj=1;
end
nn1=1;
end
%
if nn==2||nn==3&jj==0
jdd=caif(jd2,2);
[x1,l1]=size(jdd);

for i=1:l
    for j=1:l1
        dd(i,j)=exp(juli3(pingt(i),jdd(j))/1000);
    end
end
jg_2=guihua(dd);
jg_2=jg_2';
jg_2_x=pingt([jg_2(1,:)]);
jg_2_l=jdd([jg_2(2,:)]);
jg2=[jg_2_x;jg_2_l];
for i=1:l1
    t2(i)=juli3(jg_2_x(i),jg_2_l(i))/1000/v*60;
end
tmax2=max(t2);
if tmax2<=t
    jj=1;
end
nn1=2;
end
%
if nn==3&jj==0
jddd=caif(jd2,3);
[x1,l1]=size(jddd);

for i=1:l
    for j=1:l1
        dd(i,j)=exp(juli3(pingt(i),jddd(j))/1000);
    end
end
jg_3=guihua(dd);
jg_3=jg_3';
jg_3_x=pingt([jg_3(1,:)]);
jg_3_l=jddd([jg_3(2,:)]);
jg3=[jg_3_x;jg_3_l];
for i=1:l1
    t3(i)=juli3(jg_3_x(i),jg_3_l(i))/1000/v*60;
end
tmax3=max(t3);
if tmax3<=t
    jj=1;
end
nn1=3;
end
%
if nn1==1
    jg=jg1;nn2=1;
end
if nn1==2
    if tmax1>=tmax2
        jg=jg2;nn2=2;
    else
        jg=jg1;nn2=1;
    end
end
if nn1==3
    [a,b]=min([tmax1 tmax2 tmax3]);
    if b==1
        jg=jg1;nn2=1;
    else if b==2
            jg=jg2;nn2=2;
        else
            jg=jg3;nn2=3;
        end
    end
end
else
    jj=1;
end




