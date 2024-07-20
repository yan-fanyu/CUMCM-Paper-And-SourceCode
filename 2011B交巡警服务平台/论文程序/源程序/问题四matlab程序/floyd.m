function[D,R]=floyd(a)

n=size(a,1);
D=a;
for i=1:n
   for j=1:n
     R(i,j)=j;
   end
end
R;

for k=1:n
   for i=1:n
      for j=1:n
         if D(i,k)+D(k,j)<D(i,j)
            D(i,j)=D(i,k)+D(k,j);
            R(i,j)=R(i,k);
         end
      end
   end
   k;
   D;
   R;
end
