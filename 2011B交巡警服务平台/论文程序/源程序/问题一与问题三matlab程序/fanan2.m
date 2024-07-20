%%%·¸°¸ÂÊ¼ÆËã
clear;
load juli2;load jieg2;load fananlv
juli=juli2;luxian=[jieg2_1(:,[2 3]);jieg2_0(:,[2 3])];
[n1,n2]=size(luxian);
for i=1:n1
    z=juli(luxian(i,1),:);
    a(i)=fananlv(luxian(i,1))/(sum(z(find(z~=inf)))/2)*(juli2(luxian(i,1),luxian(i,2))/2);
    pp(i,:)=[luxian(i,:) a(i)];
end
for i=1:n1    
    z=juli(luxian(i,2),:);
    a(i)=fananlv(luxian(i,2))/(sum(z(find(z~=inf)))/2)*(juli2(luxian(i,1),luxian(i,2))/2);
    pp(i+n1,:)=[luxian(i,2:-1:1) a(i)];
end
fananlv_2=pp;
save fananlv_2 fananlv_2