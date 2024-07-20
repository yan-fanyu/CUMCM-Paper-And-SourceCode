%���½����������ѵ��������ּ�
clear all
clc
clf
%���븽�����е���ָ��
load lhzbfile


%���ȶԺ����ָ�������ѵ��
%���¿�ʼ����������ѵ��
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

%�����������
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
disp('������������������Ϊ��')
pjfc1=fc1/27/9
if pjfc1<0.1
    disp('���������������С��0.1.����֮��������ϵ��')
else
    disp('������������������0.1������֮��û����ϵ')
end
