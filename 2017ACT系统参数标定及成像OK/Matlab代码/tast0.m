%% 输入图片进行两次转换测试
%参数设定
imgmov = [ 28,38 ]; %旋转中心偏移量（ppi）
blc = 0.2822 ;% 每个像素的长度（mm/ppi）
set_ppi = 40 ;% 边缘增加像素数目
p = 1:180 ;      % 起始角度

cita = p ;clear p p1;
%载入原始截面图像
img = xlsread('data.xls',1); 
% 按比例缩放图片
img1 = imresize(img,1.41744) ;
% 3*3平滑滤波
img1 = filter2(fspecial('average',3),img1);
figure(1);imshow(img1);title('拉伸截面图');
%% 增大轮廓
img2 = zeros(363+2*set_ppi);
img2(set_ppi+1:set_ppi+363,set_ppi+1:set_ppi+363) = img1;
figure(2);imshow(img2);title('增大轮廓');
%% 修正偏移量
% 对原始像素图像进行旋转中心的偏移校正
se = translate(strel(1),imgmov); %大小不变，进行Y,X方向平移
img3= imdilate(img2,se);
for m = 1:1:size(img3,1)
    for n = 1:1:size(img3,2)
        if img3(m,n)<=0
            img3(m,n) = 0 ;
        end
    end
end
clear m n
figure(3);imshow(img3);title('修正偏移量');
clear se
%% radon transform
img4 = radon(img3,cita);
figure(4);imshow(uint8(img4));title('CT原始数据');
lsln = size(img4,1) ;
lsl = (lsln-511)/2:(lsln+511)/2  ;
img5 = uint8( img4 .*255 ./ max(max(img4)));
img5 = img5(lsl,:);
figure(5);imshow(img5);title('CT已调宽数据');clear lsln lsl
%% iradon transform 
img6 = iradon(img4,cita);
figure(6);imshow(img6);title('反变换后的原始数据')
%% 偏移量还原
se = translate(strel(1),-imgmov); %大小不变，进行Y,X方向平移
img7= imdilate(img6,se);
figure(7);imshow(img7);title('还原偏移量');
clear se

