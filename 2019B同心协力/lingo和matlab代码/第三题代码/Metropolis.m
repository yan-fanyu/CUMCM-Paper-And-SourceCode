function [S,R] = Metropolis(S1,S2,X,T)

R1 = PathLength(S1,X);  

R2 = PathLength(S2,X);  

dC = R2 - R1;   %��������֮��
if dC < 0       %����������� ������·��
    S = S2;
    R = R2;
elseif exp(-dC/T) >= rand   %��exp(-dC/T)���ʽ�����·��
    S = S2;
    R = R2;
else        %��������·��
    S = S1;
    R = R1;
end