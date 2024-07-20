function [nvec_x,nvec_y,nvec_z] = cal_nvec(tower_x,tower_y,tower_z,mir_x,mir_y,mir_z,alps,gams)
%nvec_xyz 定日镜的法向量
%tower_xyz 吸收塔的坐标
%mir_xyz 定日镜的坐标
%alps 太阳高度角
%gams 太阳方位角
    inline = [-cos(alps)*sin(gams) ,-cos(alps)*cos(gams) ,-sin(alps)];
    outline = [(mir_x-tower_x)/((mir_x-tower_x)^2+(mir_y-tower_y)^2+(mir_z-tower_z)^2),(mir_y-tower_y)/((mir_x-tower_x)^2+(mir_y-tower_y)^2+(mir_z-tower_z)^2) ,(mir_z-tower_z)/((mir_x-tower_x)^2+(mir_y-tower_y)^2+(mir_z-tower_z)^2)];
    nvec = (inline + outline) / 2;
    nvec_x = nvec(:,1);
    nvec_y = nvec(:,2);
    nvec_z = nvec(:,3);
end

