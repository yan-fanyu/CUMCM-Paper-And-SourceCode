%% ����ͼƬ��������ת������
%�����趨
imgmov = [ 28,38 ]; %��ת����ƫ������ppi��
blc = 0.2822 ;% ÿ�����صĳ��ȣ�mm/ppi��
set_ppi = 40 ;% ��Ե����������Ŀ
p = 1:180 ;      % ��ʼ�Ƕ�

cita = p ;clear p p1;
%����ԭʼ����ͼ��
img = xlsread('data.xls',1); 
% ����������ͼƬ
img1 = imresize(img,1.41744) ;
% 3*3ƽ���˲�
img1 = filter2(fspecial('average',3),img1);
figure(1);imshow(img1);title('�������ͼ');
%% ��������
img2 = zeros(363+2*set_ppi);
img2(set_ppi+1:set_ppi+363,set_ppi+1:set_ppi+363) = img1;
figure(2);imshow(img2);title('��������');
%% ����ƫ����
% ��ԭʼ����ͼ�������ת���ĵ�ƫ��У��
se = translate(strel(1),imgmov); %��С���䣬����Y,X����ƽ��
img3= imdilate(img2,se);
for m = 1:1:size(img3,1)
    for n = 1:1:size(img3,2)
        if img3(m,n)<=0
            img3(m,n) = 0 ;
        end
    end
end
clear m n
figure(3);imshow(img3);title('����ƫ����');
clear se
%% radon transform
img4 = radon(img3,cita);
figure(4);imshow(uint8(img4));title('CTԭʼ����');
lsln = size(img4,1) ;
lsl = (lsln-511)/2:(lsln+511)/2  ;
img5 = uint8( img4 .*255 ./ max(max(img4)));
img5 = img5(lsl,:);
figure(5);imshow(img5);title('CT�ѵ�������');clear lsln lsl
%% iradon transform 
img6 = iradon(img4,cita);
figure(6);imshow(img6);title('���任���ԭʼ����')
%% ƫ������ԭ
se = translate(strel(1),-imgmov); %��С���䣬����Y,X����ƽ��
img7= imdilate(img6,se);
figure(7);imshow(img7);title('��ԭƫ����');
clear se

