%%%0和1类节点所在路线的中点划分程序
function jieg=zhongdian(jieg)
load juli;juli2=juli(1:92,1:92);load zuobiao
load fananlv_2;load luxian;
[m,n]=size(jieg);z=92;
for i=1:m
    if jieg(i,3)<=1  
        z=z+1;
    juli2(jieg(i,1),z)=1/2*juli(jieg(i,1),jieg(i,2));    
    juli2(jieg(i,2),z)=1/2*juli(jieg(i,1),jieg(i,2));  
    juli2(z,jieg(i,1))=1/2*juli(jieg(i,1),jieg(i,2));    
    juli2(z,jieg(i,2))=1/2*juli(jieg(i,1),jieg(i,2)); 
    x(z)=0.5*(x(jieg(i,1))+x(jieg(i,2)));
    y(z)=0.5*(y(jieg(i,1))+y(jieg(i,2)));     
    jieg1=[jieg(i,1) z jieg(i,3)];
    jieg(m+z-92,:)=[z jieg(i,2) 1]; 
    jieg(i,:)=jieg1;
    end
end
juli2(juli2==0)=inf;
for i=1:z
 juli2(i,i)=0;
end
ju2=floyd(juli2);
save zuobiao2 x y;
save ju2 ju2; save juli2 juli2
save fananlv2 fananlv_2;