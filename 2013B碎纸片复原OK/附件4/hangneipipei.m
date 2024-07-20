clear;
sign=[192	5	12	33	40	65	66	68	76	105	107	148	150	155	181	185	191	3	205];
[temp,num]=size(sign);

for i=1:num  %读取所有碎纸片
    if sign(i)<11
        [img0(:,i*72-71:i*72),cmap0(:,i*3-2:i*3)]=imread(strcat('00',num2str(sign(i)-1)),'bmp');
    elseif sign(i)<101
        [img0(:,i*72-71:i*72),cmap0(:,i*3-2:i*3)]=imread(strcat('0',num2str(sign(i)-1)),'bmp');
    else
        [img0(:,i*72-71:i*72),cmap0(:,i*3-2:i*3)]=imread(num2str(sign(i)-1),'bmp');
    end
end
img1=im2double(img0)*255;


for i=1:num
    for j=1:num %deta255(i,j)i的右侧和j的左侧
        deta255(i,j)=sum(abs(img1(:,i*72)-img1(:,j*72-71)));
    end
end
deta255(:,1)=inf;


%人为控制
%deta255(13,2)=inf;deta255(13,14)=inf;deta255(17,14)=inf;deta255(18,17)=0;deta255(12,3)=0;deta255(14,5)=0;
%deta255(23,29)=0;deta255(4,34)=0;deta255(34,22)=0;deta255(2,18)=0;
%deta255(9,10)=0;%deta255(14,15)=0;deta255(16,17)=0;deta255(13,18)=0;deta255(18,2)=0;
%deta255(6,17)=0;
now=1;
img(:,1:72)=img0(:,now*72-71:now*72);
shunxu(1)=sign(now);


now_temp(1)=now;
for i=2:num
    deta255(:,now)=inf;
    now=find(deta255(now,:)==min(deta255(now,:)))
    now_temp(i)=now;
    shunxu(i)=sign(now);
    img(:,i*72-71:i*72)=img0(:,now*72-71:now*72);
end
figure;
image(img);
colormap(cmap0(:,1:3));
axis off;
hold on;
for i=1:num
    text((i-1)*72,150,int2str(now_temp(i)));
end
for i=1:num
    plot([72*i-1,72*i-1],[0,180])
end
%img0(:,1:72:1368)=0;

