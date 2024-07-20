clc;
clear;

% Φ -> A   纬度
% δ -> F   太阳赤道纬度夹角
% ω -> C   太阳时角
%  h -> Oh  太阳高度角
% λ -> D   经度
%

% 10月22日北京时间9:00-15:00

% 10月22日是一年的第 295 天
n = 295.0;




%地理位置 北纬39度54分26秒,东经116度23分29秒
% 纬度
A = 39 + 54/60 + 26/3600;
% 经度
D = 116 + 23/60 + 29/3600;
% 时区经度
Dm = 120;

% 太阳赤纬夹角（度）
F = 23.45*sin(2*pi*(284+n)/365);

% 太阳时
B = 2*pi*(n -81)/364;
E = 9.87*sin(2*B) - 7.53*cos(B) - 1.5*sin(B); 

i = 0;

LsArr1 = [];
LsArr2 = [];
LsArr3 = [];



% T0： m 时 n 分  
% 9:00-15:00
% m = [9, 15]  n = [0, 59]
for m = 9:1:14
    for nn = 0:10:59
        i = i +1;
        I(i) = m+nn/60;
        
        T0 = m + nn/60;
        Ts = T0 + E/60 + (D - Dm)/15;
        % 太阳时角（度）
        C = 15*(Ts - 12);


        % 太阳高度角
        Oh = asin(sin(A*pi/180)*sin(F*pi/180) + cos(A*pi/180)*cos(F*pi/180)*cos(C*pi/180));



        % 杆长 L = 3 m
        L2 = 3;
        L1 = 2.9;
        
        
        
        L3 = 3.1;

        % 影长 Ls
        Ls1 = L1/tan(Oh);
        Ls2 = L2/tan(Oh);
        Ls3 = L3/tan(Oh);
        LsArr1(i) = Ls1;
        LsArr2(i) = Ls2;
        LsArr3(i) = Ls3;
    end
end


plot(I, LsArr1);
hold on;
plot(I, LsArr2);
hold on;
plot(I, LsArr3);
%axis([9 15 22 40]);
xlabel('时间');
ylabel('影子长度');
title('杆长灵敏度分析');
legend('杆长2.9m' ,'杆长3m','杆长3.1m');





