%%%作图程序：最终的路线隶属分配图
function zuitu(jieg1,jieg2,pingtai)
load zuobiao2;m=size(x,1);
plot(x(pingtai),y(pingtai),'ro');hold on
mt1=size(jieg1,1);
yans1=['r' 'b' 'g' 'm' 'y'...
'r' 'b' 'g' 'm' 'y'...
'r' 'b' 'g' 'm' 'y'...
'r' 'b' 'g' 'm' 'y'...
'r' 'b' 'g' 'm' 'y'];
for i=1:mt1
         xll=[x(jieg1(i,2)) x(jieg1(i,3))];
         yll=[y(jieg1(i,2)) y(jieg1(i,3))];
         plot(xll,yll,yans1(mod(jieg1(i,1),5)+1));
end 
mt2=size(jieg2,1);
for i=1:mt2
         xll=[x(jieg2(i,2)) x(jieg2(i,3))];
         yll=[y(jieg2(i,2)) y(jieg2(i,3))];
         plot(xll,yll,yans1(mod(jieg2(i,1),5)+1));
end 
biaodian