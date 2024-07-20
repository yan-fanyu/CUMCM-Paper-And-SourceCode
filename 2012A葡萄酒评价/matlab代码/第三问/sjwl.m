%以下进行神经网络的训练并求出分级
clear all
clc
clf
%导入附件二中的理化指标
load lhzbfile


%首先对红酒理化指标进行神经训练
%以下开始进行神经网络训练
p=hlhzb(:,1:30)';
t=hlhzb(:,31:39)';
[pn,minp,maxp,tn,mint,maxt]=premnmx(p,t);
bounds(1:30,1)=-1;
bounds(1:30,2)=1;
net=newff(bounds,[30,30,30,9],{'tansig','tansig','tansig','purelin'},'traingdx');
net.trainparam.show=1000;
net.trainparam.lr=0.05;
net.trainparam.epochs=500000;
net.trainparam.goal=0.65e-3;
net=train(net,pn,tn);

%检验该神经网络
tn1=sim(net,pn);
t1=postmnmx(tn1,mint,maxt);
fc1=0;
for i=1:9
    for j=1:27
        if t(i,j)==0
            fc1=fc1;
        else
            fc1=fc1+abs((t1(i,j)-t(i,j))/t(i,j));
        end
    end
end
disp('本次神经网络输出的误差为：')
pjfc1=fc1/27/9
if pjfc1<0.1
    disp('该神经网络的输出误差小于0.1.两者之间是有联系的')
else
    disp('该神经网络的输出误差大于0.1，两者之间没有联系')
end
