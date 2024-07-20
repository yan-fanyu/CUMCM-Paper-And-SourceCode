% ������

clear;
close all;
clc;

load('problem3.mat');
%% �����Ŷӳ���
M =2;L = 0.120;N0 = 12;
kj = 160;km = 59;
shangyous(1) = shangyou(1);
xiayous(1) = xiayou(1);
%�����ۼ���
for i = 2:size(shangyou,1)
   shangyous(i) = sum(shangyou(1:i,1)); 
   xiayous(i) = sum(xiayou(1:i,1));
end


for i = 2:size(shangyou,1)
   D(i) = 1000*(N0+shangyous(i)-xiayous(i)-km*L*M)/(M*(kj-km));
   if N0+shangyous(i)-xiayous(i)>= kj*L*M
      D(i)  = 120;
   else
       if N0+shangyous(i)-xiayous(i)<= km*L*M
           D(i) = 0;
       end
   end
end

% plot(1:size(shangyou,1),D,':*',1:size(shangyou,1),length,'--o');
% grid on;
% legend('ģ�ͼ��㳤��','ͳ�Ƽ���ĳ���');


%% ��ʱ�䵥����Ϊһ�����룬ͨ�����������γ������Ϊһ�����루ͨ�������ǳɱ��ͣ�
B = [max(shangyou),min(xiayou)];
W = [min(shangyou),max(xiayou)];

%���ƫ��
r(:,1) = abs(shangyou-B(1))./(max(shangyou)-min(shangyou));
r(:,2) = abs(B(2)-xiayou)./(max(xiayou)-min(xiayou));

del(:,1) = abs(shangyou-W(1))./(max(shangyou)-min(shangyou));
del(:,2) = abs(W(2)-xiayou)./(max(xiayou)-min(xiayou));

for i = 1:2
    c(i) = (r(:,i)'*del(:,i))./(norm(r(:,i))*norm(del(:,i)));
end

%Ȩ��
w(1) = c(1)/sum(c);
w(2) = c(2)/sum(c);


%�����ٻ����Ȩ���
P(:,1) = (shangyou-min(shangyou))./(max(shangyou)-min(shangyou));
P(:,2) = (max(xiayou)-xiayou)./(max(xiayou)-min(xiayou));

score = P*w';

%  plot3(score(1:81),time(1:81),length(1:81)','ro');
%  grid on;
%  xlabel('�÷�');ylabel('����ʱ��'):zlabel('�Ŷӳ���');
%% ���������
p=[score(1:81)';time(1:81)'];  %�������ݾ���
t=length(1:81)';         %Ŀ�����ݾ���

%����premnmx���������ݽ��й�һ��
[pn,PS1]=mapminmax(p); % �����������p���������t���й�һ������
[tn,PS2]=mapminmax(t); % �����������p���������t���й�һ������
dx=[-1,1;-1,1];   %��һ���������СֵΪ-1�����ֵΪ1

%BP����ѵ��
net=newff(dx,[2,5,1],{'tansig','tansig','purelin'},'traingdx'); %����ģ�ͣ������ݶ��½���ѵ����
net.trainParam.show=1000;               %1000�ֻ���ʾһ�ν��
net.trainParam.Lr=0.05;                 %ѧϰ�ٶ�Ϊ0.05
net.trainParam.epochs=50000;           %���ѵ���ֻ�Ϊ50000��
net.trainParam.goal=0.65*10^(-2);     %�������

net=train(net,pn,tn);                   %��ʼѵ��������pn,tn�ֱ�Ϊ�����������

%����ԭʼ���ݶ�BP�������
[m1,m2] = meshgrid(linspace(0.25,0.86,1040),0:1:1039);
test = [reshape(m1,1,size(m1,1)*size(m1,2));reshape(m2,1,size(m2,1)*size(m2,2))];
pn1 = mapminmax('apply',test,PS1);
an=sim(net,pn1);           %��ѵ���õ�ģ�ͽ��з���
a=mapminmax('reverse',an,PS2); % �ѷ���õ������ݻ�ԭΪԭʼ����������
a = reshape(a,size(m1,1),size(m1,2));
a(find(a<0)) = 0;
figure;
mesh(m1,m2,a);
grid on;
xlabel('�÷�');ylabel('����ʱ��'):zlabel('�Ŷӳ���');