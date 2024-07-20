clear all
clc
%将评委打分的值进行排序，得出评委得分的排名，以利于对比
load clhsjfile red2 white2

hjjz=sum(red2,2)';
bjjz=sum(white2,2)';
%对葡萄酒质量进行按照从小到大进行排序并给予分数
[hj,hjpm]=sort(hjjz);
[bj,bjpm]=sort(bjjz);

%首先求红葡萄方面的
%将spss中求得的主成分进一步处理，得到各自所占的比重
qz1=[0.59648 0.15636];
qz=qz1/sum(qz1);
qzzbz=[0.829 0.931 0.976 0.914 0.541 0.965 -0.862 -0.084 0.233;
    -0.139 -0.162 -0.094 -0.176 0.452 -0.067 -0.336 0.856 0.517];
for i=1:9
    zhqz(i)=0;
    for j=1:2
        zhqz(i)=zhqz(i)+qz(j)*qzzbz(j,i);
    end
end
%导入保存好的附件二中的葡萄酒的数据
load fj2ptjfile
%对红葡萄酒的理化指标进行归一化
[hjzbpn1,minhjzb,maxhjzb]=premnmx(hjzb');
hjzbpn=hjzbpn1';
for i=1:27
    F(i)=0;
    for j=1:9
        F(i)=F(i)+zhqz(j)*hjzbpn(i,j);
    end
end
[f,hpm]=sort(F);
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

%以下求白葡萄方面的
%将spss中求得的主成分进一步处理，得到各自所占的比重
qz2=[0.37448 0.29498 0.13471];
bqz=qz2/sum(qz2);
bqzzbz=[0.898 0.928 0.666 -0.268 0.808 -0.051 0.394 -0.048;
    -0.179 -0.189 0.185 -0.001 -0.083 0.885 0.707 -0.984;
    0.108 0.112 0.092 0.911 0.158 0.274 -0.337 -0.034];
for i=1:8
    bzhqz(i)=0;
    for j=1:3
        bzhqz(i)=bzhqz(i)+bqz(j)*bqzzbz(j,i);
    end
end

%对白葡萄酒的理化指标进行归一化
[bjzbpn1,minbjzb,maxbjzb]=premnmx(bjzb');
bjzbpn=bjzbpn1';
for i=1:28
    F1(i)=0;
    for j=1:8
        F1(i)=F1(i)+bzhqz(j)*bjzbpn(i,j);
    end
end
[f,bpm]=sort(F1);
%将两种排名升序，得到1:28在两种排名中所占的排位，在进行求解误差
[q3,i3]=sort(bjpm);
[q4,i4]=sort(bpm);
disp('对于白葡萄酒，两种方式得到的排名的，平均排位误差为：')
pjwc=sum(abs(i3-i4))/28
if pjwc<28*0.25
    disp('对于白葡萄酒而言，两种方式所带来的排位误差小于四分之一，说明理化指标可以用来直接求取质量')
else
    disp('对于白葡萄酒而言，两种方式所带来的排位误差大于四分之一，结果不太理想')
end
