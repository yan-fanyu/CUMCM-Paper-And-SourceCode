function zuobiao=guihua(dd)
[l,l1]=size(dd);
Aeq1=zeros(l1,l1*l);
for i=1:l1
Aeq1(i,i:l1:l1*(l-1)+i)=1;
Beq1(i,1)=1;
end
Aeq2=zeros(l,l1*l);
for i=1:l
Aeq2(i,l1*(i-1)+1:l1*i)=1;
Beq2(i,1)=1;
end
for i=1:l
    for j=1:l1
        f(l1*(i-1)+j,1)=dd(i,j);
    end
end
[x ff]=bintprog(f,Aeq2,Beq2,Aeq1,Beq1);
aa=find(x==1);
for i=1:l1
    x1=floor(aa(i)/(l1+0.0001));
    y1=aa(i)-x1*l1;
    zuobiao(i,:)=[x1+1 y1];
end
