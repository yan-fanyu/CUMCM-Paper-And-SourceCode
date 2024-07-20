function  [mir_x,mir_y,mir_z] = result(ret)
%RESULT 此处显示有关此函数的摘要
%   此处显示详细说明
    for i = 1 : 2 : 55
        for k = 1 : 50
            mir_x(i,k) = ret(:,i) * cos(k * pi / 25);
            mir_y(i,k) = ret(:,i) * sin(k * pi / 25);
            mir_z(i,k) = ret(:,78+floor((i - 1)/5)) ;
        end
    end
    for i = 2 : 2 : 55
        for k = 1 : 50
            mir_x(i,k) = ret(:,i) * cos(( 2 * k * pi + pi)/50);
            mir_y(i,k) = ret(:,i) * sin((2 * k * pi + pi)/50);
            mir_z(i,k) = ret(:,78+floor((i - 1)/5)) ;
        end
    end
%     writematrix(mir_x,'第二问坐标.xlsx','Sheet',1,'Range','A2 :A2751');
%     writematrix(mir_y,'第二问坐标.xlsx','Sheet',1,'Range','B2 :B2751');
%     writematrix(mir_z,'第二问坐标.xlsx','Sheet',1,'Range','C2 :C2751');
end

