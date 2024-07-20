R=load('shangquan.txt');
Rmean=mean(R);
Rstd=std(R);
ZR=(R-Rmean)./Rstd;
weights=real(EntropyWeight(ZR));
function weights = EntropyWeight(R)
% 熵权法求指标权重,R为输入矩阵,返回权重向量weights
[rows,cols]=size(R); 
k=1/log(rows);        
f=zeros(rows,cols);   
sumBycols=sum(R,1);  
% 计算fij
for i=1:rows
  for j=1:cols
      f(i,j)=R(i,j)./sumBycols(1,j);
  end
end
lnfij=zeros(rows,cols); 
% 计算lnfij
for i=1:rows
  for j=1:cols
      if f(i,j)==0
          lnfij(i,j)=0;
      else
          lnfij(i,j)=log(f(i,j));
      end
  end
end
Hj=-k*(sum(f.*lnfij,1)); 
weights=(1-Hj)/(cols-sum(Hj));
end