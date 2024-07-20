%%%fangz.m源程序代码：得出罪犯逃跑速度为60Km/h时的一种模拟结果及围堵方案
%%%改变m文件中的V，即可改变罪犯的逃跑速度，并得到对应的围堵方案
%%仿真主程序
%function xunjing=fangz
%仿真主程序
clear;
%给定罪犯速度
v=60;
%给定类型
N=1;
%给定拆分次数
N1=3;
%
load pingt;
pingt=pingt1;
save pingt pingt pingt1;
jd=kaist(32,v,3,1);
jd1=xuanz1(jd,N,[0,0,0]);
jj=0;
k1=1;
k2=1;
k=1;
xunjing.jdfrom(1,[1:30])=zeros(1,30);jdto(1,1:30)=zeros(1,30); 
while jj==0
    taofangform=jd1
    zuifrom(k1)=jd1;k1=k1+1;
    [jd2,t]=xuanz2(jd1,N,v,zuifrom);
    taofangto=jd2
    zuifto(k2)=jd2;k2=k2+1;
    if t==0
        break;jj=1;
    end
    [jj,nn,jg]=daoda(jd2,t,N1);
    aaa=size(jg,2);
    xunjing.jdfrom(k,1:aaa)=jg(1,:);
    jingchaform=jg(1,:)
    k=k+1; 
    jd3=xuanz3(jg(1,:),jd2,t);
    jingchato=jd3
    bbb=size(jd3,2);
    jdto(1,1:bbb)=jd3;    
    if jj==0
    chuchun;
    jd1=jd2;
    end
end
