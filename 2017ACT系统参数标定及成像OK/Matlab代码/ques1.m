%% �ⶨ�Ƕ�
% ����ԭʼ������У�ԽǶ�
real = xlsread('data.xls',2);
% ����ģ��ͼ
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
