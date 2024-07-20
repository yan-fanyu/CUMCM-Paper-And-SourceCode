%% 拉冬转换的测试
% im = xlsread('data.xls',1);
% imshow(im);
p = 1;
r = uint8(radon(im,p:1:p+179));
imshow(r)
% 连接tast1
I = r;
clear p r im
%% 拉冬转换逆运算
ladeng = iradon(r,1:1:180);
imshow(ladeng)

clear p r 