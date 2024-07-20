load station_coor.mat
% station_coor(:,1)=station_coor(:,1)-1000;
station_coor = station_coor_g;

map_google = imread('lucheng_map.bmp');
figure;
imshow(map_google);

% map_cdata = imread('map.jpg');
% figure;
% imshow(map_cdata);


% imshow(map_cdata(:,1000:end,:));
fontsize = 10;
hold on
for i = 1:180
%     switch(mod(i,4))
%         case 0,
%         plot(station_coor(i,1),station_coor(i,2),'r*');
%         text(station_coor(i,1)+5,station_coor(i,2)+5,num2str(i),'FontSize',fontsize,'Color','red');
%         case 1,
%         plot(station_coor(i,1),station_coor(i,2),'b*');
%         text(station_coor(i,1)+5,station_coor(i,2)+5,num2str(i),'FontSize',fontsize,'Color','blue');
%         case 2,
%         plot(station_coor(i,1),station_coor(i,2),'g*');
%         text(station_coor(i,1)+5,station_coor(i,2)+5,num2str(i),'FontSize',fontsize,'Color','green'); 
%         case 3,
%         plot(station_coor(i,1),station_coor(i,2),'k*');
%         text(station_coor(i,1)+5,station_coor(i,2)+5,num2str(i),'FontSize',fontsize,'Color','black');
%     end
    plot(station_coor(i,1),station_coor(i,2),'k*');
    text(station_coor(i,1)+5,station_coor(i,2)+5,num2str(i),'FontSize',fontsize,'Color','black');
end
hold off