function A=CN(r,n)
    A=zeros(n);
    for i=1:n
        A(i,i)=1+2*r;
        if(i>1)
            A(i-1,i)=-r;
            A(i,i-1)=-r;
        end
    end
end