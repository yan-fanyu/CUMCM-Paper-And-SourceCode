% 根据输入的（n,3）的点列索引，在new_axis中找到组成三角形的三个点，并且计算：各个三角形的法向量；各个三角形反射光线方向向量；
% 各个三角形在馈源仓平面的投影，以及所有三角形与馈源仓交集区域的总面积（作为光线吸收率的重要指标）
% A = "A0";
% temp = string(new_axis(:,1));
% [i,j] = find(strcmp(A, temp));

function [j_angle, j_line, temp_a, temp_b, temp_c, valid_num, sum_area] = triangle_calculator(new_fit_index)
    global new_axis;
    j_line = zeros(length(new_fit_index),3);
    light_normal_vector = zeros(length(new_fit_index(:,1)),3);
    global temp_a;
    global temp_b;   
    global temp_c;
    global new_axis;
    x_in  = zeros(length(new_fit_index(:,1)),1); 
    y_in  = zeros(length(new_fit_index(:,1)),1);
    z_in  = zeros(length(new_fit_index(:,1)),1);
    x_zp  = zeros(length(new_fit_index(:,1)),3); 
    y_zp  = zeros(length(new_fit_index(:,1)),3);
    z_p = -160.2;
    sum_area = 0;
    valid_num = 0;
    D = zeros(length(new_fit_index),1);
    for i = 1:length(new_fit_index(:,1))
%         start_points = [new_axis(new_fit_index(i,1),1:3);new_axis(new_fit_index(i,2),1:3);new_axis(new_fit_index(i,3),1:3)];
%         end_points = [new_axis(new_fit_index(i,1),1:3);new_axis(new_fit_index(i,2),1:3);new_axis(new_fit_index(i,3),1:3)];
%         X=[start_points(:,1)  end_points(:,1)]'; 
%         Y=[start_points(:,2)  end_points(:,2)]';
%         Z=[start_points(:,3)  end_points(:,3)]';
%         line(X, Y ,Z)
%         获取同一个面的三个点坐标
        temp_a(i,:) = new_axis(new_fit_index(i,1),1:3);
        temp_b(i,:) = new_axis(new_fit_index(i,2),1:3);
        temp_c(i,:) = new_axis(new_fit_index(i,3),1:3);
%         求解平面的法向量
        j_line(i, 1) = (temp_b(i,2) - temp_a(i,2))*(temp_c(i,3) - temp_a(i,3)) - (temp_b(i,3) - temp_a(i,3))*(temp_c(i,2) - temp_a(i,2));
        j_line(i, 2) = (temp_c(i,1) - temp_a(i,1))*(temp_b(i,3) - temp_a(i,3)) - (temp_b(i,1) - temp_a(i,1))*(temp_c(i,3) - temp_a(i,3));
        j_line(i, 3) = (temp_b(i,1) - temp_a(i,1))*(temp_c(i,2) - temp_a(i,2)) - (temp_c(i,1) - temp_a(i,1))*(temp_b(i,2) - temp_a(i,2));
        if j_line(i,3) < 0 
            j_line(i,:) = -j_line(i,:);
        end
        D(i,1) = - (j_line(i, 1)*temp_a(i,1) + j_line(i, 2)*temp_a(i,2) + j_line(i, 3)*temp_a(i,3));
    end
%   求解法向量和z轴的夹角
    j_angle = zeros(length(new_fit_index(:,1)),1);
    for i = 1:length(new_fit_index(:,1))
        j_angle(i,1) = acosd(abs(j_line(i,3)/sqrt(j_line(i,1)^2 + j_line(i,2)^2 + j_line(i,3)^2)));
    end
%   求解反射光线的方向
    for i = 1:length(new_fit_index(:,1))
        light_normal_vector(i,1) = j_line(i, 1);
        light_normal_vector(i,2) = j_line(i, 2);
        light_normal_vector(i,3) = j_line(i, 3) - sqrt(j_line(i,1)^2 + j_line(i,2)^2 + j_line(i,3)^2)/(2*cosd(j_angle(i)));
