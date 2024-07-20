%clear;
sign=[332,17,18,81,82,93,94,127,128,135,136,137,138,151,152,235,236,245,246,255,256,257,258,315,316,335,336,337,338,345,346,365,366,377,378,391,392];
%sign=[17,18,21,81,82,94,127,128,136,137,138,151,152,180,235,236,245,246,256,258,315,316,331,332,335,336,337,338,346,365,366,378];%,392]%,378];
[temp,num]=size(sign);

for j=1:num  %读取所有碎纸片
    if mod(sign(j),2)==1
        si='a';
        i=(sign(j)-1)/2;
    else
        si='b';
        i=(sign(j)-2)/2;
    end
    if i<10
        [img0(:,j*72-71:j*72),cmap0(:,j*3-2:j*3)]=imread(['00',num2str(i),si],'bmp');
    elseif i<100
        [img0(:,j*72-71:j*72),cmap0(:,j*3-2:j*3)]=imread(['0',num2str(i),si],'bmp');
    else
        [img0(:,j*72-71:j*72),cmap0(:,j*3-2:j*3)]=imread([num2str(i),si],'bmp');
    end
end
img1=im2double(img0)*255;

deta255=zeros(num);
for i=1:num
    for j=1:num %deta255(i,j)i的右侧和j的左侧
        if mod(i,2)==1 %i_记录与i背面的页
            i_=i+1;
        else
            i_=i-1;
        end
        if mod(j,2)==1
            j_=j+1;
        else
            j_=j-1;
        end
        %将距离表示为正反面的距离和
        %deta255(i,j)=sum(abs(img1(:,i*72)-img1(:,j*72-71)))+sum(abs(img1(:,i_*72-71)-img1(:,j_*72)));
        deta255(i,j)=sum(abs(img1(:,i*72)-img1(:,j*72-71)));
    end
end
%正反两面距离为inf
for i=1:num
    if mod(i,2)==1 %i_记录与i背面的页
         %deta255(i,i+1)=inf;
         %deta255(i+1,i)=inf;
    end
end

deta255(:,1)=inf;


%人为控制
%deta255(11,14)=10;deta255(3,28)=0;deta255(11,17)=10;deta255(:,17)=9999;%deta255(36,19)=0;deta255(27,33)=0;deta255(2,23)=0;deta255(18,19)=10;
%deta255(29,3)=0;deta255(18,31)=0;deta255(36,10)=0;
%deta255(1,28)=0;deta255(28,10)=0;deta255(13,22)=0;deta255(22,33)=0;deta255(33,26)=0;deta255(8,19)=0;deta255(27,25)=0;deta255(25,23)=0;deta255(23,4)=0;deta255(30,6)=0;
deta255(22,31)=10;deta255(28,6)=10;%deta255(3,4)=0;deta255(12,13)=10;

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
%figure;
%image(img);
figure;
image(img);
colormap(cmap0(:,1:3));
hold on;
for i=1:num
    text((i-1)*72,150,int2str(now_temp(i)));
end
for i=1:num
    plot([72*i-1,72*i-1],[0,180])
end
%img0(:,1:72:1368)=0;


