
clc                          % ����
clear all;                  %����ڴ��Ա�ӿ������ٶ�
close all;                  %�رյ�ǰ����figureͼ��
SamNum=835;                  %������������Ϊ500
TestSamNum=835;              %������������335
ForcastSamNum=835;            %Ԥ����������Ϊ1
HiddenUnitNum=7;            %�м�����ڵ�����ȡ8,�ȹ�����������1��
InDim=2;                    %��������ά��Ϊ2
OutDim=1;                   %�������ά��Ϊ1

%ԭʼ���� 


p=xlsread('E:\��ѧ��ģ\��ģ����\2017CUMCM\B\���ۣ�ԭʼ��.xlsx',1,'B2:C836');  %�������ݾ���
p=p';
t=xlsread('E:\��ѧ��ģ\��ģ����\2017CUMCM\B\���ۣ�ԭʼ��.xlsx',1,'D2:D836');      %Ŀ�����ݾ���
t=t';
[SamIn,minp,maxp,tn,mint,maxt]=premnmx(p,t); %ԭʼ�����ԣ�������������ʼ��

rand('state',sum(100*clock)) ;  %����ϵͳʱ�����Ӳ��������         
NoiseVar=0.01;                    %����ǿ��Ϊ0.01�����������Ŀ����Ϊ�˷�ֹ���������ϣ�
Noise=NoiseVar*randn(1,SamNum);   %��������
SamOut=tn + Noise;                   %��������ӵ����������

TestSamIn=SamIn;                           %����ȡ�������������������ͬ��Ϊ��������ƫ��
TestSamOut=SamOut;                         %Ҳȡ������������������ͬ

MaxEpochs=500000;                              %���ѵ������Ϊ500000
lr=0.035;                                       %ѧϰ����Ϊ0.035
E0=0.65*10^(-3);                              %Ŀ�����Ϊ0.65*10^(-3)
W1=0.5*rand(HiddenUnitNum,InDim)-0.1;   %��ʼ���������������֮���Ȩֵ
B1=0.5*rand(HiddenUnitNum,1)-0.1;       %��ʼ���������������֮�����ֵ
W2=0.5*rand(OutDim,HiddenUnitNum)-0.1; %��ʼ���������������֮���Ȩֵ              
B2=0.5*rand(OutDim,1)-0.1;                %��ʼ���������������֮�����ֵ

ErrHistory=[];                              %���м����Ԥ��ռ���ڴ�
for i=1:MaxEpochs
    
    HiddenOut=logsig(W1*SamIn+repmat(B1,1,SamNum)); % �������������
    NetworkOut=W2*HiddenOut+repmat(B2,1,SamNum);    % ������������
    Error=SamOut-NetworkOut;                       % ʵ��������������֮��
    SSE=sumsqr(Error) ;                          %�������������ƽ���ͣ�

    ErrHistory=[ErrHistory SSE];

    if SSE<E0,break, end      %����ﵽ���Ҫ��������ѧϰѭ��
    
    % ��������������������ĵĳ���
    % ������Ȩֵ����ֵ�����������������ݶ��½�ԭ��������ÿһ����̬������
    Delta2=Error;
    Delta1=W2'*Delta2.*HiddenOut.*(1-HiddenOut);    

    dW2=Delta2*HiddenOut';
    dB2=Delta2*ones(SamNum,1);
    
    dW1=Delta1*SamIn';
    dB1=Delta1*ones(SamNum,1);
    %���������������֮���Ȩֵ����ֵ��������
    W2=W2+lr*dW2;
    B2=B2+lr*dB2;
    %���������������֮���Ȩֵ����ֵ��������
    W1=W1+lr*dW1;
    B1=B1+lr*dB1;
end

HiddenOut=logsig(W1*SamIn+repmat(B1,1,TestSamNum)); % ������������ս��
NetworkOut=W2*HiddenOut+repmat(B2,1,TestSamNum);    % �����������ս��
a=postmnmx(NetworkOut,mint,maxt);               % ��ԭ���������Ľ��
x=0:1:835;                                        % ���Ѿ���Ʒ
newk=a(1,:);                                     % ����������ѾƵ÷�                                      
% figure ;
% plot(x,newk,'r-o',x,df,'b--+')    %��ֵ���ѾƵ÷ֶԱ�ͼ��
% xlabel('�����Ѿ���Ʒ');
% ylabel('�÷�');

%����ѵ���õ��������Ԥ��
%����ѵ���õ������������pnew����Ԥ��ʱ��ҲӦ����Ӧ�Ĵ���
pnew=xlsread('E:\��ѧ��ģ\��ģ����\2017CUMCM\B\���¶���.xlsx',1,'F2:G836');                    %��Ҫ���Ƶ÷����ѾƼ����������ָ�����ݣ�
pnew=pnew';
pnewn=tramnmx(pnew,minp,maxp);         %����ԭʼ�������ݵĹ�һ�������������ݽ��й�һ����
HiddenOut=logsig(W1*pnewn+repmat(B1,1,ForcastSamNum)); % ���������Ԥ����
anewn=W2*HiddenOut+repmat(B2,1,ForcastSamNum);           % ��������Ԥ����
anewn
