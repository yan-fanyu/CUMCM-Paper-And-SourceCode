%% �������ݣ����ӻ�������ͼ��
%����ͼ��
for k = [ 2 3 5 ]
    data(:,:,k) = xlsread('data.xls',k);
end
%����
for k = [ 2 3 5 ]
    data(:,:,k) = data(:,:,k)*255/max(max(data(:,:,k)));
end
img = uint8( data ) ;

% ͼ��������ļ�
% for k = [ 2 3 5]
%     name = sprintf( 'data%01i.png',k );
%     imwrite(img(:,:,k),name)
% end
clear name k
%% ����ͼ�� 180>>360
tast1 = img(1:256,:,2);
tast2 = img(257:512,:,2);
tast3 = tast2 ;
for k = 1:1:256
    tast3(257-k,:)=tast2(k,:);
end
tast = [ tast1 tast3 ];
clear tast1 tast2 tast3 k
imshow(tast)