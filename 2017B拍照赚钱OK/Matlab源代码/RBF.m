
clc                          % 清屏
clear all;                  %清除内存以便加快运算速度
close all;                  %关闭当前所有figure图像
SamNum=835;                  %输入样本数量为500
TestSamNum=835;              %测试样本数量335
ForcastSamNum=835;            %预测样本数量为1
HiddenUnitNum=7;            %中间层隐节点数量取8,比工具箱程序多了1个
InDim=2;                    %网络输入维度为2
OutDim=1;                   %网络输出维度为1

%原始数据 


p=xlsread('E:\数学建模\建模论文\2017CUMCM\B\定价（原始）.xlsx',1,'B2:C836');  %输入数据矩阵
p=p';
t=xlsread('E:\数学建模\建模论文\2017CUMCM\B\定价（原始）.xlsx',1,'D2:D836');      %目标数据矩阵
t=t';
[SamIn,minp,maxp,tn,mint,maxt]=premnmx(p,t); %原始样本对（输入和输出）初始化

rand('state',sum(100*clock)) ;  %依据系统时钟种子产生随机数         
NoiseVar=0.01;                    %噪声强度为0.01（添加噪声的目的是为了防止网络过度拟合）
Noise=NoiseVar*randn(1,SamNum);   %生成噪声
SamOut=tn + Noise;                   %将噪声添加到输出样本上

TestSamIn=SamIn;                           %这里取输入样本与测试样本相同因为样本容量偏少
TestSamOut=SamOut;                         %也取输出样本与测试样本相同

MaxEpochs=500000;                              %最多训练次数为500000
lr=0.035;                                       %学习速率为0.035
E0=0.65*10^(-3);                              %目标误差为0.65*10^(-3)
W1=0.5*rand(HiddenUnitNum,InDim)-0.1;   %初始化输入层与隐含层之间的权值
B1=0.5*rand(HiddenUnitNum,1)-0.1;       %初始化输入层与隐含层之间的阈值
W2=0.5*rand(OutDim,HiddenUnitNum)-0.1; %初始化输出层与隐含层之间的权值              
B2=0.5*rand(OutDim,1)-0.1;                %初始化输出层与隐含层之间的阈值

ErrHistory=[];                              %给中间变量预先占据内存
for i=1:MaxEpochs
    
    HiddenOut=logsig(W1*SamIn+repmat(B1,1,SamNum)); % 隐含层网络输出
    NetworkOut=W2*HiddenOut+repmat(B2,1,SamNum);    % 输出层网络输出
    Error=SamOut-NetworkOut;                       % 实际输出与网络输出之差
    SSE=sumsqr(Error) ;                          %能量函数（误差平方和）

    ErrHistory=[ErrHistory SSE];

    if SSE<E0,break, end      %如果达到误差要求则跳出学习循环
    
    % 以下六行是神经网络最核心的程序
    % 他们是权值（阈值）依据能量函数负梯度下降原理所作的每一步动态调整量
    Delta2=Error;
    Delta1=W2'*Delta2.*HiddenOut.*(1-HiddenOut);    

    dW2=Delta2*HiddenOut';
    dB2=Delta2*ones(SamNum,1);
    
    dW1=Delta1*SamIn';
    dB1=Delta1*ones(SamNum,1);
    %对输出层与隐含层之间的权值和阈值进行修正
    W2=W2+lr*dW2;
    B2=B2+lr*dB2;
    %对输入层与隐含层之间的权值和阈值进行修正
    W1=W1+lr*dW1;
    B1=B1+lr*dB1;
end

HiddenOut=logsig(W1*SamIn+repmat(B1,1,TestSamNum)); % 隐含层输出最终结果
NetworkOut=W2*HiddenOut+repmat(B2,1,TestSamNum);    % 输出层输出最终结果
a=postmnmx(NetworkOut,mint,maxt);               % 还原网络输出层的结果
x=0:1:835;                                        % 葡萄酒样品
newk=a(1,:);                                     % 网络输出葡萄酒得分                                      
% figure ;
% plot(x,newk,'r-o',x,df,'b--+')    %绘值葡萄酒得分对比图；
% xlabel('红葡萄酒样品');
% ylabel('得分');

%利用训练好的网络进行预测
%当用训练好的网络对新数据pnew进行预测时，也应作相应的处理
pnew=xlsread('E:\数学建模\建模论文\2017CUMCM\B\最新定价.xlsx',1,'F2:G836');                    %需要估计得分葡萄酒及酿酒葡萄理化指标数据；
pnew=pnew';
pnewn=tramnmx(pnew,minp,maxp);         %利用原始输入数据的归一化参数对新数据进行归一化；
HiddenOut=logsig(W1*pnewn+repmat(B1,1,ForcastSamNum)); % 隐含层输出预测结果
anewn=W2*HiddenOut+repmat(B2,1,ForcastSamNum);           % 输出层输出预测结果
anewn
