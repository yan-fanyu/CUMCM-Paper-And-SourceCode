clear;clf;load juli;load zuobiao;load lujing;load pingt;load jiekou;
juli2=juli;k=1;
%%×öµãÍ¼
xx=x;yy=y;plot(xx(21:582),yy(21:582),'p');hold on;
plot(x(pingt'),y(pingt'),'ro'); hold on;
plot(x(jiekou'),y(jiekou'),'r*');hold on;
pingt=pingt';
%for i=1:size(pingt,2)
    %juli2(pingt(i),:)=inf;
    %juli2(:,pingt(i))=inf;
%end    
for i=1:582
    for j=1:582
        %%»æÍ¼
        if j==i
            juli2(i,j)=0;
        end
        if juli2(i,j)~=inf
            xl=[xx(i) xx(j)];yl=[yy(i) yy(j)];
            plot(xl,yl);
            hold on;
        end
    end
end
a=juli2;
biaodian

