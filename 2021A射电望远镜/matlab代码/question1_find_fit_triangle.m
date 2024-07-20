% 计算符合光照条件的点在angle_1中的索引，存储在fit_triangle 中

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
% 找到符合半径条件的反射面板，有若三角形有两个点都在口径范围内，则视为满足条件
for i = 1:4300
    mat_angle_1 = cell2mat(angle_1(:,5));
%     belong_index = belong_index + (abs(mat_angle_1(axis_1(i,1),1)) > 60) + (abs(mat_angle_1(axis_2(i,1),1)) > 60) + (abs(mat_angle_1(axis_3(i,1),1)) > 60);
    if axis_1(i,1) <= length(update_length(:,1)) && axis_2(i,1) <= length(update_length(:,1)) && axis_3(i,1) <= length(update_length(:,1))
        fit_triangle(i,1) = axis_1(i,1);
        fit_triangle(i,2) = axis_2(i,1);
        fit_triangle(i,3) = axis_3(i,1);
    end
end
% 去除不满足条件的三角面板（去除0值）
fit_triangle = fit_triangle(any(fit_triangle,2),:);






