
clear all
clc

X = [5/9 3/18 0 2/9 1/9 0 0 1/18];


N = size(X,2);    


T0 = 1e10;   
Tend = 1e-30;  
L = 2;    
q = 0.9;   
Time = ceil(double(solve([num2str(T0) '*(0.9)^x = ',num2str(Tend)])));  

count = 0;     
Obj = zeros(Time,1);         
track = zeros(Time,N);     


disp('��ʼ��Ⱥ�е�һ�����ֵ:')
S1 = randperm(N)

while T0 > Tend
    count = count + 1;     %���µ�������
    temp = zeros(L,N+1);
    % 1. �����½�
    S2 = NewAnswer(S1);
    % 2. Metropolis�����ж��Ƿ�����½�
    [S1,R] = Metropolis(S1,S2,X,T0);  %Metropolis �����㷨
    %%
    % 3. ��¼ÿ�ε������̵�����·��
    if count == 1 || R < Obj(count-1)
        Obj(count) = R;           
    else
        Obj(count) = Obj(count-1);
    end
    track(count,:) = S1;
    T0 = q * T0;     %����
end




disp('���Ž�:')
S = track(end,:)

