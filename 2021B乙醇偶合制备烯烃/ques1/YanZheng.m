clear;
X = [20 70 110 163 197 240 273];

YX = [4.23	4.28	4.46	4.63	4.62	4.76	4.68
];

k = 94.98;
a=20;
b =0;

k=1;
a=1;
b=1;

YY = [];

for s=1:length(X)
    x=X(s);
    f = k/(1+a*exp(-b*x));
    YY(s) = f;
end


plot(X, YX, '*');
