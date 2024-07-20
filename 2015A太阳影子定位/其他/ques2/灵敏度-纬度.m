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
A1 = 39;
A2 = 40;
A3 = 41;


% 经度
D = 116;

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
        Oh1 = asin(sin(A1*pi/180)*sin(F*pi/180) + cos(A1*pi/180)*cos(F*pi/180)*cos(C*pi/180));
        Oh2 = asin(sin(A2*pi/180)*sin(F*pi/180) + cos(A2*pi/180)*cos(F*pi/180)*cos(C*pi/180));
        Oh3 = asin(sin(A3*pi/180)*sin(F*pi/180) + cos(A3*pi/180)*cos(F*pi/180)*cos(C*pi/180));



        % 杆长 L = 3 m
        L = 3;
        
        
        
        L3 = 3.1;

        % 影长 Ls
        Ls1 = L/tan(Oh1);
        Ls2 = L/tan(Oh2);
        Ls3 = L/tan(Oh3);
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
title('纬度灵敏度分析');
legend('38°N' ,'40°N','42°N');





