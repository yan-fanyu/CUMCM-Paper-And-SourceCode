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
n1 = 293;
n2 = 295;
n3 = 297;




%地理位置 北纬39度54分26秒,东经116度23分29秒
% 纬度

A = 40;



% 经度
D = 116;

% 时区经度
Dm = 120;

% 太阳赤纬夹角（度）
F1 = 23.45*sin(2*pi*(284+n1)/365);
F2 = 23.45*sin(2*pi*(284+n2)/365);
F3 = 23.45*sin(2*pi*(284+n3)/365);

% 太阳时
B1 = 2*pi*(n1 -81)/364;
B2 = 2*pi*(n2 -81)/364;
B3 = 2*pi*(n3 -81)/364;
E1 = 9.87*sin(2*B1) - 7.53*cos(B1) - 1.5*sin(B1); 
E2 = 9.87*sin(2*B2) - 7.53*cos(B2) - 1.5*sin(B2); 
E3 = 9.87*sin(2*B3) - 7.53*cos(B3) - 1.5*sin(B3); 

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
        
        Ts1 = T0 + E1/60 + (D - Dm)/15;
        Ts2 = T0 + E2/60 + (D - Dm)/15;
        Ts3 = T0 + E3/60 + (D - Dm)/15;
        % 太阳时角（度）
        C1 = 15*(Ts1 - 12);
        C2 = 15*(Ts2 - 12);
        C3 = 15*(Ts3 - 12);


        % 太阳高度角
        Oh1 = asin(sin(A*pi/180)*sin(F1*pi/180) + cos(A*pi/180)*cos(F1*pi/180)*cos(C1*pi/180));
        Oh2 = asin(sin(A*pi/180)*sin(F2*pi/180) + cos(A*pi/180)*cos(F2*pi/180)*cos(C2*pi/180));
        Oh3 = asin(sin(A*pi/180)*sin(F3*pi/180) + cos(A*pi/180)*cos(F3*pi/180)*cos(C3*pi/180));



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
title('日期灵敏度分析');
legend('10月20日' ,'10月22日','10月24日');





