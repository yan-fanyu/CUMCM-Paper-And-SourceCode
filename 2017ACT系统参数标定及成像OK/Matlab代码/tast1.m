%% ��Ե������
% ��ͼ������б�Ե����
I=xlsread('data.xls',2); 
% imshow(uint8(I));
title('����ͼ��');

BW(:,:,1)=~edge(I,'canny');
BW(:,:,2)=~edge(I,'log');
BW(:,:,3)=~edge(I,'sobel');
BW(:,:,4)=~edge(I,'Roberts');
BW(:,:,5)=~edge(I,'Prewitt');
figure;
subplot(1,5,1);imshow(BW(:,:,1));
title('canny����');
subplot(1,5,2);imshow(BW(:,:,2));
title('log����');
subplot(1,5,3);imshow(BW(:,:,3));
title('soble����');
subplot(1,5,4);imshow(BW(:,:,4));
title('Roberts����');
subplot(1,5,5);imshow(BW(:,:,5));
title('Prewitt����');
clear I 
%% ����ͼ��
imwrite(BW(:,:,1),'LINE_canny.bmp');
imwrite(BW(:,:,2),'LINE_log.bmp');
imwrite(BW(:,:,3),'LINE_soble.bmp');
imwrite(BW(:,:,4),'LINE_roberts.bmp');
imwrite(BW(:,:,5),'LINE_prewitt.bmp');
