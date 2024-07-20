function [ y ] = Fun( x )
%本函数计算适应度
    y = 60000./(2736 *  x(end - 2) .* x(end - 1)) ; %单位面积输出热功率
end

