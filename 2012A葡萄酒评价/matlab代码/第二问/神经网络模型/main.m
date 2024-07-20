%以下进行神经网络的训练并求出分级
clear all
clc
clf
%导入题目中求取的酒质量得分和酿酒葡萄理化指标得分
load lhzbdffile
load zldffile
%对已有数据进行升序，以利于之后取得神经网络训练所需数据
[hptlhdf,a,b]=premnmx(hptlhdf);
hptlhdf=(1+hptlhdf)/2;
[bptlhdf,a,b]=premnmx(bptlhdf);
bptlhdf=(1+bptlhdf)/2;
[hlhdfsx q1]=sort(hptlhdf);
[blhdfsx q2]=sort(bptlhdf);
[hzldfsx q3]=sort(hjzldf);
[bzldfsx q4]=sort(bjzldf);
%首先对红酒进行神经训练并分级
hjxl1=[hlhdfsx(1) hlhdfsx(3) hlhdfsx(6) hlhdfsx(8) hlhdfsx(11) hlhdfsx(14) ...
    hlhdfsx(17) hlhdfsx(20) hlhdfsx(22) hlhdfsx(25) hlhdfsx(27)];
hjxl2=[hzldfsx(1) hzldfsx(3) hzldfsx(6) hzldfsx(8) hzldfsx(11) hzldfsx(14) ...
    hzldfsx(17) hzldfsx(20) hzldfsx(22) hzldfsx(25) hzldfsx(27)];
hjxl3=0:0.1:1;
%以下开始进行神经网络训练
p=[hjxl1;hjxl2];
t=hjxl3;
bounds=[0 1;0 1];
net=newff(bounds,[2,5,1],{'tansig','tansig','purelin'},'traingdx');
net.trainparam.show=1000;
net.trainparam.lr=0.05;
net.trainparam.epochs=500000;
net.trainparam.goal=0.65e-4;
net=train(net,p,t);

%检验该神经网络
t1=sim(net,p);
fc1=0;
for i=2:11
    fc1=fc1+abs((t1(i)-t(i))/t(i));
end
disp('本次神经网络输出的误差为：')
pjfc1=fc1/11
if pjfc1<0.1
    disp('该神经网络的输出误差小于0.1.可以使用')
else
    disp('该神经网络的输出误差大于0.1，需重新设定参数')
end
%以下将源数据带入得到分级结果
pn=[hptlhdf;hjzldf];
hjfjsz=sim(net,pn);
%将结果进行分级（~0.2为E级，0.2~0.4为D级，0.4~0.6为C级，0.6~0.8为B级，0.8~为A级）
i1=0;i2=0;i3=0;i4=0;i5=0;
for i=1:27
    if hjfjsz(i)>=0.8
        i1=i1+1;
        ha(1,i1)=i;
        ha(2,i1)=hjfjsz(i);
    elseif hjfjsz(i)>=0.6&&hjfjsz(i)<0.8
        i2=i2+1;
        hb(1,i2)=i;
        hb(2,i2)=hjfjsz(i);
    elseif hjfjsz(i)>=0.4&&hjfjsz(i)<0.6
        i3=i3+1;
        hc(1,i3)=i;
        hc(2,i3)=hjfjsz(i);
    elseif hjfjsz(i)>=0.2&&hjfjsz(i)<0.4
        i4=i4+1;
        hd(1,i4)=i;
        hd(2,i4)=hjfjsz(i);
    else
        i5=i5+1;
        he(1,i5)=i;
        he(2,i5)=hjfjsz(i);
    end
end
ha,hb,hc,hd,he

%以下白酒进行神经训练并分级
bjxl1=[blhdfsx(1) blhdfsx(3) blhdfsx(6) blhdfsx(9) blhdfsx(12) blhdfsx(14) ...
    blhdfsx(17) blhdfsx(20) blhdfsx(23) blhdfsx(26) blhdfsx(28)];
bjxl2=[bzldfsx(1) bzldfsx(3) bzldfsx(6) bzldfsx(9) bzldfsx(12) bzldfsx(14) ...
    bzldfsx(17) bzldfsx(20) bzldfsx(23) bzldfsx(26) bzldfsx(28)];
bjxl3=0:0.1:1;
%以下开始进行神经网络训练
p=[bjxl1;bjxl2];
t=bjxl3;
bounds=[0 1;0 1];
net=newff(bounds,[2,5,1],{'tansig','tansig','purelin'},'traingdx');
net.trainparam.show=1000;
net.trainparam.lr=0.05;
net.trainparam.epochs=500000;
net.trainparam.goal=0.65e-3;
net=train(net,p,t);

%检验该神经网络
t2=sim(net,p);
fc2=0;
for i=2:11
    fc2=fc2+abs((t2(i)-t(i))/t(i));
end
disp('本次神经网络输出的误差为：')
pjfc2=fc2/11
if pjfc2<0.1
    disp('该神经网络的输出误差小于0.1.可以使用')
else
    disp('该神经网络的输出误差大于0.1，需重新设定参数')
end
%以下将源数据带入得到分级结果
pn=[bptlhdf;bjzldf];
bjfjsz=sim(net,pn);
%将结果进行分级（~0.2为E级，0.2~0.4为D级，0.4~0.6为C级，0.6~0.8为B级，0.8~为A级）
i1=0;i2=0;i3=0;i4=0;i5=0;
for i=1:28
    if bjfjsz(i)>=0.8
        i1=i1+1;
        ba(1,i1)=i;
        ba(2,i1)=bjfjsz(i);
    elseif bjfjsz(i)>=0.6&&bjfjsz(i)<0.8
        i2=i2+1;
        bb(1,i2)=i;
        bb(2,i2)=bjfjsz(i);
    elseif bjfjsz(i)>=0.4&&bjfjsz(i)<0.6
        i3=i3+1;
        bc(1,i3)=i;
        bc(2,i3)=bjfjsz(i);
    elseif bjfjsz(i)>=0.2&&bjfjsz(i)<0.4
        i4=i4+1;
        bd(1,i4)=i;
        bd(2,i4)=bjfjsz(i);
    else
        i5=i5+1;
        be(1,i5)=i;
        be(2,i5)=bjfjsz(i);
    end
end
ba,bb,bc,bd,be