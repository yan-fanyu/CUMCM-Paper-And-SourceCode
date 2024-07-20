%%%%节点更新程序
load pingt;
load fananlv;
load zuidl;
pingt=pingt1';
x=1:92;
x0=1:20;
x0=pingt(x0);
v=60;
t=3;
N=1;
load fananlv;
load zuidl;
load juli;
fananlv2=[fananlv1';ones(1,928)]';
n=size(x0,2);
for i=1:n-1
    for j=i+1:n
        jd1=kaist(i,v,t,N);
        jd2=kaist(j,v,t,N);
        jd3=intersect(jd1,jd2);
        nn=size(jd3,2);
        if nn>1
            for k=1:nn-1
                for m=k+1:nn
                    if juli2(jd3(k),jd3(m))==1
                         a1=find(fananlv2(:,1)==jd3(k));
                         b1=find(fananlv2(:,2)==jd3(k));
                         a2=find(fananlv2(:,1)==jd3(m));
                         b2=find(fananlv2(:,2)==jd3(m));
                         jg1=[a1',b1'];
                         jg2=[a2',b2'];
                         jg=intersect(jg1,jg2);
                         fananlv2(jg,4)=fananlv2(jg,4)+1;
                    end
                end
            end
        end
    end
end
fananlv=fananlv2;

        
    

