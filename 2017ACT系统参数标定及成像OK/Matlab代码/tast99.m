%% ͼ�����ƽ�ơ���ת������
img1 = imgsee;

%% ͼ��ߴ����
img1=imresize(img1,[512,512]);%����ͼƬ�ĳߴ�
%img1=rgb2gray(img1);%���ɫͼת��Ϊ�Ҷ�ͼ
%figure,imshow(img1);
%% ����ͼ��
imwrite(img1,'ct.bmp');
%I1=double(img1);
%img1=(I1-min(I1(:)))/(max(I1(:))-min(I1(:)))*255;
%% ƽ�� 
se=translate(strel('square',5),[0 1]);%��С���䣬����Y,X����ƽ��
img2=imdilate(img1,se);
figure,imshow(img2);
%% ��ת
img3=imrotate(img2,10,'nearest','crop');
figure,imshow(img3);
imwrite(img3,'ct2.bmp');
%i=imread('C:\Users\Administrator\Desktop\DaiMa\ct.BMP');
%save('ct.txt','i','-ascii');
%% ����
%img4=imresize(img1,2);
%figure,imshow(img4);
%imwrite(img4,'ct4.jpg'); 