function zuotu(zuobiao,juli2,jieg)
load lujing;load jiekou;
%%做点图
m=size(zuobiao,1);
xx=x(1:m);yy=y(1:m);plot(xx(21:m),yy(21:m),'p');hold on;
plot(x(1:20),y(1:20),'ro'); hold on;plot(x(jiekou'),y(jiekou'),'r*');hold on
for i=1:m
    for j=1:m
        %%绘图
        if juli2(i,j)~=inf
            xl=[xx(i) xx(j)];yl=[yy(i) yy(j)];
            plot(xl,yl);%text((x(i)+x(j))/2,(y(i)+y(j))/2,num2str(floor(juli2(i,j)/100)));
            hold on;
        end
        %%赛选
        %if ju(i,j)<=3000 & i~=j & i<=20
                %shuxing(k,:)=[i j ju(i,j)];
               % k=k+1;
         %end        
    end
end
mt=size(jieg,1);
for i=1:mt
    if jieg(i,3)<=1
         xll=[x(jieg3(i,1)) x(jieg3_1(i,2))];
         yll=[y(jieg3_1(i,1)) y(jieg3_1(i,2))];
         plot(xll,yll,'r');hold on;
end   
         hold off
end
%biaodian
