%% 图像进行平移、旋转、缩放
img1 = imgsee;

%% 图像尺寸调整
img1=imresize(img1,[512,512]);%调整图片的尺寸
%img1=rgb2gray(img1);%真彩色图转换为灰度图
%figure,imshow(img1);
%% 保存图像
imwrite(img1,'ct.bmp');
%I1=double(img1);
%img1=(I1-min(I1(:)))/(max(I1(:))-min(I1(:)))*255;
%% 平移 
se=translate(strel('square',5),[0 1]);%大小不变，进行Y,X方向平移
img2=imdilate(img1,se);
figure,imshow(img2);
%% 旋转
img3=imrotate(img2,10,'nearest','crop');
figure,imshow(img3);
imwrite(img3,'ct2.bmp');
%i=imread('C:\Users\Administrator\Desktop\DaiMa\ct.BMP');
%save('ct.txt','i','-ascii');
%% 缩放
%img4=imresize(img1,2);
%figure,imshow(img4);
%imwrite(img4,'ct4.jpg'); 