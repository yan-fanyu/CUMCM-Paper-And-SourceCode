clear;


X = [20 70 110 163 197 240 273];

YX = [4.23	4.28	4.46	4.63	4.62	4.76	4.68
];

Error_arr = [];

A_arr = [];
B_arr = [];
K_arr = [];

error = 0;
ii = 0;
Num_arr = [];

K = 1:1:100;
A = 1:1:100;
B = -1:0.0001:1;

MaxError = 0.255;

for i=1:length(K)
    k=K(i);
    for j=1:length(A)
        a=A(j);
        for p=1:length(B)
            b=B(p);
            e = 0;
            for s=1:length(X)
                x=X(s);
                f = k/(1+a*exp(-b*x));
                e = e+(f-YX(s))^2;
            end
            
            if e < MaxError;
                ii = ii + 1;
                Num_arr(ii) = ii; 
                A_arr(ii) =a;
                K_arr(ii)=k;
                B_arr(ii)=b;
                Error_arr(ii) = e;
            end
            
            
        end
    end
end
          

[~,position]=min(Error_arr);
K_arr(position)
A_arr(position)
B_arr(position)
            
plot(Num_arr, Error_arr, '*');
xlabel('序号');
ylabel('误差');







