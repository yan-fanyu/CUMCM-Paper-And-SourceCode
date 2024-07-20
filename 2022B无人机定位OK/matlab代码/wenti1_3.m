% 无偏差的无人机
uav_loc = [
    0, 0, 0;
    2, 100, 0;
    3, 76.6044, 64.2787;
    4, 17.3648, 98.4807;
    5, -50, 86.6025;
    6, -93.9692, 34.2020;
    7, -93.9692, -34.2020;
    8, -50, -86.6025;
    9, 17.3648, -98.4807;
    10, 76.6044, -64.2787;
];

% 最开始有偏差的无人机
uav_loca = [
    1, 0, 0;
    2, 100, 0;
    3, 74.9602, 63.1218;
    4, 13.44, 110.3648;
    5, -52.101, 91.1505;
    6, -92.0024, 33.7414;
    7, -105.2688, -38.2256;
    8, -52.395, -90.993;
    9, 17.2088, -96.4516;
    10, 86.1392, -71.568;
];

for i = 3:10
    Err(i) = norm(uav_loca(i, 2:3) - uav_loc(i, 2:3));
end
fprintf('开始时的误差为%f\n', mean(Err));

angle = [0 0 40 80 120 160 -160 -120 -80 -40];
% 选出误差最小的无人机作为发射站
UavAdjust = [0 0 1 1 1 1 1 1 1 1];
MinErr = [1000 1000 0 0 0 0 0 0 0 0];
count = 1;
while(count <= 7)
    for i = 1:10
        if(UavAdjust(i) == 1)
            MinErr(i) = DisCal(uav_loc(i, 2:3), uav_loca(i, 2:3));
            MinError = min(MinErr);
        end
    end
    MinErrorInd = find(MinErr == MinError);
    fprintf('最小误差无人机编号为%d\n', MinErrorInd);
    
    UavAdjust(MinErrorInd) = 0;
    MinErr(MinErrorInd) = 1000;
    Index = find(UavAdjust == 1);
    UavFather = [
        0 0 0 0;
        0 0 0 0;
        1 2 MinErrorInd angle(MinErrorInd);
        1 2 MinErrorInd angle(MinErrorInd);
        1 2 MinErrorInd angle(MinErrorInd);
        1 2 MinErrorInd angle(MinErrorInd);
        1 2 MinErrorInd angle(MinErrorInd);
        1 2 MinErrorInd angle(MinErrorInd);
        1 2 MinErrorInd angle(MinErrorInd);
        1 2 MinErrorInd angle(MinErrorInd);
    ];
    for i = Index
         Angle = AngleCalu(uav_loca(i, 2:3), UavFather(i, 1:3), uav_loca(:, 2:3));
         Loc = locfun(Angle, UavFather(i, 1:3), uav_loc(:, 2:3), UavFather(i, 4));
         MovDis = uav_loc(i, 2:3) - Loc;
         uav_loca(i, 2:3) = uav_loca(i, 2:3) + MovDis;
    end
    
    for i = 3:10
        dataseq(count).Err(i) = norm(uav_loca(i, 2:3) - uav_loc(i, 2:3));
    end
    
    fprintf('调整后的误差为%f\n', mean(dataseq(count).Err));
    fprintf('---------------------------------\n');
    count = count + 1;
end








