% 供测试使用
% A = "A0";
% temp = string(angle_1(:,1));
% [i,j] = find(strcmp(A, temp));

% 测试精度查询
% test_temp = cell2mat(angle_1(:,5));
% test_zeros = zeros(2226,1);
% for i = 1:length(unique_angle)
%     unique_angle(i)
%     angle_x = find(abs(test_temp - unique_angle(i)) < 0.0001);
%     for j = 1:length(angle_x)
%         test_zeros(angle_x(j),1) = 1;
%     end
% end

% A = table("A3")
% table(angle_tab(:,1))
% [Lia, Locb] = ismember(A, angle_tab(:,1));

% a = [1 1 0;0 1 0];
% a(find(a==0))=[];

% test_data = 0.1: 0.1: 0.6

% 测试利用多边形相交面积来计算三角形和圆交集部分的面积
% poly1 = polyshape([0 2 4], [0 2 0]);
% plot(poly1)
% hold on
% test_theta = 2*pi/1000;
% test_x = zeros(1000,1);
% test_y = zeros(1000,1);
% for i = 1:1000
%     test_x(i,1) = 2*cos((i-1)*test_theta);
%     test_y(i,1) = 2*sin((i-1)*test_theta);
% end
% poly2 = polyshape(test_x, test_y);
% % plot(poly2)
% % hold off
% polyout = intersect(poly1, poly2);
% print_test = area(polyout)


% global update_length
% update_length(update_length == 0) = [];
% test_array = [1,1,1,1;0,0,0,0;1,1,1,1];
% test_array(all(test_array==0,2),:) = []; 


% for i = 1:12
%     temp_update_length = update_length(:,i);
%     temp_update_length(temp_update_length == 0) = [];
%     ans_update_length(:,i) = temp_update_length;
% end
% update_length = ans_update_length;

a = 1:5;
b = a(1,2:end)






