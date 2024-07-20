%%4.4%%节点更新及翻转程序
function fanzhuan(w,th,da)
tth=w(th,:);w(th,:)=w(1,:);w(1,:)=tth;
tth1=w(:,th);w(:,th)=w(:,1);w(:,1)=tth1;
n=size(w,1);
w1=w(1,:);
l=0;
z=0;   
%赋初值
   for i=1:n
      l(i)=w1(i);
      z(i)=1;
   end
   s=[];
   s(1)=1;
   u=s(1);
   k=1;
while k<n
   % 更新 l(v) 和 z(v)
   for i=1:n
      for j=1:k
      if i~=s(j) 
         if l(i)>l(u)+w(u,i)
            l(i)=l(u)+w(u,i);
            z(i)=u;
         end
      end
      end
   end
      
   %求v*
   ll=l;
   for i=1:n
      for j=1:k
         if i~=s(j)
            ll(i)=ll(i);
         else 
            ll(i)=inf;
         end
      end
   end
   
   lv=inf;
   for i=1:n
      if ll(i)<lv
         lv=ll(i);
         v=i;
      end
   end     
   lv;
   v;
   
  s(k+1)=v;
  k=k+1;
  u=s(k);
  
end
th1=th;
save fanz z l th1