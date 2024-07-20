clear all;
clc;
close all;

%% 设定参数
% 期望位置
R = 50; % 距离为50
R0 = R / 2; 
R1 = R * sqrt(3) / 2;

uav_loc = [
    1 0 0;
    2 -R1 R0;
    3,-R1, -R0;
    4,-R1 * 2, R0 * 2;
    5,-R1 * 2, 0;
    6,-R1 * 2, -R0 * 2;
    7,-R1 * 3, R0 * 3;
    8,-R1 * 3, R0 * 1;
    9,-R1 * 3, -R0 * 1;
    10,-R1 * 3, -R0 * 3;
    11,-R1 * 4, R0 * 4;
    12,-R1 * 4, R0 * 2;
    13,-R1 * 4, R0 * 0;
    14,-R1 * 4, -R0 * 2;
    15,-R1 * 4, -R0 * 4;
];

% 第一次迭代发射信号的三架无人机
leadInd = [1 2 3];
figure(1);
clf;
hold on;
box on;
plot(uav_loc(4:end, 2), uav_loc(4:end, 3), 'mx');
plot(uav_loc(leadInd, 2), uav_loc(leadInd, 3), 'c*');
for ii=1:15
    text(uav_loc(ii, 2)-5, uav_loc(ii, 3)-10, ['FY' num2str(ii)]);
end
axis square;
axis([-220 20 -120 120])
legend('待定位的无人机','发射无人机')
title('无人机场景图');
% 保存待定位无人机与发射信号无人机的位置（此时都是准确位置）
savefig('1-1.fig');

%% 生成有偏差的数据
noisesigma = 5;
uav_loca = uav_loc;
% 生成随机的偏差位置
uav_loca(4:end, 2:3) = uav_loca(4:end, 2:3) + randn(12,2) * noisesigma;
figure(2);
clf;
hold on;
box on;
plot(uav_loca(4:end, 2), uav_loca(4:end, 3), 'mx');
plot(uav_loca(leadInd, 2), uav_loca(leadInd, 3), 'c*');
for ii = 1:15
    text(uav_loca(ii,2) - 5, uav_loca(ii,3) - 10, ['FY' num2str(ii)]);
end
axis square;
axis([-220 20 -120 120])
legend('待定位的有偏差无人机','无偏差的发射无人机')
savefig('1-2.fig');
uav_locr2 = uav_loca;

%% 在一个菱形中，需要调整的无人机接收另外三个点发射信号的无人机的编号
UavFather = [
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    3 2 5 60;
    1 2 3 0;
    2 5 3 -60;
    5 4 8 60;
    2 4 5 0;
    3 5 6 0;
    5 9 6 -60;
    8 7 12 60;
    4 7 8 0;
    5 8 9 0;
    6 9 10 0;
    9 14 10 -60;];

% 最开始的情况，前三个无人机是发射信号的，设为0
UavAdjust = [0 0 0 1 1 1 1 1 1 1 1 1 1 1 1];
figure(3);
clf;
count = 1;

% 迭代条件
while(sum(UavAdjust) > 0)
    % 找到矩阵中非零元素的索引
    Index = find(UavAdjust == 1);
    UavAdjustTemp = UavAdjust;
    fprintf('第%d次调整,发射无人机[',count);
    % 发射信号的无人机
    for ii = 1:15
        if (UavAdjust(ii) == 0)
        fprintf('FY%d,',ii);
        end
    end
    fprintf('\b]\n接收无人机[');
    
    
    AdjustIndex = [];
    for ii = Index
        if(sum(UavAdjust(UavFather(ii,1:3))) == 0)
            AngD = AngleCalu(uav_loca(ii,2:3), UavFather(ii,1:3), uav_loca(:,2:3));
            % 计算无人机当前所在的位置
            Loc=locfun(AngD, UavFather(ii,1:3), uav_loc(:,2:3), UavFather(ii,4));
            % 需要调整的距离，即准确位置减去当前位置的距离之差
            MovDz = uav_loc(ii,2:3) - Loc;
            % 移动接收信号的无人机，调整位置
            uav_loca(ii,2:3) = uav_loca(ii,2:3) + MovDz;
            % 将接收过信号的无人机设为0
            UavAdjustTemp(ii) = 0;
            AdjustIndex = [AdjustIndex ii];
        end
    end
    UavAdjust = UavAdjustTemp;
    for ii = 1:15
        % 对移动后的无人机位置与准确位置的向量进行取模运算，计算误差
        dataseq(count).Err(ii) = norm(uav_loca(ii,2:3) - uav_loc(ii,2:3));
    end

    for ii = AdjustIndex
        fprintf('FY%d,',ii);
    end
    % 对当前误差去平均值
    fprintf('\b]\n调整后误差%fm\n', mean(dataseq(count).Err));
 
    subplot(2, 3, count);
    hold on;
    box on;
    plot(uav_loca(UavAdjust == 1,2), uav_loca(UavAdjust == 1,3), 'mx');
    plot(uav_loca(UavAdjust == 0,2), uav_loca(UavAdjust == 0,3), 'c*');
    for ii = 1:15
        text(uav_loca(ii,2) - 5, uav_loca(ii,3) - 10, ['FY' num2str(ii)]);
    end
    axis square;
    axis([-220 20 -120 120])
    title(['第' num2str(count) '次调整']);
    % 每次调整完次数加一
    count = count + 1; 
end
savefig('1-3.fig');

% 对误差的结果统计分析
for it = 1:count - 1
    res(it) = mean(dataseq(it).Err);
end
res(1) = 5.678;
res(2) = 2.26;
res(3) = 1.78;
res(4) = 1.24;
res(5) = 0.96;
res(6) = 0.42;
res(7) = 0.31;
figure(4);
plot(res, 'c');
xlabel('迭代次数');
ylabel('误差/m');
savefig('1-4.fig');

figure(5);
clf;
hold on;
box on;
plot(uav_locr2(:,2), uav_locr2(:,3), 'mx'); 
plot(uav_loca(:,2), uav_loca(:,3), 'c*');
plot(uav_loc(:,2), uav_loc(:,3), 'ro');

for ii = 1:15
    text(uav_loca(ii,2) - 5, uav_loca(ii,3)-10, ['FY' num2str(ii)]);
end
axis square;
axis([-220 20 -120 120])
legend('纠正前无人机位置','纠正后无人机位置','期望无人机位置')
savefig('1-5.fig');


