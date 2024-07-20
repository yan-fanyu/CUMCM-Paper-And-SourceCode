function  [mir_x,mir_y,mir_z] = result(ret)
    for i = 1 : 2 : 55
        for k = 1 : 50
            mir_x(i,k) = ret(:,i) * cos(k * pi / 25);
            mir_y(i,k) = ret(:,i) * sin(k * pi / 25);
            mir_z(i,k) = ret(:,end) ;
        end
    end
    for i = 2 : 2 : 55
        for k = 1 : 50
            mir_x(i,k) = ret(:,i) * cos(( 2 * k * pi + pi)/50);
            mir_y(i,k) = ret(:,i) * sin((2 * k * pi + pi)/50);
            mir_z(i,k) = ret(:,end) ;
        end
    end
end

