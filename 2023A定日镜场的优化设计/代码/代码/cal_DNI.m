function DNI = cal_DNI(alps)
% DNI 法向直接辐射辐照度
% alps 太阳高度角
    H = 3.0 ;
    a = 0.4237 - 0.00821 * (6 - H)^2;
    b = 0.5055 + 0.00595 * (6.5 - H)^2 ;
    c = 0.2711 + 0.01858 * (2.5 - H)^2 ;
    DNI = 1.366 * (a + b * exp(-c/(sin(alps))));
end

