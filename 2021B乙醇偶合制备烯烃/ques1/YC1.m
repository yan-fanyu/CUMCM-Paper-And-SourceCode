clear;

X = [20 70 110 163 197 240 273];

YC = [43.5 	37.8 	36.6 	32.7 	31.7 	29.9 	29.9];




Error_arr = [];

A_arr = [];
B_arr = [];
C_arr = [];

error = 0;
ii = 0;
Num_arr = [];

A = 20:0.01:40;
B = 0:0.01:30;
C = 0:0.01:1;

MaxError = 3.4;

for i=1:length(A)
    a=A(i);
    for j=1:length(B)
        b=B(j);
        for k=1:length(C)
            c=C(k);
            e = 0;
            for s=1:length(X)
                x=X(s);
                f = a + b*exp(-c*x);
                e = e+(f-YC(s))^2;
            end
            
            if e < MaxError;
                ii = ii + 1;
                Num_arr(ii) = ii; 
                A_arr(ii) =a;
                C_arr(ii)=b;
                B_arr(ii)=c;
                Error_arr(ii) = e;
            end
            
            
        end
    end
end
          

[~,position]=min(Error_arr);
A_arr(position)
C_arr(position)
B_arr(position)
            
plot(Num_arr, Error_arr, '*');
xlabel('序号');
ylabel('误差');



