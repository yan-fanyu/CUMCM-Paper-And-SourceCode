function [flag] = H_limit(ret,lenchrom)
%H_LIMIT 此处显示有关此函数的摘要
%   此处显示详细说明
    count = 0;
    for i = 1 : lenchrom / 4
      if  ret(:,2 * (i-1) + lenchrom + 1) <= 2 *ret(:,lenchrom * 3 / 4+i)
          count = count + 1;
      end
    end
    if count == 55
        flag = 1;
    else
        flag = 0;
    end
end

