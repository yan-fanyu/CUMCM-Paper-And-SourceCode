clear;

X = [20 70 110 163 197 240 273];

YX = [4.23	4.28	4.46	4.63	4.62	4.76	4.68
];

YY = [];

a=-7.95E-8;
b=2.91E-5;
c=-2.76E-4;
d=4.22;


for s=1:length(X)
    x=X(s);
    YY(s) = a*x^3+b*x^2+c*x+d;
end

          
plot(X, YX, '.', 'Markersize', 20);
hold on;
plot(X, YY, 'linewidth', 2);
xlabel('温度/°C');
%ylim([28 46]);
ylabel('乙烯选择性');
title('乙烯选择性与温度曲线拟合')
legend('实际值', '拟合曲线');



