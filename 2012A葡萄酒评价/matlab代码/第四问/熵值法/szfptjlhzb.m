%��������ֵ���������ѾƱ���������ȡ���Ѿ�����
clear all
clc
%����ί��ֵ�ֵ�������򣬵ó���ί�÷ֵ������������ڶԱ�
load clhsjfile red2 white2

hjjz=sum(red2,2)';
bjjz=sum(white2,2)';
%�����Ѿ��������а��մ�С����������򲢸������
[hj,hjpm]=sort(hjjz);
[bj,bjpm]=sort(bjjz);
%���븽�����е����ѾƵ�����
load fj2ptjfile
%����������ѾƵ�
%����ֵ��׼����������Ϊ0~1֮��
[hjzb1,minhjzb,maxhjzb]=premnmx(hjzb');
hjzb1=hjzb1';
hjlh=(hjzb1+1)/2*100;
%����ÿ��ָ���¸����Ѿ���ռ�ı���
sumh=sum(hjlh);
for i=1:9
    for j=1:27
        ph(j,i)=hjlh(j,i)/sumh(i);
    end
end
%����ÿһ��ָ�����ֵ
k=1/log(27);
for i=1:9
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
%����ÿһ��ָ��Ĳ���ϵ��
Eh=sum(eh);
gh=(1-eh)/(9-Eh);

%��Ȩ��
Gh=sum(gh);
wh=gh/Gh;
%��������Ȩ����ȡ�ɸ÷���õ������÷�
for i=1:27
    sh(i)=0;
    for j=1:9
        sh(i)=sh(i)+wh(j)*ph(i,j);
    end
end
[f,hpm]=sort(sh);
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

%����������ѾƵ�
%����ֵ��׼����������Ϊ0~1֮��
[bjzb1,minbjzb,maxbjzb]=premnmx(bjzb');
bjzb1=bjzb1';
bjlh=(bjzb1+1)/2*100;
%����ÿ��ָ���¸����Ѿ���ռ�ı���
sumb=sum(bjlh);
for i=1:8
    for j=1:28
        pb(j,i)=bjlh(j,i)/sumb(i);
    end
end
%����ÿһ��ָ�����ֵ
k=1/log(28);
for i=1:8
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
%����ÿһ��ָ��Ĳ���ϵ��
Eb=sum(eb);
gb=(1-eb)/(8-Eh);

%��Ȩ��
Gb=sum(gb);
wb=gb/Gb;
%��������Ȩ����ȡ�ɸ÷���õ������÷�
for i=1:28
    sb(i)=0;
    for j=1:8
        sb(i)=sb(i)+wb(j)*pb(i,j);
    end
end
[f,bpm]=sort(sb);
%�������������򣬵õ�1:28��������������ռ����λ���ڽ���������
[q3,i3]=sort(bjpm);
[q4,i4]=sort(bpm);
disp('���ڰ����Ѿƣ����ַ�ʽ�õ��������ģ�ƽ����λ���Ϊ��')
pjwc=sum(abs(i3-i4))/27
if pjwc<27*0.25
    disp('���ڰ����Ѿƶ��ԣ����ַ�ʽ����������λ���С���ķ�֮һ��˵����ָ���������ֱ����ȡ����')
else
    disp('���ڰ����Ѿƶ��ԣ����ַ�ʽ����������λ�������ķ�֮һ�������̫����')
end