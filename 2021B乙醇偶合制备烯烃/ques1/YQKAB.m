clear;
X = [20 70 110 163 197 240 273];

YX = [5.17 5.6 6.37 7.82 8.19 8.42 8.79];

Error_arr = [];

A_arr = [];
B_arr = [];
K_arr = [];

error = 0;
ii = 0;
Num_arr = [];

K = 0:1:100;
A = 0:1:100;
B = 0:1:100;

MaxError = 1000;

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
min(Error_arr)
K_arr(position)
A_arr(position)
B_arr(position)
            
plot(Num_arr, Error_arr, '*');
xlabel('序号');
ylabel('误差');







