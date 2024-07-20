function [flag] = E_limit( lenchrom, bound, ret, alps, gams)
%lenchrom   input:染色体长度
%bound      input:变量的取值范围
%code       input:染色体的编码值
%flag      output:可行性标志变量
flag = 0;
eta_cos = 0;
DNI_ave = 0.9686 ;
eta_sb = 0.95;
eta_ref = 0.92;
for i = 1 : 55
    eta_at = 0.99321 - 0.000176 * sqrt(ret(:,i)^2 + (ret(:,end) - 80)^2) + 0.0000000197*(ret(:,i)^2 + (ret(:,end) - 80)^2);
    for j = 1 : 12
        for k = 1 : 5
            eta_cos = eta_cos + 25 + 25*dot([-cos(alps(j,k)) * sin(gams(j,k)), -cos(alps(j,k)) * cos(gams(j,k)), -sin(alps(j,k))],[0,0,ret(:,end)-80])/(sqrt(ret(:,i)^2 + (ret(:,end)-80)^2));
        end
    end
    eta(i) = eta_at * eta_cos * eta_sb * eta_ref / 60 ;
    eta_cos = 0;
end
eta_ave = sum(eta) / 55;
E = eta_ave * DNI_ave * 55 * ret(:,end - 2) * ret(:,end -1);
if E < 62000 && E > 59000
    flag = 1;
end
end

