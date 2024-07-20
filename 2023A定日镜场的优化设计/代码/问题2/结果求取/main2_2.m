%% 第二问
tic;
clear;
clc;

%% 初始化
ret = [132.758373	107.0983616	151.228255	251.0839529	123.9059299	286.3469349	312.6514044	272.577485	165.9978693	199.6186359	104.6813386	172.5810455	272.832824	266.2402695	227.4790032	248.9953365	133.9751647	231.5721848	110.765223	245.3282343	324.7464474	312.1433231	253.5829274	210.2131414	304.2790922	198.7345125	274.3924298	113.6745338	222.7938798	150.8900731	119.2069625	154.8734911	342.1512827	164.7421712	262.4574946	161.3006176	259.8159588	303.8013548	340.8562035	136.2633661	126.9956364	199.917561	341.3947033	124.4272316	102.4679283	209.8451861	271.1057057	347.9998718	316.3913381	168.4501654	143.7050576	153.5385148	231.4462909	263.3848351	205.5575001	7.732806654	5.687691213	4.390039262
] ; %模型优化后的zbest
[mir_x,mir_y,mir_z] = result(ret);
mir_x = mir_x(:);
mir_y = mir_y(:);
mir_z = mir_z(:);
mir_loc = [mir_x,mir_y,mir_z];
writematrix(mir_loc,'第二问坐标.xlsx','Sheet',1,'Range','A2 :C2751');%定日镜坐标
longitude_E = deg2rad(98.5) ;
latitude_N = deg2rad(39.4) ; %经纬度信息
tower = [0,0,80] ; %吸收塔坐标和高度
time = [9 10.5 12 13.5 15]; %时间点

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
%% 计算平面镜法向量(待简化)
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
 writematrix(eta_cos_ave.','result2.xlsx','Sheet',1,'Range','B2 : B13');
 disp("余弦效率计算完成")

 %% 计算光学效率
 eta_sb = 0.95;
 eta_trunc = 1;
 for i = 1 : mir_row
    for j = 1 : 12
        for k = 1 : 5
            eta_time(i,j,k) = cal_eta(DHR(i),eta_cos(i,j,k),eta_sb,eta_trunc);
        end
    end
 end
 %具体日期时间镜子的光学效率
 %计算日定日镜场的平均光学效率
 eta_ave_data = sum(eta_time,[1,3])./(5*mir_row);
 disp("效率计算完成")
 writematrix(eta_ave_data.','result2.xlsx','Sheet',1,'Range','A2 : A13');
 %% 单位面积镜面平均输出热功率
for i = 1 : 12
    for j = 1 : 5
        E(i,j) = DNI(i,j) * eta_ave_data(j) ;
    end
end
E_ave = sum(E ,2)./5; 
writematrix(E_ave,'result2.xlsx','Sheet',1,'Range','E2 : E13');
disp("end")
toc;



