function [b,A]=sun_azimuth(ts,n)
%本函数用于计算太阳高度角和太阳方位角
w=15*(ts-12);%时角    
r=23.45*sin(2*pi*(284+n)/365);%太阳直射纬度角
a=sin(41.01/180*pi)*sin(r/180*pi)+cos(40.01/180*pi)*cos(r/180*pi)*cos(w/180*pi);
b=asin(a);%太阳高度角
B=-sin(w/180*pi)*cos(r/180*pi)/cos(b);%太阳方位角的sin值
C=(sin(r/180*pi)-a*sin(40.01/180*pi))/cos(b)/cos(40.01*pi/180);
A=asin(B)/pi*180;