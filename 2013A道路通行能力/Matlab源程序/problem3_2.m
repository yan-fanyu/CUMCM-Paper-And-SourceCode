% ����3 �ⷨ��
clc;
close all;
clear;

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

%% ����ṹ����
%��ȡ����
p=[score(5:81)';time(5:81)'];  %�������ݾ���
t=length(5:81)';         %Ŀ�����ݾ���

%�ڵ����
inputnum=2;
hiddennum=5;
outputnum=1;

%ѵ�����ݺ�Ԥ������
% input_train=input(1:1900,:)';
% input_test=input(1901:2000,:)';
% output_train=output(1:1900)';
% output_test=output(1901:2000)';

%ѡ����������������ݹ�һ��
[inputn,PS1]=mapminmax(p);
[outputn,PS2]=mapminmax(t);

%��������
net=newff(inputn,outputn,hiddennum);

%% �Ŵ��㷨������ʼ��
maxgen=10;                         %��������������������
sizepop=10;                        %��Ⱥ��ģ
pcross=[0.3];                       %�������ѡ��0��1֮��
pmutation=[0.1];                    %�������ѡ��0��1֮��

%�ڵ�����
	numsum=inputnum*hiddennum+hiddennum+hiddennum*outputnum+outputnum;

lenchrom=ones(1,numsum);        
bound=[-3*ones(numsum,1) 3*ones(numsum,1)];    %���ݷ�Χ

%------------------------------------------------------��Ⱥ��ʼ��--------------------------------------------------------
individuals=struct('fitness',zeros(1,sizepop), 'chrom',[]);  %����Ⱥ��Ϣ����Ϊһ���ṹ��
avgfitness=[];                      %ÿһ����Ⱥ��ƽ����Ӧ��
bestfitness=[];                     %ÿһ����Ⱥ�������Ӧ��
bestchrom=[];                       %��Ӧ����õ�Ⱦɫ��
%��ʼ����Ⱥ
for i=1:sizepop
    %�������һ����Ⱥ
    individuals.chrom(i,:)=Code(lenchrom,bound);    %���루binary��grey�ı�����Ϊһ��ʵ����float�ı�����Ϊһ��ʵ��������
    x=individuals.chrom(i,:);
    %������Ӧ��
    individuals.fitness(i)=fun(x,inputnum,hiddennum,outputnum,net,inputn,outputn);   %Ⱦɫ�����Ӧ��
end

%����õ�Ⱦɫ��
[bestfitness bestindex]=min(individuals.fitness);
bestchrom=individuals.chrom(bestindex,:);  %��õ�Ⱦɫ��
avgfitness=sum(individuals.fitness)/sizepop; %Ⱦɫ���ƽ����Ӧ��
% ��¼ÿһ����������õ���Ӧ�Ⱥ�ƽ����Ӧ��
trace=[avgfitness bestfitness]; 
 
%% ���������ѳ�ʼ��ֵ��Ȩֵ
% ������ʼ
for i=1:maxgen
            
    % ѡ��
    individuals=Select(individuals,sizepop); 
    avgfitness=sum(individuals.fitness)/sizepop;
    %����
    individuals.chrom=Cross(pcross,lenchrom,individuals.chrom,sizepop,bound);
    % ����
    individuals.chrom=Mutation(pmutation,lenchrom,individuals.chrom,sizepop,i,maxgen,bound);
    
    % ������Ӧ�� 
    for j=1:sizepop
        x=individuals.chrom(j,:); %����
        individuals.fitness(j)=fun(x,inputnum,hiddennum,outputnum,net,inputn,outputn);   
    end
    
  %�ҵ���С�������Ӧ�ȵ�Ⱦɫ�弰��������Ⱥ�е�λ��
    [newbestfitness,newbestindex]=min(individuals.fitness);
    [worestfitness,worestindex]=max(individuals.fitness);
    % ������һ�ν�������õ�Ⱦɫ��
    if bestfitness>newbestfitness
        bestfitness=newbestfitness;
        bestchrom=individuals.chrom(newbestindex,:);
    end
    individuals.chrom(worestindex,:)=bestchrom;
    individuals.fitness(worestindex)=bestfitness;
    
    avgfitness=sum(individuals.fitness)/sizepop;
    
    trace=[trace;avgfitness bestfitness]; %��¼ÿһ����������õ���Ӧ�Ⱥ�ƽ����Ӧ��

end
%% �Ŵ��㷨������� 
 figure(1)
[r c]=size(trace);
plot([1:r]',trace(:,2),'b--');
title(['��Ӧ������  ' '��ֹ������' num2str(maxgen)]);
xlabel('��������');ylabel('��Ӧ��');
legend('ƽ����Ӧ��','�����Ӧ��');
disp('��Ӧ��                   ����');
x=bestchrom;

%% �����ų�ʼ��ֵȨֵ��������Ԥ��
% %���Ŵ��㷨�Ż���BP�������ֵԤ��
w1=x(1:inputnum*hiddennum);
B1=x(inputnum*hiddennum+1:inputnum*hiddennum+hiddennum);
w2=x(inputnum*hiddennum+hiddennum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum);
B2=x(inputnum*hiddennum+hiddennum+hiddennum*outputnum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum+outputnum);

net.iw{1,1}=reshape(w1,hiddennum,inputnum);
net.lw{2,1}=reshape(w2,outputnum,hiddennum);
net.b{1}=reshape(B1,hiddennum,1);
net.b{2}=B2;

%% BP����ѵ��
%�����������
net.trainParam.epochs=100;
net.trainParam.lr=0.1;
%net.trainParam.goal=0.00001;

%����ѵ��
[net,per2]=train(net,inputn,outputn);

%% BP����Ԥ��
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