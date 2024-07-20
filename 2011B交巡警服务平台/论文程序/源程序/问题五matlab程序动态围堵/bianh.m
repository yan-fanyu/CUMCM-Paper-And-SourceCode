load juli;
[x,l]=size(juli);
for i=1:x
    for j=1:l
        if juli(i,j)==Inf||juli(i,j)==0
            juli2(i,j)=0;
        else
            juli2(i,j)=1;
        end
    end
end
save juli juli2