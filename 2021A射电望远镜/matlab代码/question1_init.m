% 一些变量的初始化
surface_1 = surface.';
o = zeros(2226,2);
rad = zeros(2226,2);
for i = 1:2226
    x = surface(i,1);
    y = surface(i,2);
    z = surface(i,3);
    beta_d = asind(z/sqrt(x^2+y^2+z^2));
    theta_d = atand(y/x);
    beta = asin(z/sqrt(x^2+y^2+z^2));
    theta = atan(y/x);
    o(i,1) = real(beta_d);
    o(i,2) = real(theta_d); 
    rad(i,1) = real(beta);
    rad(i,2) = real(theta);
end

z0 = -300.4;
F = 139.8;
unique_rad = unique(rad(:,1));
unique_angle = unique(o(:,1));
update_length = zeros(2226,1);
for i = 2:length(unique(rad(:,1)))
    if abs(unique_rad(i)) < pi/3 
%             由于光照区域角度是60度，所以大于一定角度的点直接舍去,根据角度索引筛出符合条件的点
%             将不在光照区域内的角度除去
        unique_rad(i) = 0;
        unique_angle(i) = 0;
        continue;
    end
end
%  去除不满足的点
unique_rad(unique_rad == 0) = [];
unique_angle(unique_angle == 0) = [];
% 首次成功的顶点移动距离
first_success_dl = 0;
begin = 0.1;
pace = 0.1;
final = 0.6;
num = ((final - begin)/pace + 1)*2;
sum = zeros(1,num);
show_length = zeros(1,length(unique_rad));