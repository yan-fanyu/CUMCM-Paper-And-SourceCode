%% 边缘化处理
% 对图像二进行边缘处理
I=xlsread('data.xls',2); 
% imshow(uint8(I));
title('宿主图像');

BW(:,:,1)=~edge(I,'canny');
BW(:,:,2)=~edge(I,'log');
BW(:,:,3)=~edge(I,'sobel');
BW(:,:,4)=~edge(I,'Roberts');
BW(:,:,5)=~edge(I,'Prewitt');
figure;
subplot(1,5,1);imshow(BW(:,:,1));
title('canny算子');
subplot(1,5,2);imshow(BW(:,:,2));
title('log算子');
subplot(1,5,3);imshow(BW(:,:,3));
title('soble算子');
subplot(1,5,4);imshow(BW(:,:,4));
title('Roberts算子');
subplot(1,5,5);imshow(BW(:,:,5));
title('Prewitt算子');
clear I 
%% 导出图像
imwrite(BW(:,:,1),'LINE_canny.bmp');
imwrite(BW(:,:,2),'LINE_log.bmp');
imwrite(BW(:,:,3),'LINE_soble.bmp');
imwrite(BW(:,:,4),'LINE_roberts.bmp');
imwrite(BW(:,:,5),'LINE_prewitt.bmp');
