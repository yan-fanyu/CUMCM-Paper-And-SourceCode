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
W = 39 + 54/60 + 26/3600;
% 经度
J = 116 + 23/60 + 29/3600;
% 时区经度
Jm = 120;

% 太阳赤纬夹角（度）
F = 23.45*sin(2*pi*(284+n)/365);

% 太阳时
B = 2*pi*(n -81)/364;
E = 9.87*sin(2*B) - 7.53*cos(B) - 1.5*sin(B); 

ii = 0;

X = [];



% T0： m 时 n 分  
% 9:00-15:00
% m = [9, 15]  n = [0, 59]
for m = 9:1:14
    for nn = 0:10:59
        ii = ii +1;
        X(ii) = m+nn/60;
        Hour(ii) = m;
        Minute(ii) = nn;
        
        T0 = m + nn/60;
        Ts = T0 + E/60 + (J - Jm)/15;
        % 太阳时角（度）
        C = 15*(Ts - 12);
        


        % 太阳高度角
        Oh = asin(sin(W*pi/180)*sin(F*pi/180) + cos(W*pi/180)*cos(F*pi/180)*cos(C*pi/180));

        Ohh = Oh*180/pi;
        
        HH(ii) = Ohh;

        % 杆长 L = 3 m
        L = 3;

        % 影长 Ls
        Ls = L/tan(Oh);
        LsArr(ii) = Ls;
    end
end




plot(X, LsArr, 'red');
%axis([9 15 22 40]);
xlabel('时间');
ylabel('影子长度');
title('时间--影长');





