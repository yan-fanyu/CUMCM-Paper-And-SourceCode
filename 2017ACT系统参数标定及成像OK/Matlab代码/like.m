function [ retu ] = like( a,b )
% 列向量相似率计算函数
% retu a b 均是列向量
% 此处显示详细说明
    in_type = 255 ;% 像素值范围
    long = size(a,1);
    if long ~= size(b,1) % 两个列向量的长度应当等长
        retu = 0;
        disp('Error:Fun like,different long size.')
    else
        retu = 1 - sum((a-b)+(b-a))/long/in_type ;
    end
end

