load data
x(1,:)=data(:,1)';y(1,:)=data(:,2)';save zuobiao x y;
a1=link(:,1)';a2=link(:,2)';save lujing a1 a2;
[o p]=size(data);
[m,n]=size(link);
for i=1:m
    juli(a1(i),a2(i))=sqrt((x(a1(i))-x(a2(i)))^2+(y(a1(i))-y(a2(i)))^2)*100;
end
juli=juli+juli';
juli(juli==0)=inf;
for i=1:o
 juli(i,i)=0;
end
save juli juli;