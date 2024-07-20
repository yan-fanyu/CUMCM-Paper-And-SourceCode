% 尝试将问题二转化为问题一，生成旋转矩阵，运行第二问的程序首先需要运行该脚本

beta_2 = 78.169;
alpha_2 =36.795;
r_mat = [sind(alpha_2), -cosd(alpha_2), 0;
        sind(beta_2)*cosd(alpha_2), sind(beta_2)*sind(alpha_2), -cosd(beta_2);
        cosd(beta_2)*cosd(alpha_2), cosd(beta_2)*sind(alpha_2), sind(beta_2)];
r_base_axis = zeros(length(base_axis), 3);
inv_r_base_axis = zeros(length(base_axis), 3);
couple = zeros(length(base_axis), 2);
index = 1;
base_axis = cell2mat(angle_1(:,2:4));
% 将原来的基准面向目标光线旋转
for i = 1:length(base_axis)
    r_base_axis(i,:) = base_axis(i,:)*r_mat;
end
% 将轴旋转至和目标光线平行，
for i = 1:length(base_axis)
    inv_r_base_axis(i,:) = base_axis(i,:)/r_mat;
end
% 验证是否配对
for i = 1:length(base_axis)
   for j = 1:length(base_axis)
    if abs(r_base_axis(i,1) - base_axis(j,1)) < 0.001 && abs(r_base_axis(i,2) - base_axis(j,2)) < 0.001 ...
        && abs(r_base_axis(i,3) - base_axis(j,3)) < 0.001
        couple(index,1) = j;
        couple(index,2) = i;
        index = index + 1;
    end
   end 
end

