function [alps,gams] = cal_alps_gams(D,phi,ST)
% alps 太阳高度角
% gams 太阳方位角
% D 为以春分作为第 0 天起算的天数，例如， 若春分是 3 月 21 日，则 4 月 1 日对应 𝐷 = 11
% ST 为当地时间
% del 太阳赤纬角
% phi 当地纬度 北纬为正
% ome 太阳时角
    ome = (pi/12) * (ST - 12) ;
    del = asin( sin(2*pi*D/365) * sin(2*pi*23.45/365)) ;
    alps = asin(cos(del) * cos(phi) * cos(ome) + sin(del) * sin(phi)) ;
    gams = acos((sin(del) - sin(alps) * sin(phi)) / ( cos(alps) * cos(phi))) ;
end

