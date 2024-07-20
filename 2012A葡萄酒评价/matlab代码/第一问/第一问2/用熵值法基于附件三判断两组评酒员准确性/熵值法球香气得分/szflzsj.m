%以下用熵值法基于芳香物质数据求取葡萄酒香气质量，已达到对评酒员评价准确度的目的
%该处使用的芳香物质数据为两种葡萄酒和两种酿酒葡萄的共同数据的数据
clear all
clc
%将评委打分香气的值进行排序，得出评委得分的排名，以利于对比
load xqdffile redxq1 redxq2 whitexq1 whitexq2

%对葡萄酒质量按照香气的值从小到大进行排序并给予分数
[hjxq1,hjxqpm1]=sort(redxq1);
[bjxq1,bjxqpm1]=sort(whitexq1);
[hjxq2,hjxqpm2]=sort(redxq2);
[bjxq2,bjxqpm2]=sort(whitexq2);
%导入附件三中的芳香物质的数据
load fxwzfile
%求取两组评酒员在评价两种酒时在芳香物质方面得到的得分排名，以利于接下来判断准确度
[z1,hpm1]=sort(hjxqpm1);
[z2,hpm2]=sort(hjxqpm2);
[z3,bpm1]=sort(bjxqpm1);
[z4,bpm2]=sort(bjxqpm2);

%将两种指标放在一起求解
hptjfxwz=[hjfxwz hfxwz];
bptjfxwz=[bjfxwz bfxwz];
%首先求红葡萄酒的
%将数值标准化处理，处理为0~1之间
[hfxwz1,minhfxwz,maxhfxwz]=premnmx(hptjfxwz');
hfxwz1=hfxwz1';
hfxwz=(hfxwz1+1)/2*100;
%计算每个指标下各葡萄酒所占的比重
sumh=sum(hfxwz);
for i=1:128
    for j=1:27
        ph(j,i)=hfxwz(j,i)/sumh(i);
    end
end
%计算每一项指标的熵值
k=1/log(27);
for i=1:128
    eh(i)=0;
    for j=1:27
        if ph(j,i)==0
            eh(i)=eh(i);
        else
            eh(i)=eh(i)+ph(j,i)*log(ph(j,i));
        end
    end
    eh(i)=-k*eh(i);
end
%计算每一项指标的差异系数
Eh=sum(eh);
gh=(1-eh)/(128-Eh);

%求权重
Gh=sum(gh);
wh=gh/Gh;
%根据上述权重求取由该法求得的质量得分
for i=1:27
    sh(i)=0;
    for j=1:128
        sh(i)=sh(i)+wh(j)*ph(i,j);
    end
end
[f,hjpm]=sort(sh);
%将两种排名升序，得到1:27在两种排名中所占的排位，在进行求解误差
[q1,i1]=sort(hjpm);
[q2,i2]=sort(hpm1);
[q3,i3]=sort(hpm2);
disp('对于红葡萄酒，第一组评酒员打分时得到的排名，平均排位误差为：')
hjpjwc1=sum(abs(i1-i2))/27/27
disp('对于红葡萄酒，第二组评酒员打分时得到的排名，平均排位误差为：')
hjpjwc2=sum(abs(i1-i3))/27/27
%以下比较两者之间的准确性
if hjpjwc1<hjpjwc2
    disp('对于红葡萄酒而言，第一组评酒员比第二组更准确')
else
    disp('对于红葡萄酒而言，第二组评酒员比第一组更准确')
end
%以下求白葡萄酒的
%将数值标准化处理，处理为0~1之间
[bfxwz1,minbfxwz,maxbfxwz]=premnmx(bptjfxwz');
bfxwz1=bfxwz1';
bfxwz=(bfxwz1+1)/2*100;
%计算每个指标下各葡萄酒所占的比重
sumb=sum(bfxwz);
for i=1:128
    for j=1:28
        pb(j,i)=bfxwz(j,i)/sumb(i);
    end
end
%计算每一项指标的熵值
k=1/log(28);
for i=1:128
    eb(i)=0;
    for j=1:28
        if pb(j,i)==0
            eb(i)=eb(i);
        else
            eb(i)=eb(i)+pb(j,i)*log(pb(j,i));
        end
    end
    eb(i)=-k*eb(i);
end
%计算每一项指标的差异系数
Eb=sum(eb);
gb=(1-eb)/(128-Eb);

%求权重
Gb=sum(gb);
wb=gb/Gb;
%根据上述权重求取由该法求得的质量得分
for i=1:28
    sb(i)=0;
    for j=1:128
        sb(i)=sb(i)+wb(j)*pb(i,j);
    end
end
[f,bjpm]=sort(sb);
%将两种排名升序，得到1:28在两种排名中所占的排位，在进行求解误差
[q4,i4]=sort(bjpm);
[q5,i5]=sort(bpm1);
[q6,i6]=sort(bpm2);
disp('对于白葡萄酒，第一组评酒员打分时得到的排名，平均排位误差为：')
bjpjwc1=sum(abs(i4-i5))/28/28
disp('对于白葡萄酒，第二组评酒员打分时得到的排名，平均排位误差为：')
bjpjwc2=sum(abs(i4-i6))/28/28
%以下比较两者之间的准确性
if hjpjwc1<hjpjwc2
    disp('对于白葡萄酒而言，第一组评酒员比第二组更准确')
else
    disp('对于白葡萄酒而言，第二组评酒员比第一组更准确')
end

