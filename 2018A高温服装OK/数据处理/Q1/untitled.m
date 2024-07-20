clc;clear;close all;
%  [FJ2,FJ2_text]=xlsread('A.xlsx','附件2');
% T0=FJ2(:,2); %初始各点的温度，T0(1)是0时的温度
%  save FJ_2
 load FJ_2.mat
%有限差分法，隐式
arg_min=1e6;
L1=0.6;L2=6;L3=3.6;L4=5;
T_en=75;tt=5400;
h2=8.374;
for h1=116:0.01:118
[T]=qiujie(L1,L2,L3,L4,h1,h2,T_en,tt);
TT=[FJ2(:,1),T(end,:)'];%模拟人的温度变化
arg=norm(TT(:,2)-FJ2(:,2))^2;
if arg<arg_min
    arg_min=arg;
    h_1=h1;
    h_2=h2;
    TT_2=TT;
end
end
%拟合优度计算
SST=norm(FJ2(:,2)-mean(FJ2(:,2)))^2;
SSE=arg_min;
R=1-SSE/SST;
%绘图
figure('Color','w')
plot(1:5401,TT_2(:,2),'b','LineWidth',1.5);
hold on
plot(1:5401,FJ2(:,2),'r:','LineWidth',1.5);
legend('模拟值','实验值')
xlabel('时间(秒)');ylabel('温度(摄氏度)')