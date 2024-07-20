%%4.2%%最短路线程序
function [lj cd]=zuiduanlu(w,th,da)
   load fanz;
   if th1~=th
   fanzhuan(w,th,da);
   load fanz;
   end  
m=1;
if da==1
da1=th;
while z(da1)~=1
    lj(m)=z(da1);
    da1=z(da1);
    m=m+1;
end
end
if da==th
    da1=1;
    lj=th;
end
if da~=th&da~=1
    da1=da;
    while z(da1)~=1
    lj(m)=z(da1);
    da1=z(da1);
    m=m+1;
    end
end

    
lj(find(lj==th))=1;
lj(find(lj==1))=th;
if da==th
    da=1;
    cd=l(da);
else
    cd=l(da);
end
lj;
cd;

   




   