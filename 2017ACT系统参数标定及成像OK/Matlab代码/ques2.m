%% ����ڶ���
map = xlsread('data.xls',4);
imgq2ct = xlsread('data.xls',3);
map = uint16( [(50-map(:,2))./0.2761+181 (map(:,1)-50)./0.2761+181 ] ) ;
imgq2 = iradon(imgq2ct,27:206);
figure(1);imshow(imgq2);title('iRadon');

imgmov = [ 28,38 ] ;
se = translate(strel(1),-imgmov); %��С���䣬����Y,X����ƽ��
imgq22 = imdilate( imgq2,se);
figure(2);imshow(imgq22);title('��ԭƫ����');
% �ӵ�
% plot(map(:,1),map(:,2),'.','markersize',20);
clear se

imgq23 = imresize(imgq22,0.706);
imgq23 = (imgq23>0.1) .* imgq23 ;
figure(3);imshow(imgq23);title('��ԭ�ߴ�');
%%
xlswrite('problem2.xls',imgq23)