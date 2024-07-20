function [ ret ] = Code( lenchrom, bound,alps,gams)
%本函数将变量编码成染色体，用于随机初始化一个种群
%lenchrom   input:染色体长度
%bound      input:变量的取值范围
%ret       output:染色体的编码值

while 1
    pick = rand(1,lenchrom);
    ret = bound(:,1)' + (bound(:,2) - bound(:,1))'.*pick;   %线性插值
    %检验染色体的可行性
    flag = Test(lenchrom, bound, ret,alps,gams);
    if flag                                      %若染色体全部可行，跳出循环
        break
    end
end
end

