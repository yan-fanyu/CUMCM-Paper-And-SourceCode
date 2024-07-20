%map_process
map_pixel = imread('lucheng_map_1bit.bmp');
[m_pix n_pix] = size(map_pixel);
% fid = fopen('lucheng_map_1bit.bin','wb');
% fwrite(fid,uint8(map_pixel));
% fclose(fid);
%search connected region
% map_region = zeros(m_pix,n_pix);
% region_cnt = 0;
% region_list_cnt = 0;
% region_list = {};
% for i_pix = 2:m_pix-1
%     for j_pix = 2:n_pix-1
%         if map_pixel(i_pix,j_pix)~=0;
%             around_coor = [
%                 i_pix-1,j_pix-1
%                 i_pix-1,j_pix
%                 i_pix-1,j_pix+1
%                 i_pix,j_pix-1
%                 i_pix,j_pix+1
%                 i_pix+1,j_pix-1
%                 i_pix+1,j_pix
%                 i_pix+1,j_pix+1
%                 ];
%             around_pix = [
%                 map_pixel(around_coor(1,1),around_coor(1,2))
%                 map_pixel(around_coor(2,1),around_coor(2,2))
%                 map_pixel(around_coor(3,1),around_coor(3,2))
%                 map_pixel(around_coor(4,1),around_coor(4,2))
%                 map_pixel(around_coor(5,1),around_coor(5,2))
%                 map_pixel(around_coor(6,1),around_coor(6,2))
%                 map_pixel(around_coor(7,1),around_coor(7,2))
%                 map_pixel(around_coor(8,1),around_coor(8,2))
%                 ];
%             around_region = [
%                 map_region(around_coor(1,1),around_coor(1,2))
%                 map_region(around_coor(2,1),around_coor(2,2))
%                 map_region(around_coor(3,1),around_coor(3,2))
%                 map_region(around_coor(4,1),around_coor(4,2))
%                 map_region(around_coor(5,1),around_coor(5,2))
%                 map_region(around_coor(6,1),around_coor(6,2))
%                 map_region(around_coor(7,1),around_coor(7,2))
%                 map_region(around_coor(8,1),around_coor(8,2))
%                 ];
%             non_zero_index = find(around_pix~=0);
%             
%         end
%     end
% end
conn = 8;
[L, num]=bwlabel(~map_pixel,conn);
