%% ����ת���Ĳ���
% im = xlsread('data.xls',1);
% imshow(im);
p = 1;
r = uint8(radon(im,p:1:p+179));
imshow(r)
% ����tast1
I = r;
clear p r im
%% ����ת��������
ladeng = iradon(r,1:1:180);
imshow(ladeng)

clear p r 