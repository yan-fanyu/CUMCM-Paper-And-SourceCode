function flag = limit1(GApop)
%GApop input:种群
    R = GApop(:,1 : 20); %逐步往外层
    L = GApop(:,21:22); %宽大于高
    bul = all(GApop(:,21) < 2.*GApop(:,23)) ; %高小于z/2
    if isempty(find(diff(R) < 0, 1)) && isempty(find(diff(L) <= 0,1)) && bul
        flag = 1; % 递增
    else
        flag = 0;
    end
end

