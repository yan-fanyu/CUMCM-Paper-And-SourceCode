clear;

maxq = 4995;
Z_arr = [];

Z_X1 = [];
Z_X2 = [];
Z_X3 = [];
Z_X4 = [];
Z_X5 = [];

n=0;
Index = [];

left1 = 10;
right1 = 200;
mid1 = 0;

left2 = 10;
right2 = 200;
mid2 = 0;

left4 = 0.3;
right4 = 2.1;
mid4 = 0;


left5 = 250;
right5 = 450;
mid5 = 0;


X3 = 0.5 : 0.1 : 5;       % 质量比

for i1=1:20
    mid1 = right1 - (right1-left1)/2;
    x1 = mid1;
    left1 = mid1;   
    mid2 = left2 + (right2-left2)/2;
    x2 = mid2;
    right2 = mid2;        
    mid4 = left4 + (right4-left4)/2;
    x4 = mid4;
    right4 = mid4;
    mid5 = right5 - (right5-left5)/2;
    x5 = mid5;
    left5 = mid5;
        for i3=1:length(X3)
            x3 = X3(i3);
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



