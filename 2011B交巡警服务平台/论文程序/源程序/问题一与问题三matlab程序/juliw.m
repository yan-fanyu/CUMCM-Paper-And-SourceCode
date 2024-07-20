function jieg=juliw(luxian1,ju,pingtai)
load zuobiao;%luxian1=jieg2;ju=ju2;
%luxian=[jieg3_1(:,[2 3]) jieg3_2];
k=1;
for i=1:size(luxian1,1)
    if luxian1(i,3)<=1
        luxian(k,:)=[luxian1(i,[1 2]) i];k=k+1;
    end
end
[pp1,pp]=size(luxian);
pp2=size(pingtai,2);
for i=1:pp2
 for j=1:pp1     
     w(i,j)=exp((max(ju(pingtai(i),luxian(j,1))+ju(pingtai(i),luxian(j,2)))-3000)/500)-1;
 end
end
     w(find(w<0))=0;
     %%0-1¹æ»®  
     
     for i=1:pp2
         for j=1:pp1
         f((i-1)*pp1+j,1)=w(i,j);
         end
     end     
         
     for i=1:pp1
     p=zeros(1,pp2*pp1);
     p(i:pp1:pp1*(pp2-1)+i)=1;
     xuqiu(i,:)=p;
     end
     Aep=xuqiu;
     [a,b]=size(xuqiu);
     Bep=ones(a,1);
     [X,a]=bintprog(f,[],[],Aep,Bep);
     %[X,a]=bintprog(f,[],[],Aep,Bep,X);
     aa=find(X==1);
     for i=1:pp1        
        xt=floor((aa(i)/(pp1+0.00001)));
        yt=aa(i)-pp1*xt;
        jieg(i,:)=[xt+1 luxian(yt,:) pingtai(xt+1)];        
     end     
