%%%·¸°¸ÂÊ¼ÆËã
function  fananlv1=fanan1(jieg)
load juli2;load fananlv
fananlv(93:121)=0;
juli=juli2;
[n1,n2]=size(jieg);
luxian=jieg(:,[1 2]);
for i=1:n1      
    z=juli(luxian(i,1),:);
    a(i)=(fananlv(luxian(i,1))/(sum(z(find(z~=inf))))+fananlv(luxian(i,2))/sum(z(find(z~=inf))))*...
    juli2(luxian(i,1),luxian(i,2))/2;
    if fananlv(luxian(i,1))==0 | fananlv(luxian(i,1))==0
        a(i)=a(i)*2;
    end
    pp(i,:)=[jieg(i,:) a(i)];
end
fananlv1=pp;
save fananlv1 fananlv1

