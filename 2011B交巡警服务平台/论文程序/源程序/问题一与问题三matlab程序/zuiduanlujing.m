function zuiduanlujing(a,m,n)
%m=1;
%n=14;
t(1)=m;
i=1;

while t(i)~=n
    t(i+1)=a(t(i),n);  
    fprintf('%d-->',t(i))
     i=i+1;
end
t(i)=n;
fprintf('%d\n',n)


