function dhr = cal_dhr(mir_loc,mir_row,hot_x,hot_y,hot_z)
%dhr 镜面中心到集热器中心的距离
%mir_loc 镜面中心坐标
%mir_num 镜子数量
%hot_xyz 集热器中心坐标
    hot = repmat([hot_x,hot_y,hot_z],mir_row);
    dhr = ((mir_loc(:,1) - hot(:,1)).^2 + (mir_loc(:,2) - hot(:,2)).^2 + (mir_loc(:,3) - hot(:,3)).^2).^0.5;
end

