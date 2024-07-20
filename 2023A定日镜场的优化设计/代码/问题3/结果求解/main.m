%% 第二问
tic;
clear;
clc;

%% 初始化
ret = [103.1564882	104.6967184	110.4261043	118.4611272	120.0432118	121.5808756	122.9592307	130.1645589	131.7448211	133.887868	136.4237897	136.9701781	161.2801785	168.3884154	170.75142	170.8290786	172.8452757	176.8685481	180.5859606	188.2365497	193.9134366	194.2434875	197.2891748	201.1445132	202.404949	203.6460565	206.1515852	214.1812849	215.1717824	224.1214086	229.6150256	230.0964079	237.1296064	240.3913712	240.8809778	241.5416767	242.5831556	243.0165298	255.4290513	258.8787525	259.5638978	260.0374288	260.6185532	261.931686	262.2872784	264.9475489	279.2063159	279.7870819	288.0881581	290.2774258	296.5782613	314.8480576	323.8717687	333.7464721	346.8378663	5.023331903	7.785279233	7.580295666	7.892114853	6.300147807	6.576719878	7.604540298	7.701937532	5.120641378	5.295472457	6.145115478	7.603703553	5.464192916	6.915766321	6.698987907	7.475496312	5.647860811	6.464013759	5.581412162	6.407037445	5.540113616	7.572202721	2.976455454	4.396028239	4.194904347	4.845064343	4.203337237	5.438564028	4.376607456	4.516108197	3.183481851	4.507653114	5.682135814
]
[mir_x,mir_y,mir_z] = result(ret);
mir_x = mir_x(:);
mir_y = mir_y(:);
mir_z = mir_z(:);
mir_loc = [mir_x,mir_y,mir_z];
writematrix(mir_loc,'第三问坐标.xlsx','Sheet',1,'Range','A2 :C2751');%定日镜坐标
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



