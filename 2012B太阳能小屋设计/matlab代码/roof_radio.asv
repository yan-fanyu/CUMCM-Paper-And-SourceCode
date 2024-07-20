function cant_radio=roof_radio()
%本函数用于计算屋顶所接受到的辐射
%level_radio表示水平总辐射
%scattering_radio表示水平总散射
%vertical_radio表示垂直总辐射
%a表示太阳高度角
%A表示太阳方位角
%b表示屋顶的倾角
%cant_radio代表屋顶所受的辐射
%
X=xlsread('weather.xls','B1:D8760');
Y=xlsread('weather.xls','I1:J8760');
ts=Y(:,1)+1;
n=ceil((Y(:,2)+1)/24);
level_radio=X(:,1);
scattering_radio=X(:,2);
vertical_radio=X(:,3);
[m,o]=size(X);
a(m)=0;A(m)=0;c(m)=0;C(m)=0;cant_radio(m)=0;
for i=1:m
    if vertical_radio(i)>0
       u=ts(i);
       v=n(i);
       [j,k]=sun_azimuth(u,v);
       a(i)=j;A(i)=k;
    end
end
for i=1:m
    c(i)=(1+tan(0.1845)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(0.1845)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
    cant_direct(i)=abs(c(i))*vertical_radio(i);
    cant_radio(i)=cant_direct(i)+scattering_radio(i);
end