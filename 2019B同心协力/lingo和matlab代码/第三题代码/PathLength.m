function Length = PathLength(Route,X)
tan45=sqrt(2)/2;
n = zeros(1,size(Route,2));
for i = 1:size(Route,2)
    if i==1
        n(1)=X(Route(1))+tan45*X(Route(8))+tan45*X(Route(2));
    elseif i==8
         n(8)=tan45*X(Route(1))+X(Route(8))+tan45*X(Route(7));
    else
        n(i)=X(Route(i))+tan45*X(Route(i+1))+tan45*X(Route(i-1));
    end
end
Length = abs(n(1)-n(5))+abs(n(2)-n(6))+abs(n(3)-n(7))+abs(n(4)-n(8));
Length
