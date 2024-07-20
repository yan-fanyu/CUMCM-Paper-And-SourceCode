clc;
clear;

% Φ -> A   纬度
% δ -> F   太阳赤道纬度夹角
% ω -> C   太阳时角
%  h -> Oh  太阳高度角
% λ -> D   经度

dB = [0.4555 	0.4409 	0.4247 	0.4136 	0.3986 	0.3919 	0.3777 	0.3656 	0.3582 	0.3481 	0.3438 	0.3305 	0.3264 	0.3169 	0.3120 	0.3069 	0.2987 	0.2928 	0.2876 	0.2853 	];

dLs = [1.1496 	1.1822 	1.2153 	1.2491 	1.2832 	1.3180 	1.3534 	1.3894 	1.4262 	1.4634 	1.5015 	1.5402 	1.5799 	1.6201 	1.6613 	1.7033 	1.7462 	1.7901 	1.8350 	1.8809 	1.9279 ];

% 4月18日是一年的第 108 天
n = 108;

% 太阳赤纬夹角（度）
C = 23.45*sin(2*pi*(284+n)/365);

% 太阳时
B = 2*pi*(n -81)/364;
E = 9.87*sin(2*B) - 7.53*cos(B) - 1.5*sin(B); 

Jm = 120;

hour = [14	14	14	14	14	14	15	15	15	15	15	15	15	15	15	15	15	15	15	15	15];
minutes = [42	45	48	51	54	57	0	3	6	9	12	15	18	21	24	27	30	33	36	39	42];

value1 = 0;
value2 = 0;

min = 100000000;



j = 1;

X = [];
Y = [];

MinArr = ones(12,5);
dFsArr = [];

LsArr = [];

DD = ones(12, 20);

LsArrr = ones(12, 21);
% 杆长
for L = 0:0.1:3
    % 纬度
    for W = 15:0.1:25
        % 经度
        for J = 105:0.1:115
            % 时间
            for i = 1:1:21
                
                T0 = hour(i) + minutes(i)/60;
                Ts = T0 + E/60 + (J - Jm)/15;
            
                % 太阳时角（度）
                S = 15*(Ts - 12);

                % 太阳高度角
                Oh = asin(sin(W*pi/180)*sin(C.*pi/180) + cos(W*pi/180)*cos(C*pi/180)*cos(S*pi/180));

                % 太阳方位角
                if(S <0)
                    Fs = acos(  (sin(C*pi/180) - sin(Oh)*sin(W*pi/180)) / (cos(Oh)*cos(W*pi/180)));
                    FsArr(i) = Fs;
                else
                    Fs = 2*pi - acos(  (sin(C*pi/180) - sin(Oh)*sin(W*pi/180)) / (cos(Oh)*cos(W*pi/180)));
                    FsArr(i) = Fs;
                end
                
                if(i >= 2)
                    value1 = value1 + (  FsArr(i-1) - FsArr(i) - dB(i - 1) )^2;
                    dFsArr(i-1) = FsArr(i-1) - FsArr(i);
                end
                
                % 影长 Ls
                Ls = L / tan(Oh);
                
                LsArr(i) = Ls;
                
                value2 = value2 + (Ls - dLs(i))^2;


                i = i +1;
                
            end
            
            value = value1/20*value2/21;
            %if(value < min)
                %min = value;
                %MinArr = [L W J]
            %end
            
            if (value < 0.0000003)
                X(j) = j;
                j
                Y(j) = value;
                LsArrr(j, :) = LsArr;
                DD(j, :) = dFsArr*180/pi;
                MinArr(j , 1:5) = [j L W J value];
                j = j+1;
            end
            
            
            
            value1 = 0;
            value2 = 0;
            value = 0;
            
               
        end
    end
end




plot(X, Y,'*');









