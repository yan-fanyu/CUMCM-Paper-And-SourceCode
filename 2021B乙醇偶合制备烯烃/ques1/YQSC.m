clear;
X = [20 70 110 163 197 240 273];

Real_Y = [5.17 5.6 6.37 7.82 8.19 8.42 8.79];

Error_arr = [];
A_arr = [];
B_arr = [];
C_arr = [];
D_arr = [];

error = 0;
ii = 0;
Num_arr = [];


A = -100:1:100;
B = -100:5:100;
C = -100:5:100;
D = -100:5:100;

MaxError = 10000;

for aa=1:length(A)
    a=A(aa);
    for bb=1:length(B)
        b=B(bb);
        for cc=1:length(C)
            c=C(cc);
            for dd=1:length(D)
                d = D(dd);
                e = 0;
                for s=1:length(X)
                    x=X(s);
                    f = a*x^3+b*x^2+c*x+d;
                    e = e+(f-Real_Y(s))^2;
                end

                if e < MaxError;
                    ii = ii + 1;
                    Num_arr(ii) = ii; 
                    A_arr(ii) =a;
                    C_arr(ii)=c;
                    B_arr(ii)=b;
                    D_arr(ii) = d;
                    Error_arr(ii) = e;
                end
            end
        end
    end
end
          

[~,position]=min(Error_arr);
min(Error_arr)

A_arr(position)
B_arr(position)
C_arr(position)
D_arr(position)
            
plot(Num_arr, Error_arr, '*');
xlabel('序号');
ylabel('误差');







