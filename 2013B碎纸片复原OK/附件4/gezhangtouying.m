%计算投影
num=209;

for i=1:num  %读取所有碎纸片
    if i<11
        [img0(:,i*72-71:i*72),cmap0(:,i*3-2:i*3)]=imread(strcat('00',num2str(i-1)),'bmp');
    elseif i<101
        [img0(:,i*72-71:i*72),cmap0(:,i*3-2:i*3)]=imread(strcat('0',num2str(i-1)),'bmp');
    else
        [img0(:,i*72-71:i*72),cmap0(:,i*3-2:i*3)]=imread(num2str(i-1),'bmp');
    end
end
touying=zeros(180,209);%touying用每一列记录对应图片黑色像素点数
for i=1:209
    for j=1:180
        touying(j,i)=length(find(img0(j,i*72-71:i*72)~=255));
    end
end
