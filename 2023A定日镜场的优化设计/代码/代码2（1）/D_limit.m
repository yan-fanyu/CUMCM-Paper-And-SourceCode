function [flag] = D_limit(lenchrom, bound, ret)
%D_LIMIT 此处显示有关此函数的摘要
%   此处显示详细说明
    count = 0;
    for i = 1 : 48
        if ret(:,i) * sin(4*pi/(10+2*(i - 1))) >= 5
            count = count + 1;
        end
    end
    if count == 48
        flag = 1;
    else
        flag = 0;
    end
end

