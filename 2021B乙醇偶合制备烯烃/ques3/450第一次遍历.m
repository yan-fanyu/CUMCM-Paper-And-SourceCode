clear;

X1 = 10 : 5 : 200;      % Co负载量
X2 = 10 : 5 : 200;      % HAP质量
X3 = 0.5 : 0.1 : 5;       % 质量比
X4 = 0.3 : 0.1 : 2.1;     % 乙醇浓度
X5 = 250 : 5 : 450;     % 温度

maxq = 4995;
Z_arr = [];

Z_X1 = [];
Z_X2 = [];
Z_X3 = [];
Z_X4 = [];
Z_X5 = [];

n=0;
Index = [];


for i1=1:length(X1)
    x1 = X1(i1);
    for i2=1:length(X2)
        x2 = X2(i2);
        for i3=1:length(X3)
            x3 = X3(i3);
            for i4=1:length(X4)
                x4 = X4(i4);
                for i5=1:length(X5)
                    x5 = X5(i5);
                    
                    z = 0.018*x5 + 0.035*x1 - 0.039*x2 - 0.19*x3*x3 + 0.007*x2*x4 - ...
                        0.002*x4*x5 + 0.816*x3 - 8.015;
                    zz = 5000*exp(z)/(1+exp(z));
                    if (zz > maxq)
                        n=n+1;
                        Z_X1(n) = x1;
                        Z_X2(n) = x2;
                        Z_X3(n) = x3;
                        Z_X4(n) = x4;
                        Z_X5(n) = x5;
                        Index(n) = n;
                        Z_arr(n) = zz;
                    end
                end
            end
        end
    end
end

[maxValue, index] = max(Z_arr);
scatter(Index, Z_arr, 8, 'b');
xlabel('序号');
ylabel('目标值');
title('各个目标值');
Z_X1(index)
Z_X2(index)
Z_X3(index)
Z_X4(index)
Z_X5(index)


