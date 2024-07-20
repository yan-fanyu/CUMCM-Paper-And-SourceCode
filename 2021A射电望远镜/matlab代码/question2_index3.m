% 根据update_length伸长量来计算移动后的坐标索引,计算得到的索引存在new_axis中

new_axis = zeros(2226,3);
r_new_axis = zeros(2226,3);
dl_index = 1:5;
index_3 = zeros(length(dl_index),1);

global o;
for i = 1:length(o)
   if inv_r_base_axis(i,1) < 0 
       o(i,2) = o(i,2) + 180;
   end
end

for i = 1:length(dl_index)
    for j = 1:length(update_length) 
       new_axis(j,1) = update_length(j,dl_index(i))*cosd(o(j,1))*cosd(o(j,2));
       new_axis(j,2) = update_length(j,dl_index(i))*cosd(o(j,1))*sind(o(j,2));
       new_axis(j,3) = update_length(j,dl_index(i))*sind(o(j,1));
    end
%     new_axis(1,1) = 0;
%     new_axis(1,2) = 0;
%     [new_angle, new_line, temp_a, temp_b, temp_c, index_3] = triangle_calculator(fit_triangle);
end
global r_mat;
for i = 1:length(update_length)
    r_new_axis(i,:) = new_axis(i,:)*r_mat;
end

plot3(r_new_axis(:,1),r_new_axis(:,2),r_new_axis(:,3),'r*');

% 生成一个有空位的元胞数组存储符合条件的结点，用于索引
global angle_1
fit_point_name_2 = cell(length(r_new_axis()),1);
for i = 1:length(r_new_axis(:,1))
    if r_new_axis(i,1) ~= 0
       fit_point_name_2(i,1) = angle_1(i,1);
    end
end
fit_point_name_2_nan = fit_point_name_2;
% 生成一个没有空位的元胞数组存储符合条件的节点，用于计数
fit_point_name_2(cellfun(@isempty,fit_point_name_2)) = [];
