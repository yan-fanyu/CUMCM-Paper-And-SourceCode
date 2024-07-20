% ����2
clear;
close all;
clc;
%%
load('problem2.mat');
che(all(che==0,2),:)=[];che(:,all(che==0,1))=[];
weight = [1 1.5 2];% Ȩ��
for i = 1:size(che,1)
    che(i,:) = che(i,:).*weight.*60;
end
x = 1:size(che,1);
plot(x,che(:,1),':o',x,che(:,2),'-*',x,che(:,3),'--o',x,sum(che,2),':*');
grid on;
legend('С�ͳ�','���ͳ�','���ͳ�','�ܺ�');
    

%% ����ʵ��ͨ������
CB = 2000; N = 1; fw = 0.94; fp = 0.9;ehv = 2;
for i = 1:size(che,1)
   fhv = 1/(1+(che(i,3)/sum(che(i,:)))*(ehv-1));
   Qx(i) = CB*N*fw*fhv*fp;
end
figure;
plot(x,sum(che,2),'b:o');
hold on;
grid on;
plot(x,Qx,'b--*');

    
%% ����ͨ����������
CB = 2000;yl = 0.94;yc = 1;yi = 0.7;
for i = 1:size(che,1)
   T = che(i,3)/sum(che(i,:));
   yt = 100/((100-T)+2*T);
   C(i) = CB*yl*yc*yi*yt;
end
plot(x,C,'r--p');
legend('���㷽��һ','���㷽����','����ֵ');


%% ���γ�������ͨ������
figure;
plot(x,sum(che,2)./(shangyou*weight'.*60),'o');
grid on;
legend('���γ�������ͨ������');