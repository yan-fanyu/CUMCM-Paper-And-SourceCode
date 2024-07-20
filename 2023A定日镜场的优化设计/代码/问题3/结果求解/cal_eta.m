function eta = cal_eta(dhr,eta_cos,eta_sb,eta_trunc)
%yita 定日镜的光学效率
%shadowloss 阴影遮挡损失
%inline 入射光线向量
%nvec 法线向量
%dhr 镜面中心到集热器中心距离
%Er 集热器接受的能量
%Ef 镜面全反射能量
%El 阴影遮挡损失能量
if dhr <= 1000
    eta_at = 0.99321 - 0.0001176 * dhr + 0.0000000197 * dhr^2 ;
else 
    eta_at = exp(-0.0001106 * dhr); %来自参考文献
end
eta = eta_sb * eta_cos * eta_at * eta_trunc * 0.92;
end

