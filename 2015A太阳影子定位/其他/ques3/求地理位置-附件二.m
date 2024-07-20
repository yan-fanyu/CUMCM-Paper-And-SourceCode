clc;
clear;

% Φ -> A   纬度
% δ -> F   太阳赤道纬度夹角
% ω -> C   太阳时角
%  h -> Oh  太阳高度角
% λ -> D   经度

dB = [0.918623526	0.944000767	0.966801009	0.994166838	1.012283158	1.046853791	1.071045389	1.097061852	1.127405199	1.159996144	1.191548883	1.225531726	1.254788569	1.290149918	1.331772011	1.362830448	1.399931432	1.446251384	1.481107264	1.522542777];
dLs = [1.247256205	1.22279459	1.198921486	1.175428964	1.152439573	1.12991747	1.10783548	1.086254206	1.065081072	1.044446265	1.024264126	1.004640314	0.985490908	0.966790494	0.948584735	0.930927881	0.91375175	0.897109051	0.880973762	0.865492259	0.850504468];

Jm = 120;

hour = [12	12	12	12	12	12	12	13	13	13	13	13	13	13	13	13	13	13	13	13	13];
minutes = [41	44	47	50	53	56	59	2	5	8	11	14	17	20	23	26	29	32	35	38	41];

value1 = 0;
value2 = 0;

j = 1;

X = [];
Y = [];

MinArr = ones(1,6);
dFsArr = [];

LsArr = [];

dFsArrr = ones(1, 20);

LsArrr = ones(1, 21);

% 199 2 40 81
% 杆长
for L = 1:0.1:3
    L
    % 纬度
    for W = 35:0.1:45
        % 经度
        for J =75:0.1:85
            for n = 150:1:250
                
                % 太阳赤纬夹角（度）
                C = 23.45*sin(2*pi*(284+n)/365);

                % 太阳时
                B = 2*pi*(n -81)/364;
                E = 9.87*sin(2*B) - 7.53*cos(B) - 1.5*sin(B); 
                
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
                
                
                end
                value = value1/20*value2/21;
            
                if (value < 0.0000001)
                    X(j) = j;
                    j
                    Y(j) = value;
                    LsArrr(j, :) = LsArr;
                    dFsArrr(j, :) = dFsArr*180/pi;
                    MinArr(j , 1:6) = [j n L W J value];
                    j = j+1;
                end
            
                value1 = 0;
                value2 = 0;
                value = 0;
                
            end
               
        end
    end
end




plot(X, Y,'*');









