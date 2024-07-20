%以下用熵值法基于酿酒葡萄和葡萄酒两者理化指标共同求取葡萄酒质量
clear all
clc
%将评委打分的值进行排序，得出评委得分的排名，以利于对比
load clhsjfile red2 white2

hjjz=sum(red2,2)';
bjjz=sum(white2,2)';
%对葡萄酒质量进行按照从小到大进行排序并给予分数
[hj,hjpm]=sort(hjjz);
[bj,bjpm]=sort(bjjz);
%导入附件二中的酿酒葡萄和葡萄酒的数据
load fj2clhsjfile
load fj2ptjfile
%首先求红葡萄酒的
hj=[fj2hj hjzb];
%将数值标准化处理，处理为0~1之间

[hjlh1,minhj,maxhj]=premnmx(hj');
hjlh1=hjlh1';
hjlh=(hjlh1+1)/2*100;
%计算每个指标下各葡萄酒所占的比重
sumh=sum(hjlh);
for i=1:39
    for j=1:27
        ph(j,i)=hjlh(j,i)/sumh(i);
    end
end
%计算每一项指标的熵值
k=1/log(27);
for i=1:39
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
gh=(1-eh)/(39-Eh);

%求权重
Gh=sum(gh);
wh=gh/Gh;
%根据上述权重求取由该法求得的质量得分
for i=1:27
    sh(i)=0;
    for j=1:39
        sh(i)=sh(i)+wh(j)*ph(i,j);
    end
end
[f,hpm]=sort(sh);
%将两种排名升序，得到1:27在两种排名中所占的排位，在进行求解误差
[q1,i1]=sort(hjpm);
[q2,i2]=sort(hpm);
disp('对于红葡萄酒，两种方式得到的排名的，平均排位误差为：')
pjwc=sum(abs(i1-i2))/27
if pjwc<27*0.25
    disp('对于红葡萄酒而言，两种方式所带来的排位误差小于四分之一，说明理化指标可以用来直接求取质量')
else
    disp('对于红葡萄酒而言，两种方式所带来的排位误差大于四分之一，结果不太理想')
end

%以下求白葡萄酒的
bj=[fj2bj bjzb];
%将数值标准化处理，处理为0~1之间
[bjlh1,minbj,maxbj]=premnmx(bj');
bjlh1=bjlh1';
bjlh=(bjlh1+1)/2*100;
%计算每个指标下各葡萄酒所占的比重
sumb=sum(bjlh);
for i=1:38
    for j=1:28
        pb(j,i)=bjlh(j,i)/sumb(i);
    end
end
%计算每一项指标的熵值
k=1/log(28);
for i=1:38
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
gb=(1-eb)/(38-Eb);

%求权重
Gb=sum(gb);
wb=gb/Gb;
%根据上述权重求取由该法求得的质量得分
for i=1:28
    sb(i)=0;
    for j=1:38
        sb(i)=sb(i)+wb(j)*pb(i,j);
    end
end
[f,bpm]=sort(sb);
%将两种排名升序，得到1:28在两种排名中所占的排位，在进行求解误差
[q3,i3]=sort(hjpm);
[q4,i4]=sort(hpm);
disp('对于白葡萄酒，两种方式得到的排名的，平均排位误差为：')
pjwc=sum(abs(i3-i4))/28
if pjwc<28*0.25
    disp('对于白葡萄酒而言，两种方式所带来的排位误差小于四分之一，说明理化指标可以用来直接求取质量')
else
    disp('对于白葡萄酒而言，两种方式所带来的排位误差大于四分之一，结果不太理想')
end