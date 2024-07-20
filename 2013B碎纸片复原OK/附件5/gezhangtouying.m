%计算投影
num=418;

for j=1:num  %读取所有碎纸片
    if mod(j,2)==1
        si='a';
    else
        si='b';
    end
    i=ceil(j/2);
    if i<11
        [img0(:,j*72-71:j*72),cmap0(:,j*3-2:j*3)]=imread(['00',num2str(i-1),si],'bmp');
    elseif i<101
        [img0(:,j*72-71:j*72),cmap0(:,j*3-2:j*3)]=imread(['0',num2str(i-1),si],'bmp');
    else
        [img0(:,j*72-71:j*72),cmap0(:,j*3-2:j*3)]=imread([num2str(i-1),si],'bmp');
    end
end
touying=zeros(180,num);%touying用每一列记录对应图片黑色像素点数
for i=1:num
    for j=1:180
        touying(j,i)=length(find(img0(j,i*72-71:i*72)~=255));
    end
end
%image(img0(:,1:72));
%colormap(cmap0(:,1:3));

