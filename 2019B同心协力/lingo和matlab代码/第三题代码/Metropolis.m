function [S,R] = Metropolis(S1,S2,X,T)

R1 = PathLength(S1,X);  

R2 = PathLength(S2,X);  

dC = R2 - R1;   %计算能力之差
if dC < 0       %如果能力降低 接受新路线
    S = S2;
    R = R2;
elseif exp(-dC/T) >= rand   %以exp(-dC/T)概率接受新路线
    S = S2;
    R = R2;
else        %不接受新路线
    S = S1;
    R = R1;
end