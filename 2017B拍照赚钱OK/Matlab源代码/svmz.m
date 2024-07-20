%%  ���Թ滮�����SVMģ��
%% ��ջ�����������������
clc
clear all
X0=xlsread('E:\��ѧ��ģ\��ģ����\2017CUMCM\B\���ۣ�ԭʼ��.xlsx', 'B2:D836');%��Excel������ݶ�ȡ��matlab��
lie=size(X0);
for i=1:lie(2)-1%������е�һ���������ݱ�׼��
    X(:,i)=(X0(:,i)-mean(X0(:,i)))/std(X0(:,i)); % ���ݱ�׼��
end
% ����Ԥ����

[m,n]=size(X);
e=ones(m,1);
D=[X0(:,lie(2))];
B=zeros(m,m);
C=zeros(m,m);
for i=1:m
    B(i,i)=1;
    C(i,i)=D(i,1);
end

%% ת���ɹ滮ģ�ͽ������
A=[-X(:,1).*D, -X(:,2).*D, D, -B];
b=-e;
f=[0,0,0, ones(1,m)];
lb=[-inf,-inf,-inf,zeros(1,m)]';
x = linprog(f,A,b,[],[],lb);

%% ģ����֤������ʾ
W=[x(1,1), x(2,1)]; % ��ȡϵ��
CC=x(3,1);         % ��ȡ�ؾ�
X1=[X(:,1), X(:,2)];
R1=X1*W'-CC;      
R2=sign(R1);      %���з���
disp('������������');
disp('��ƽ�淽��Ϊ��');
disp(['X1:' num2str(x(1,1))]);
disp(['X2:' num2str(x(2,1))]);
disp(['intercept:' num2str(x(3,1))]); % ������
disp('��ƽ���������');
R=[R1, R2]       
