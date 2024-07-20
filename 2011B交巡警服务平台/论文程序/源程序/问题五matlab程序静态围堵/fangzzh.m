%%%fangzzh.m给出罪犯逃跑速度为60Km/h时的围堵方案
%%%改变m文件中的V，即可改变罪犯的逃跑速度，并得到对应的围堵方案
%最坏仿真主程序
clear;
load juli;
load pingt;
pingt=pingt';
%给定罪犯速度
v=60;
%给出结束条件
js=0;
%时间循环
t=3;
while js==0&&t<=53
j=1;
clear jdz limd;
%给出需封堵的节点
cck=[151,153,177,202,203,264,317,325,328,332,362,387,418,483,541,572,578];
limd=kaist(32,v,t,0);
[x1,l2]=size(limd);
for i=1:l2
    jdc=caif(limd(i),1);
    jdh=union(jdc,limd);
    if size(jdh,2)~=size(limd,2)||size(find(cck==limd(i)),2)~=0
        jdz(j)=limd(i);j=j+1;
    end
end
%进行封堵
[x,l]=size(pingt);
[x2,l1]=size(jdz);
clear dd;
for i=1:l
    for j=1:l1
        dd(i,j)=exp(juli3(pingt(i),jdz(j))/1000);
    end
end
clear jg_1 jg_1_x jg_1_l;
jg_1=guihua(dd);
jg_1=jg_1';
jg_1_x=pingt([jg_1(1,:)]);
jg_1_l=jdz([jg_1(2,:)]);
jg1=[jg_1_x;jg_1_l];
clear t1;
for i=1:l1
    t1(i)=juli3(jg_1_x(i),jg_1_l(i))/1000/60*60+3;
end
tmax1=max(t1);
if tmax1<=t
    js=1;jg=jg1;
end
t=t+0.1;
t,js
end
jg
