%%%%模拟退火算法在第一问中的求解二次规划问题
function [jiegq fanan Sum]=tuih(jieg2,pingtai,fazhi)
Sum=inf;load fanan;load fananlv1;load ju2;%load aaaa
[mm,nn]=size(jieg2);
mm1=size(pingtai,2);k=1;
for i=1:mm
    if jieg2(i,3)==2   
        luxian(k,:)=[jieg2(i,[1 2]) i ju2(jieg2(i,1),jieg2(i,2))];
        %luxian(k,4)=exp((luxian(k,4)-3000)/500);        
        fananlv2(k,:)=fananlv1(i,4);k=k+1;
    end
end
save fananlv2 fananlv2
mm2=k-1;
for i=1:mm1
    for j=1:mm2
        ss(i,j)=min(ju2(i,luxian(j,1)),ju2(i,luxian(j,2)))+ju2(luxian(j,1),luxian(j,2));
    end
end
%t=zeros(140,20);
for j=1:mm2
    k(j)=1;
     for i=1:mm1         
       if max(ju2(pingtai(i),luxian(j,1)),ju2(pingtai(i),luxian(j,2)))<3000
        t(j,k(j))=i;
        k(j)=k(j)+1;                
       end
    end 
end  
pp1=mm2;

%%设置初始状态b
clear xuan0;
while Sum==inf
    xuanz=zeros(1,mm1*mm2);
    for i=1:mm2
       aa=randperm(k(i)-1); a(i)=t(i,aa(1));
       xuanz((a(i)-1)*mm2+i)=1;
    end
    if manyi(xuanz)<=fazhi %%以满意函数为目标多次得到的经验值
       temp=mubiao(xuanz,ss);
       if temp<Sum 
           xuanz0=xuanz;Sum=temp;%SS(1)=Sum;XX(1,:)=xuanz0
       end 
    end
end
e=0.1^3;at=0.999;T=1;tt=2; 
%退火过程 
for kk=1:200000 
         xuanz=zeros(1,mm1*mm2);
          for i=1:140
         aa=randperm(k(i)-1); a(i)=t(i,aa(1));
         xuanz((a(i)-1)*mm2+i)=1;
          end   
         if manyi(xuanz)<fazhi
        df=mubiao(xuanz,ss)-Sum;
   %接受准则 
     if df<0 
        xuanz0=xuanz;
        Sum=Sum+df;
        %SS(t)=Sum;
        %XX(t,:)=xuanz0;t=t+1;
     elseif exp(-df/T)>rand(1) 
            xuanz0=xuanz;       
            Sum=Sum+df;      
     end
         end
       T=T*at; 
      if T<e 
          break; 
      end 
      
end 
    [y,fanan]=manyi(xuanz0)
    [Sum,S1]=mubiao(xuanz0,ss);
    X=xuanz0';
    ab=find(X==1);
     for i=1:pp1        
        xt=floor((ab(i)/(pp1+0.00001)));
        yt=ab(i)-pp1*xt;
        jiegq(i,:)=[xt+1 luxian(yt,:)];        
     end 