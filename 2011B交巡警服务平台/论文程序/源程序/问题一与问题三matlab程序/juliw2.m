clear;%%0-1规划
load ju;load zuobiao
for i=1:20
 for j=21:92
     n=j-20;
     w(i,n)=exp((ju(i,j)-3000)/500)-1;
 end
end
     w(find(w<0))=0;
     %%0-1规划  
     
     for i=1:20
         for j=1:72
         f((i-1)*72+j,1)=w(i,j);
         end
     end
       
         
     for i=1:72
     p=zeros(1,20*72);
     p(i:72:72*19+i)=1;
     xuqiu(i,:)=p;
     end
     Aep=xuqiu;
     [a,b]=size(xuqiu);
     Bep=ones(a,1);
     [X,a]=bintprog(f,[],[],Aep,Bep);
    % [X,a]=bintprog(f,[],[],Aep,Bep,X);
     aa=find(X==1);
     for i=1:72        
        xt=floor(aa(i)/72.0001);
        yt=aa(i)-72*xt;
        jieg=[xt+1 yt+20 w(xt+1,yt)]
     end
     save jieg jieg