%         求解交点
        x_in(i,1) = -(j_line(i, 1)*(j_line(i, 3)*z_p + D(i,1))/(j_line(i, 1)^2 + j_line(i, 2)^2 + j_line(i, 3)*light_normal_vector(i,3)));
        y_in(i,1) = -(j_line(i, 2)*(j_line(i, 3)*z_p + D(i,1))/(j_line(i, 1)^2 + j_line(i, 2)^2 + j_line(i, 3)*light_normal_vector(i,3)));
        z_in(i,1) = ((j_line(i, 1)^2 + j_line(i, 2)^2)*z_p - light_normal_vector(i,3)*D(i,1))/(j_line(i, 1)^2 + j_line(i, 2)^2 + j_line(i, 3)*light_normal_vector(i,3));
%         通过公式查看交点是否在三角形内部，假如在内部则计数加1
% u = ((v1•v1)(v2•v0)-(v1•v0)(v2•v1)) / ((v0•v0)(v1•v1) - (v0•v1)(v1•v0))
% 
% v = ((v0•v0)(v2•v1)-(v0•v1)(v2•v0)) / ((v0•v0)(v1•v1) - (v0•v1)(v1•v0))
        v0 = temp_c(i,:) - temp_a(i,:);
        v1 = temp_b(i,:) - temp_a(i,:);
        v2 = [x_in(i,1),y_in(i,1),z_in(i,1)] - temp_a(i,:);
        U =  (dot(v1, v1)*dot(v2, v0) - dot(v1, v0)*dot(v2, v1)) / (dot(v0, v0)*dot(v1, v1) - dot(v0, v1)*dot(v1, v0));
        V =  (dot(v1, v1)*dot(v2, v0) - dot(v1, v0)*dot(v2, v1)) / (dot(v0, v0)*dot(v1, v1) - dot(v0, v1)*dot(v1, v0));
        if U >= 0 && V >= 0 && U+V <= 1
            valid_num = valid_num + 1;
        end
    end
%     计算经过三角形的反射光线到zp平面的投影
    for i = 1:length(new_fit_index(:,1))
        x_zp(i,1) = light_normal_vector(i,1)/light_normal_vector(i,3)*(z_p - temp_a(i,3)) + temp_a(i,1);
        x_zp(i,2) = light_normal_vector(i,1)/light_normal_vector(i,3)*(z_p - temp_b(i,3)) + temp_b(i,1);
        x_zp(i,3) = light_normal_vector(i,1)/light_normal_vector(i,3)*(z_p - temp_c(i,3)) + temp_c(i,1);
        y_zp(i,1) = light_normal_vector(i,2)/light_normal_vector(i,3)*(z_p - temp_a(i,3)) + temp_a(i,2);
        y_zp(i,2) = light_normal_vector(i,2)/light_normal_vector(i,3)*(z_p - temp_b(i,3)) + temp_b(i,2);
        y_zp(i,3) = light_normal_vector(i,2)/light_normal_vector(i,3)*(z_p - temp_c(i,3)) + temp_c(i,2);
    end
    
%    计算所有三角形与馈源仓的交集面积之和
    circle_x = zeros(1000,1);
    cirlce_y = zeros(1000,1);
    theta = 2*pi/1000;
    for i = 1:1000
        circle_x(i,1) = 0.5*cos((i-1)*theta);
        cirlce_y(i,1) = 0.5*sin((i-1)*theta);
    end
    circle = polyshape(circle_x, cirlce_y);
    for i = 1:length(new_fit_index(:,1))
        poly1 = polyshape(x_zp(i,:), y_zp(i,:));
        polyout = intersect(circle, poly1);
        single_area = area(polyout);
        single_area = single_area * cosd(j_angle(i))*light_normal_vector(i,3)/...
            (sind(j_angle(i))*sqrt(norm(light_normal_vector(i,:))^2 - light_normal_vector(i,3)^2) + cosd(j_angle(i))*light_normal_vector(i,3));
        sum_area = sum_area + single_area;
    end
end

