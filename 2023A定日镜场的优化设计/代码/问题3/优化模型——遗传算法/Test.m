function [ flag ] = Test( lenchrom, bound, ret ,alps,gams)
%lenchrom   input:染色体长度
%bound      input:变量的取值范围
%code       input:染色体的编码值
%flag      output:可行性标志变量
%初始变量
flag = 0;
%1:可行
%0:不可行
R = ret(:,1 : lenchrom / 4); %逐步往外层
L = ret(:,lenchrom / 4 + 1:lenchrom / 2); %宽大于高
R = sort(R);
L = sort(L);
ret = [R,L,ret(lenchrom / 2 + 1:end)];
for n = 1:lenchrom
    if ret(n) > bound(n,1) && ret(n) < bound(n,2) && E_limit(lenchrom,bound,ret,alps,gams) && ret(:,1) * sin(pi/25) >= 5 && H_limit(ret,lenchrom)
        flag = 1;
        break
    end
end
end

