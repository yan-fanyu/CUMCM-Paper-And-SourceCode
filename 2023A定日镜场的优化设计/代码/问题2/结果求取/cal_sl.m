function [total,shadow,miss] = cal_sl(x0,y0,z0,nvec_x0,nvec_y0,nvec_z0,x1,y1,z1,nvec_x1,nvec_y1,nvec_z1,tower_x,tower_y,tower_z,alps,gams,row,col,div_num,total_loss_num,shadow_loss_num,miss_loss_num)
%xyz0 反射镜坐标
%nvec_xyz0 反射镜法向量
%xyz1 遮挡镜坐标
%nvec_xyz1 遮挡镜法向量
%tower_xyz 塔坐标
%alps,gams 太阳高度角与方位角
%row col第row行col列网格
%div_num 分的数量 div_num * div_num
%total_loss_num shadow_loss_num miss_loss_num无效网格个数 
%j,k 日期时间
    x2 = x0 + (nvec_y0 / div_num) * (((-nvec_x0 * nvec_z0) * (col - (div_num + 1) / 2) / (sqrt(nvec_x0 ^2 + nvec_y0 ^2))) + (-nvec_y0 * (row - (div_num + 1) / 2) / (sqrt(nvec_x0 ^2 + nvec_y0 ^2)))) ;
    y2 = y0 + (nvec_y0 / div_num) * (((-nvec_y0 * nvec_z0) * (col - (div_num + 1) / 2) / (sqrt(nvec_x0 ^2 + nvec_y0 ^2))) + (nvec_x0 * (row - (div_num + 1) / 2) / (sqrt(nvec_x0 ^2 + nvec_y0 ^2)))) ;
    z2 = z0 + (nvec_y0 / div_num) * ((nvec_x0 ^2 + nvec_y0 ^2) * (col - (div_num + 1) / 2) / (sqrt(nvec_x0 ^2 + nvec_y0 ^2))) ;  % 网格的坐标
    syms f1(x,y,z) f2(x,y,z) f3(x,y,z) f4(x,y,z) f5(x,y,z);
    f1(x,y,z) = x2 + nvec_x1 * (z-z2)/ nvec_z1 - x;
    f2(x,y,z) = y2 + nvec_y1 * (z -z2) /nvec_z1 - y;%反射光线方程
    f3(x,y,z) = (-nvec_y1 * (x-x1) + nvec_x1 * (y-y1))/(nvec_x1 ^2 + nvec_y1 ^2);
    f4(x,y,z) = (-nvec_x1 * nvec_z1 * (x-x1)-nvec_y1 * nvec_z1 * (y - y1) + (nvec_x1 ^2+ nvec_y1 ^2) * (z - z1))/(sqrt(nvec_x1^2+nvec_y1^2)) ;
    f5(x,y,z) = (x-tower_x)^2 + (y-tower_y)^2 ; %塔的xy平面方程
    eqns1 = [f1(x,y,z) == 0 , f2(x,y,z) == 0, f3(x,y,z) >= -3,f3(x,y,z) <= 3,f4(x,y,z) >= -3,f4(x,y,z) <= 3]; %平面镜区域约束
    sol1 = solve(eqns1,x,y,z,'Real',true) ;
    if isempty(sol1)%是否被定日镜遮挡
        total_loss_num = total_loss_num + 1;
        miss_loss_num = miss_loss_num + 1;
    else
        if (((abs((cos(gams) * x2 - sin(gams) * y2)) <= 3.5) && ((-sin(gams) * x2 -cos(gams) * y2) >=0) && (tan(alps) * (-sin(gams) * x2 -cos(gams) * y2) <= 84) && ((sin(gams) * x2 + cos(gams) * y2 - (z2 - 84) / tan(alps)) >=0)) || ((x2 - sin(gams) * (z2 - 84) /tan(alps))^2 + (y2 - cos(gams) * (z2 - 84) /tan(alps))^2 <= 49/4))
            shadow_loss_num = shadow_loss_num + 1; % 被塔的影子遮挡
            total_loss_num = total_loss_num + 1;
        else
           eqns2 = [f1(x,y,z) == 0 , f2(x,y,z) == 0,f5(x,y,z) == 49, z - tower_z <= 4,z - tower_z >= -4];
           sol2 = solve(eqns2 ,x ,y ,z ,'Real',true) ;
           if isempty(sol2) 
               total_loss_num=total_loss_num + 1;
               miss_loss_num= miss_loss_num + 1;
           end %没有打到吸收塔+1
        end

    end % 被挡住 +1
    total = total_loss_num;
    shadow = shadow_loss_num;
    miss = miss_loss_num ;
end

