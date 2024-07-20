clear all
clc
%将评委打分的值进行排序，得出评委得分的排名，以利于对比
load clhsjfile red2 white2

hjjz=sum(red2,2)';
bjjz=sum(white2,2)';
%对葡萄酒质量进行按照从小到大进行排序并给予分数
[hj,hjpm]=sort(hjjz);
[bj,bjpm]=sort(bjjz);

%将spss中求得的主成分导入，得到各自所占的比重
load lhzbqzfile
%导入保存好的附件二中的葡萄酒的数据
load fj2clhsjfile
%首先求红葡萄方面的
%对红葡萄酒的理化指标进行归一化
[hjzbpn1,minfj2hj,maxfj2hj]=premnmx(fj2hj');
hjzbpn=hjzbpn1';
for i=1:27
    F(i)=0;
    for j=1:30
        F(i)=F(i)+hlhqz(j)*hjzbpn(i,j);
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
%对白葡萄酒的理化指标进行归一化
[bjzbpn1,minfj2bj,maxfj2bj]=premnmx(fj2bj');
bjzbpn=bjzbpn1';
for i=1:28
    F1(i)=0;
    for j=1:30
        F1(i)=F1(i)+blhqz(j)*bjzbpn(i,j);
    end
end
[f,bpm]=sort(F1);
%将两种排名升序，得到1:28在两种排名中所占的排位，在进行求解误差
[q3,i3]=sort(bjpm);
[q4,i4]=sort(bpm);
disp('对于白葡萄酒，两种方式得到的排名的，平均排位误差为：')
pjwc=sum(abs(i3-i4))/28
if pjwc<28*0.25
    disp('对于红葡萄酒而言，两种方式所带来的排位误差小于四分之一，说明理化指标可以用来直接求取质量')
else
    disp('对于红葡萄酒而言，两种方式所带来的排位误差大于四分之一，结果不太理想')
end
