clear all
clc
%����ί��ֵ�ֵ�������򣬵ó���ί�÷ֵ������������ڶԱ�
load clhsjfile red2 white2

hjjz=sum(red2,2)';
bjjz=sum(white2,2)';
%�����Ѿ��������а��մ�С����������򲢸������
[hj,hjpm]=sort(hjjz);
[bj,bjpm]=sort(bjjz);

%��spss����õ����ɷֵ��룬�õ�������ռ�ı���
load lhzbqzfile
%���뱣��õĸ������е����ѾƵ�����
load fj2clhsjfile
%����������ѷ����
%�Ժ����ѾƵ���ָ����й�һ��
[hjzbpn1,minfj2hj,maxfj2hj]=premnmx(fj2hj');
hjzbpn=hjzbpn1';
for i=1:27
    F(i)=0;
    for j=1:30
        F(i)=F(i)+hlhqz(j)*hjzbpn(i,j);
    end
end
[f,hpm]=sort(F);
%�������������򣬵õ�1:27��������������ռ����λ���ڽ���������
[q1,i1]=sort(hjpm);
[q2,i2]=sort(hpm);
disp('���ں����Ѿƣ����ַ�ʽ�õ��������ģ�ƽ����λ���Ϊ��')
pjwc=sum(abs(i1-i2))/27
if pjwc<27*0.25
    disp('���ں����Ѿƶ��ԣ����ַ�ʽ����������λ���С���ķ�֮һ��˵����ָ���������ֱ����ȡ����')
else
    disp('���ں����Ѿƶ��ԣ����ַ�ʽ����������λ�������ķ�֮һ�������̫����')
end

%����������ѷ����
%�԰����ѾƵ���ָ����й�һ��
[bjzbpn1,minfj2bj,maxfj2bj]=premnmx(fj2bj');
bjzbpn=bjzbpn1';
for i=1:28
    F1(i)=0;
    for j=1:30
        F1(i)=F1(i)+blhqz(j)*bjzbpn(i,j);
    end
end
[f,bpm]=sort(F1);
%�������������򣬵õ�1:28��������������ռ����λ���ڽ���������
[q3,i3]=sort(bjpm);
[q4,i4]=sort(bpm);
disp('���ڰ����Ѿƣ����ַ�ʽ�õ��������ģ�ƽ����λ���Ϊ��')
pjwc=sum(abs(i3-i4))/28
if pjwc<28*0.25
    disp('���ں����Ѿƶ��ԣ����ַ�ʽ����������λ���С���ķ�֮һ��˵����ָ���������ֱ����ȡ����')
else
    disp('���ں����Ѿƶ��ԣ����ַ�ʽ����������λ�������ķ�֮һ�������̫����')
end
