%��������ĸ���ָ����ռ���ز����������������������ֵ�õ���������ѵ���ָ��÷�
clear all
clc
%�������ָ����ռ��Ȩ��
load lhzbqzfile
%����������������ĸ���ָ���ֵ
load hbptlhhsjfile
%������27�ֺ����ѵ���ָ��÷֣�����Խ��Խ�ã�
for i=1:27
    hptlhdfys(i)=0;
    for j=1:30
        hptlhdfys(i)=hptlhdfys(i)+hlhqz(j)*lhhj(i,j);
    end
end
hptlhdfmax=max(hptlhdfys);
hptlhdf=hptlhdfys/hptlhdfmax;
disp('27����ƺ����ѵ���ָ��÷�Ϊ��')
hptlhdf
plot(1:27,hptlhdf,'r*-')
title('27����ƺ����ѵ���ָ��÷�����ͼ')
xlabel('27����ƺ�����')
ylabel('�������ѵĵ÷�')

%������28�ְ����ѵ���ָ��÷֣�����Խ��Խ�ã�
for i=1:28
    bptlhdfys(i)=0;
    for j=1:30
        bptlhdfys(i)=bptlhdfys(i)+blhqz(j)*lhbj(i,j);
    end
end
bptlhdfmax=max(bptlhdfys);
bptlhdf=bptlhdfys/bptlhdfmax;
disp('28����ư����ѵ���ָ��÷�Ϊ��')
bptlhdf
figure
plot(1:28,bptlhdf,'bo-')
title('28����ư����ѵ���ָ��÷�����ͼ')
xlabel('28����ư�����')
ylabel('�������ѵĵ÷�')
save lhzbdffile hptlhdf bptlhdf