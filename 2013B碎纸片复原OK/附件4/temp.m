%画制定片投影
num=209;
i=169;
%for i=1:num  %读取所有碎纸片
    if i<11
        [img0,cmap0]=imread(strcat('00',num2str(i)),'bmp');
    elseif i<101
        [img0,cmap0]=imread(strcat('0',num2str(i)),'bmp');
    else
        [img0,cmap0]=imread(num2str(i),'bmp');
    end
%end
%touying=zeros(180,209);%touying用每一列记录对应图片黑色像素点数
img1=img0; 
for j=1:180
    touying(j)=length(find(img0(j,:)~=255));
end
for j=1:180
    img1(j,:)=255;
    img1(j,1:touying(j))=0;
end

image([img1 img0]);
colormap(cmap0);
axis off;