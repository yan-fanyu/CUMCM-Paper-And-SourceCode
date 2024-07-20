clear all
clc
clf
%调出对题目数据处理后的各评酒员对不同酒的打分
load clhsjfile

%求出在评价红酒是两组评酒员评价时的方差
for i=1:27
    %求出两组评酒员评价时的平均值
    r1(i)=sum(red1(i,:))/10;
    r2(i)=sum(red2(i,:))/10;
end
%用评酒员评价红酒时与以上求出的平均值比较求出相应方差
for i=1:27
    fch1(i)=0;
    fch2(i)=0;
    for j=1:10
        fch1(i)=fch1(i)+(red1(i,j)-r1(i))^2;
        fch2(i)=fch2(i)+(red2(i,j)-r2(i))^2;
    end
    fchj1(i)=sqrt(fch1(i)/9);
    fchj2(i)=sqrt(fch2(i)/9);
end
%求出两组评酒员对红酒评价时的平均方差
fchjpj1=(sum(fchj1))/27;
fchjpj2=(sum(fchj2))/27;

%求出在评价白酒是两组评酒员评价时的方差
for i=1:28
    %求出两组评酒员评价时的平均值
    w1(i)=sum(white1(i,:))/10;
    w2(i)=sum(white2(i,:))/10;
end
%用评酒员评价白酒时与以上求出的平均值比较求出相应方差
for i=1:28
    fcb1(i)=0;
    fcb2(i)=0;
    for j=1:10
        fcb1(i)=fcb1(i)+(white1(i,j)-w1(i))^2;
        fcb2(i)=fcb2(i)+(white2(i,j)-w2(i))^2;
    end
    fcbj1(i)=sqrt(fcb1(i)/9);
    fcbj2(i)=sqrt(fcb2(i)/9);
end
%求出两组评酒员对白酒评价时的平均方差
fcbjpj1=(sum(fcbj1))/28;
fcbjpj2=(sum(fcbj2))/28;

%求出对以上两种酒评价时，两组评酒员的平均方差
fcpj1=(fchjpj1+fcbjpj1)/2;
fcpj2=(fchjpj2+fcbjpj2)/2;

%表述出评价时误差结果
disp('描述红酒时，两组评酒员打分时的方差分别为：')
[fchjpj1 fchjpj2]
disp('描述白酒时，两组评酒员打分时的方差分别为：')
[fcbjpj1 fcbjpj2]
disp('综合后，两组评酒员打分时的方差分别为：')
[fcpj1 fcpj2]

%绘图直观表述出结果
jb=[1 2];
zu1=[fchjpj1 fcbjpj1];
zu2=[fchjpj2 fcbjpj2];
plot(jb,zu1,'r*',jb,zu2,'bo')
title('两组评酒员打分时的方差比较');
xlabel('代表两种不同的酒');
ylabel('两组评酒员打分时的平均误差');
text(1,fchjpj1+0.2,'一组评红酒时方差')
text(2-0.3,fcbjpj1-0.3,'一组评白酒时方差')
text(1,fchjpj2+0.2,'二组评红酒时方差')
text(2-0.3,fcbjpj2+0.2,'二组评白酒时方差')
legend('第一组评酒员所得数据的方差','第二组评酒员所得数据的方差')