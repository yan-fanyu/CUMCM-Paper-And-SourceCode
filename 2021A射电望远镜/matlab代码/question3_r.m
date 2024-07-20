% 计算每个符合条件反射面板的法向量以及法向量与z轴的夹角

axis_1 = zeros(4300,1);
axis_2 = zeros(4300,1);
axis_3 = zeros(4300,1);
fit_triangle = zeros(4300,3);
belong_index = 0;

for i = 1:4300
    a = triangle(i,1);
    a = string(a);
    axis_1(i,1) = find(strcmp(a, point_name));
    b = triangle(i,2);
    b = string(b);
    axis_2(i,1) = find(strcmp(b, point_name));
    c = triangle(i,3);
    c = string(c);
    axis_3(i,1) = find(strcmp(c, point_name));
end
% 找到符合半径条件的反射面板，若三角形三个点全在光照区域内，视作有效顶点
for i = 1:4300
%     等于0代表该点无效
    pre_1 = (new_axis(axis_1(i,1),2) == 0);
    pre_2 = (new_axis(axis_2(i,1),2) == 0);
    pre_3 = (new_axis(axis_3(i,1),2) == 0);
%     mat_angle_1 = cell2mat(angle_1(:,5));
%     belong_index = belong_index + (abs(mat_angle_1(axis_1(i,1),1)) > 60) + (abs(mat_angle_1(axis_2(i,1),1)) > 60) + (abs(mat_angle_1(axis_3(i,1),1)) > 60);
    if pre_1 + pre_2 + pre_3 == 0
        fit_triangle(i,1) = axis_1(i,1);
        fit_triangle(i,2) = axis_2(i,1);
        fit_triangle(i,3) = axis_3(i,1);
    end
%     belong_index = 0;
end
% 去除不满足条件的三角面板（去除0值）
fit_triangle = fit_triangle(any(fit_triangle,2),:);

[new_angle, new_line, temp_a, temp_b, temp_c, valid_num, area_r] = triangle_calculator(fit_triangle);




