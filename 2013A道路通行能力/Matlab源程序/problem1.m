% ����1
%%  ע�⣡��! ��Ҫ�õ���Ƶ���뽫����1��Ƶ���ڵ�ǰĿ¼��,������Ϊ1.mpg��
clear;
close all;
clc;

%% ��ȡ��Ƶ ��һ֡֡�Ĳ���

%%  ע�⣡��! ��Ҫ�õ���Ƶ���뽫����1��Ƶ���ڵ�ǰĿ¼��,������Ϊ1.mpg��
vedio1 = mmreader('1.mpg');
nFrames = vedio1.NumberOfFrames; 
vidHeight = vedio1.Height;
vidWidth = vedio1.Width;

%% ѡ���е�ROI
img = 0;
C1 = read(vedio1,4950);
%imshow(C1);
C1 = rgb2gray(C1);%תΪ�Ҷ�ͼ
C1 =medfilt2( C1,[3,3]); %��ֵ�˲�B(1) = read( vedio1, 1 );
K = 0.90;B1 = 0;tmp = zeros(size(C1));M = 30;

for i =  4960:15: nFrames  
             C = read( vedio1, i );% ���25֡һ��
             tmp = C;
             C = rgb2gray(C);%תΪ�Ҷ�ͼ            
             C = histeq(C); %ֱ��ͼ���⻯  
%             imshow(C);
             
     %        C = retinex(C);
 %            figure;            
             C = medfilt2( C,[3,3]); %��ֵ�˲�              
 %             imshow(C);
             B = K*B1+(1-K)*C1;             
             D = C-B;             
%              for j = 2:288-1
%                 for k = 2:352-1
%                     if D(j,k)>M && D(j-1,k-1)>M && D(j-1,k)>M && D(j,k-1)>M....
%                         && D(j+1,k)>M && D(j,k+1)>M && D(j+1,k-1)>M && D(j+1,k+1)>M....
%                         && D(j-1,k+1)>M
%                         tmp(j,k) = 255;
%                     end
%                 end
%              end   
            D(find(D>M)) = 255;
            D(find(D<= M)) = 0;
           %  level = graythresh(D); %Otsu��ֵ��
           %  D = im2bw(D,level);   
             subplot(1,2,1);
             imshow(tmp);
             subplot(1,2,2);
             %imshow(tmp);
             se1=strel('square',2);%Բ���ͽṹԪ��
             %D = imopen(D,se1);
             
             se=strel('disk',2);%Բ���ͽṹԪ��             
             D=imclose(D,se);%ֱ�ӱ�����                          
             %D = edge(D,'canny'); %��Ե���      
             imshow(D);                                                       
             C1 = C;
             B1 = B;                          
             % ��i= 4990��ʼ���м���             
end 