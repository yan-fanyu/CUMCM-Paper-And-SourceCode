load zuobiao;
k=1; load fananlv;load aaaa;
for i=1:169
    if jieg2(i,3)==2
        luxian(k,:)=[jieg2(i,[1 2]) i];
        fananlv1(k,:)=fananlv(i,4);k=k+1;
    end
end
save luxian luxian;
    [pp1,pp]=size(luxian); save pp1 pp1;
     for i=1:pp1
     p=zeros(1,20*pp1);
     p(i:pp1:pp1*19+i)=1;
     xuqiu(i,:)=p;
     end
     
      for i=1:20         
         f((i-1)*pp1+1:i*pp1,1)=fananlv1;       
     end              
     Aep=xuqiu;
     [a,b]=size(xuqiu);
     Bep=ones(a,1);
     %%x0=zeros(20*pp1,1);
     %%x0(1:pp1)=1;xm=zeros(20*pp1,1);xM=ones(20*pp1,1);intlist=ones(20*pp1,1);
     %%ix=(intlist==1);xm(ix)=ceil(xm(ix));xM(ix)=floor(xM(ix));
    %%[aa,bb,cc]=bnb20('fun2',x0,intlist,xm,xM,[],[],Aep,Bep);
     [X,a]=bintprog(f,[],[],Aep,Bep);     
    % if length(eer)==0,x=round(x(xi)),end
     aa=find(X==1);
     for i=1:pp1        
        xt=floor((aa(i)/(pp1+0.00001)));
        yt=aa(i)-pp1*xt;
        jiegq(i,:)=[xt+1 luxian(yt,:)];        
     end     
     
   