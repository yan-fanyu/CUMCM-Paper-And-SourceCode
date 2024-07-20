clc;
clear;

% Φ -> A   纬度
% δ -> F   太阳赤道纬度夹角
% ω -> C   太阳时角
%  h -> Oh  太阳高度角
% λ -> D   经度

dB = [0.909541043	0.906049014	0.900872887	0.897969489	0.893046127	0.887167053	0.884149304	0.876983995	0.872571801	0.866083489	0.860234734	0.853663332	0.847169536	0.841329236	0.833261206	0.827336861	0.819957272	0.813116998	0.805282613	0.798637273
];
dLs = [3.533142184	3.546768029	3.561797643	3.578100715	3.595750783	3.61493428	3.635425983	3.657218272	3.680541115	3.705167836	3.731278025	3.758917911	3.788087888	3.818701015	3.850809619	3.88458522	3.919911828	3.956875992	3.99553479	4.035750835	4.077863059
];
Jm = 120;

hour = [13	13	13	13	13	13	13	13	13	13	13	13	13	13	13	13	13	14	14	14	14
];
minutes = [9	12	15	18	21	24	27	30	33	36	39	42	45	48	51	54	57	0	3	6	9
];

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
for L = 1.5:0.1:5
    L
    % 纬度
    for W = -50:0.1:50y
        % 经度
        for J = 105:0.1:115
            for n = 1:1:365
                
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
            
                if (value < 0.000001)
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









