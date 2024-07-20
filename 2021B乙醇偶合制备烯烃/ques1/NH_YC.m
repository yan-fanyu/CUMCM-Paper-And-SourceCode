clear;

X = [20 70 110 163 197 240 273];

YC = [43.5 	37.8 	36.6 	32.7 	31.7 	29.9 	29.9];

YY = [];

a=29.04;
b=18.15;
c=0.01;


for s=1:length(X)
    x=X(s);
    YY(s) = a + b*exp(-c*x);
end

          
plot(X, YC, '.', 'Markersize', 20);
hold on;
plot(X, YY, 'linewidth', 2);
xlabel('温度/°C');
ylim([28 46]);
ylabel('乙醇转换率/％');
title('乙醇转换率与温度曲线拟合')
legend('实际值', '拟合曲线');



