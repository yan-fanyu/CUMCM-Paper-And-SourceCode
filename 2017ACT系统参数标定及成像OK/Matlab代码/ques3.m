%% ���������
map = xlsread('data.xls',4);
imgq3ct = xlsread('data.xls',5);
map = [ (50-map(:,2))./0.2761+181 (map(:,1)-50)./0.2761+181 ]  ;
imgq3 = iradon(imgq3ct,27:206);
figure(1);imshow(imgq3);title('iRadon');

imgmov = [ 28,38 ] ;
se = translate(strel(1),-imgmov); %��С���䣬����Y,X����ƽ��
imgq32 = imdilate( imgq3,se);
figure(2);imshow(imgq32);title('��ԭƫ����');
clear se

imgq33 = imresize(imgq32,0.706);
% imgq33 = (imgq33>0.1) .* imgq23 ;
figure(3);imshow(imgq33);title('��ԭ�ߴ�');
%%
xlswrite('problem3.xls',imgq33)