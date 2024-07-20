%给定参数
clear;
load pingt;
load fananlv;
load juli;
load rkmd;
load N1;
fananl=fananlv';
ii=N1;
if ii==1
load fananlv1;
x=1:92;
x0=1:20;
pingt=pingt1';
x0=pingt(x0);
end
if ii==2
load fananlv2;
x=93:165;
x0=21:28;
pingt=pingt1';
x0=pingt(x0);
x0=[x0 159 126 149];
qc=[98 97 99];
x0=setdiff(x0,qc);
end
if ii==3
load fananlv3;
x=166:319;
x0=29:45;
pingt=pingt1';
x0=pingt(x0);
x0=[x0 203 303 262 241 209];
qc=[166 172];
x0=setdiff(x0,qc);
end
if ii==4
load fananlv4;
x=320:371;
x0=46:54;
pingt=pingt1';
x0=pingt(x0);
x0=[x0 363 369 331 334];
qc=[325 324 323 328];
x0=setdiff(x0,qc);
end
if ii==5
load fananlv5;
x=372:474;
x0=55:69;
pingt=pingt1';
x0=pingt(x0);
end
if ii==6
load fananlv6;
x=[475:582];
x0=70:80;
pingt=pingt1';
x0=pingt(x0);
x0=[x0 505 523 541 578 576 569];
qc=[480 484 485 479];
x0=setdiff(x0,qc);
end
if ii==7
load fananlvS;
x=1:582;
x0=1:80;
pingt=pingt1';
x0=pingt(x0);
end
v=60;
t=3;
N=1;
jdok=[];
%更新区域路径事故率
fananlv(:,5)=fananlv(:,3)./fananlv(:,4);
%取点循环
n=size(x0,2);
for i=1:n
    %给出服务量p,给出覆盖距离d
    p=0;d=0;
    jd=kaist(x0(i),v,t,N);
    jdok=union(jdok,jd);
    jd=intersect(jd,x);
    jd=[jd,x0(n)];
    nn=size(jd,2);
        if nn>1
            for k=1:nn-1
                for m=k+1:nn
                    if juli2(jd(k),jd(m))==1
                        a1=find(fananlv(:,1)==jd(k));
                        b1=find(fananlv(:,2)==jd(k));
                        a2=find(fananlv(:,1)==jd(m));
                        b2=find(fananlv(:,2)==jd(m));
                         jg1=[a1',b1'];
                         jg2=[a2',b2'];
                         jg=intersect(jg1,jg2);
                         p=p+fananlv(jg,5);
                         d=d+juli(jd(k),jd(m));
                    end
                end
            end
        end
        pp(i)=p;
        dd(i)=d/1000;
        
        
        %给出成本满意度c       
        jd1=kaist(x0(i),v,t,0);
        jd1=intersect(jd1,x);
        jdd1=intersect(jd,jd1);
        jdd=setdiff(jd,jdd1);
        jdd=setdiff(jdd,x0(n));
        nn1=size(jdd,2);
        dd2=[];
        for k1=1:nn1
            dd2(k1)=juli3(x0(i),jdd(k1));
        end
        if size(dd2,2)==0
        dd3=0;
        else
        dd3=dd2-3000;
        end
        %取定评价方式
        if pjfs==1
        cc(i)=sum(dd3/1000);
        else
        cc(i)=sum(exp(dd3/1000)/15);
        end
end
%平台服务评价
p1(ii)=mean(pp);
p2(ii)=var(pp);
m1(ii)=mean(cc);
m2(ii)=var(cc);
d1(ii)=mean(dd);
d2(ii)=var(dd);
%未覆盖损失
jdw1=intersect(jdok,x);
jdw=setdiff(x,jdw1);
su1=0;
if size(jdw,1)~=0
    su1=su1+sum(fananl([jdw]));
end
su(ii)=su1;
%人口密度
r(ii)=rkmd(ii);
jgg=[p1' p2' m1' m2' d1' d2' su' r'];


    
    