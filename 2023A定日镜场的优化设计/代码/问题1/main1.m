%% 第一题

%% 清空工作区
clear;
clc;
tic; %开启计时器

%% 初始化参数
mir_data = xlsread('C:\Users\86185\Desktop\a\题目\附件.xlsx') ; %读取定日镜坐标
height = 4.*ones(m,1); %定日镜的高度
mir_loc = [mir_data height] ; %定日镜xyz坐标
longitude_E = deg2rad(98.5) ;
latitude_N = deg2rad(39.4) ; %经纬度信息
tower = [0,0,80] ; %吸收塔坐标和高度
time = [9 10.5 12 13.5 15]; %时间点
disp("初始化结束")
%% 计算太阳高度角和太阳方位角
%2023年春分3.21
D = [-59, -28, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275] ;
phi = latitude_N;
ST = time ;
alps = zeros(12,5) ;
gams = zeros(12,5) ; %初始化数据
for i = 1 : 12
    for j = 1 : 5
        [alps(i,j),gams(i,j)] = cal_alps_gams(D(i),phi,ST(j)) ; %计算高度角和方位角
    end
end
 gams(:,4) = 2*pi - gams(:,4);
 gams(:,5) = 2*pi - gams(:,5);% ST >= 12
 gams(:,:) = real(gams(:,:));
 disp("太阳方位角与高度角计算完成")
%% 计算DNI法向直接辐射辐照度
DNI = zeros(size(alps)) ;
for i = 1 : 12
    for j = 1 : 5
        DNI(i,j) = cal_DNI(alps(i,j)) ;
    end
end
disp("DNI is ok")
%% 计算dhr
[mir_row,mir_col] = size(mir_loc);
DHR = cal_dhr(mir_loc, mir_row, 0, 0, 80);
disp("dhr is ok")
%% 计算平面镜法向量
nvec_x = zeros(mir_row,12,5);
nvec_y = zeros(mir_row,12,5);
nvec_z = zeros(mir_row,12,5);
for i = 1 : mir_row
    for j = 1 : 12
        for k = 1 : 5
            [nvec_x(i,j,k),nvec_y(i,j,k),nvec_z(i,j,k)] = cal_nvec(0,0,80,mir_loc(i,1),mir_loc(i,2),mir_loc(i,3),alps(j,k),gams(j,k));
        end
    end
end
nvec_x = real(nvec_x);
nvec_y = real(nvec_y);
nvec_z = real(nvec_z);
disp("平面镜法向量计算结束")
%% 计算余弦效率
%入射光线法向量
%inline = [-cos(alps)*sin(gams) ,-cos(alps)*cos(gams) ,-sin(alps)];
 for i = 1 : mir_row
     for j = 1 : 12
         for k = 1 : 5
             inline = [-cos(alps(j,k))*sin(gams(j,k)) ,-cos(alps(j,k))*cos(gams(j,k)) ,-sin(alps(j,k))];  %入射光线法向量
             eta_cos(i,j,k) = abs(dot([nvec_x(i,j,k),nvec_y(i,j,k),nvec_z(i,j,k)],inline)) ;
         end
     end
 end
 %计算平均余弦效率
 eta_cos_ave = sum(eta_cos,[1,3])./(5 * mir_row);
 disp("余弦效率计算完成")
 %% 计算遮挡面积

 %平面方程 nevx(x-x0)+nevy(y-y0)+nevz(z - z0) = 0
 %反射光线法向量  outline = [mir_x-tower_x ,mir_y-tower_y ,mir_z-tower_z];
 %平面约束方程1 -3 <= (-nvec_y(x-x0) + nvec_x(y-y0))/(nvec_x ^2 + nvec_y ^2) <=3
 %平面约束方程2 -3 <= (-nvec_x * nvec_z(x-x0)-nvec_y * nvec_z(y - y0) + (nvec_x ^2
 %+ nvec_y ^2)(z - z0))/(sqrt((a^2+b^2)*(a^2 + b^2 +c^2)))
 
 total_loss_num = ones(mir_row,12,5); % total_loss_num 无效网格个数
 shadow_loss_num = zeros(mir_row,12,5); %阴影损失
 miss_loss_num = zeros(mir_row,12,5); %未击中吸收塔
 div_num = 1  ; % 分块数量
 times = 0;
 for i = 1  : mir_row 
     for j = 1 : 12
         for k = 1 : 5
             for row = 1 : div_num
                 for col = 1 : div_num
                     for l = 1  : mir_row
                          temp = total_loss_num(i,j,k);
                          if i ~= l && dot(mir_loc(l,:),mir_loc(l,:)) < dot(mir_loc(i,:),mir_loc(i,:))
                              break;
                          else
                              [total_loss_num(i,j,k),shadow_loss_num(i,j,k),miss_loss_num(i,j,k) ] = cal_sl(mir_loc(i,1),mir_loc(i,2),mir_loc(i,3),nvec_x(i,j,k),nvec_y(i,j,k),nvec_z(i,j,k),mir_loc(l,1),mir_loc(l,2),mir_loc(l,3),nvec_x(l,j,k),nvec_y(l,j,k),nvec_z(l,j,k),0,0,80,alps(j,k),gams(j,k), row,col,div_num,total_loss_num(i,j,k),shadow_loss_num(i,j,k),miss_loss_num(i,j,k));
                          end
                          if (total_loss_num(i,j,k)) > temp
                              %出现损失情况结束
                              break
                          end
                     end
                 end
             end
         end
     end
 end
%计算平均遮挡效率
eta_sb_ave = (sum(shadow_loss_num,[1,3]))./(div_num*div_num*mir_row)./5 ;
%计算平均截断效率
temp1 = div_num^2 .* ones(mir_row,12,5);
eta_trunc_ave = sum((temp1 - total_loss_num)./(temp1 - shadow_loss_num),[1,3]) ./(5*mir_row) ;
 %% 计算光学效率
for i = 1 : mir_row
    for j = 1 : 12
        for k = 1 : 5
            eta_time(i,j,k) = cal_eta(shadow_loss_num(i,j,k),miss_loss_num(i,j,k),total_loss_num(i,j,k),DHR(i),eta_cos(i,j,k),div_num);
        end
    end
end
 %具体日期时间镜子的光学效率
 %计算日定日镜场的平均光学效率
eta_ave_data = sum(eta_time,[1,3])./(5*mir_row);
disp("效率计算完成")
%% 单位面积镜面平均输出热功率
for i = 1 : 12
    for j = 1 : 5
        E(i,j) = DNI(i,j) * eta_ave_data(j) * (1 - eta_sb_ave(i));
    end
end
E_ave = sum(E ,2)./5;            
toc;
disp("end")

