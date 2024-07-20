%% 测定角度
% 载入原始数据以校对角度
real = xlsread('data.xls',2);
% 生成模拟图
tast0
% close all
clc
real = real .*255 ./ max(max(real));
real = uint8(real);
%%
xs = zeros(1,180) ;
for l = 1:180
    a = real(:,l);
    jilu = zeros(1,230) ;
    for k = 1:230
        b = img5(:,k);
        jilu(k) = like(a,b);
    end
%     plot(1:230,jilu)
    [a1,a2] = max(jilu);
    xs(l) = a2 ;
end
plot(xs)
