%��������ֵ�����ڷ�������������ȡ���Ѿ������������Ѵﵽ������Ա����׼ȷ�ȵ�Ŀ��
%�ô�ʹ�õķ�����������Ϊ�������Ѿƺ�����������ѵĹ�ͬ���ݵ�����
clear all
clc
%����ί���������ֵ�������򣬵ó���ί�÷ֵ������������ڶԱ�
load xqdffile redxq1 redxq2 whitexq1 whitexq2

%�����Ѿ���������������ֵ��С����������򲢸������
[hjxq1,hjxqpm1]=sort(redxq1);
[bjxq1,bjxqpm1]=sort(whitexq1);
[hjxq2,hjxqpm2]=sort(redxq2);
[bjxq2,bjxqpm2]=sort(whitexq2);
%���븽�����еķ������ʵ�����
load fxwzfile
%��ȡ��������Ա���������־�ʱ�ڷ������ʷ���õ��ĵ÷������������ڽ������ж�׼ȷ��
[z1,hpm1]=sort(hjxqpm1);
[z2,hpm2]=sort(hjxqpm2);
[z3,bpm1]=sort(bjxqpm1);
[z4,bpm2]=sort(bjxqpm2);

%������ָ�����һ�����
hptjfxwz=[hjfxwz hfxwz];
bptjfxwz=[bjfxwz bfxwz];
%����������ѾƵ�
%����ֵ��׼����������Ϊ0~1֮��
[hfxwz1,minhfxwz,maxhfxwz]=premnmx(hptjfxwz');
hfxwz1=hfxwz1';
hfxwz=(hfxwz1+1)/2*100;
%����ÿ��ָ���¸����Ѿ���ռ�ı���
sumh=sum(hfxwz);
for i=1:128
    for j=1:27
        ph(j,i)=hfxwz(j,i)/sumh(i);
    end
end
%����ÿһ��ָ�����ֵ
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
%����ÿһ��ָ��Ĳ���ϵ��
Eh=sum(eh);
gh=(1-eh)/(128-Eh);

%��Ȩ��
Gh=sum(gh);
wh=gh/Gh;
%��������Ȩ����ȡ�ɸ÷���õ������÷�
for i=1:27
    sh(i)=0;
    for j=1:128
        sh(i)=sh(i)+wh(j)*ph(i,j);
    end
end
[f,hjpm]=sort(sh);
%�������������򣬵õ�1:27��������������ռ����λ���ڽ���������
[q1,i1]=sort(hjpm);
[q2,i2]=sort(hpm1);
[q3,i3]=sort(hpm2);
disp('���ں����Ѿƣ���һ������Ա���ʱ�õ���������ƽ����λ���Ϊ��')
hjpjwc1=sum(abs(i1-i2))/27/27
disp('���ں����Ѿƣ��ڶ�������Ա���ʱ�õ���������ƽ����λ���Ϊ��')
hjpjwc2=sum(abs(i1-i3))/27/27
%���±Ƚ�����֮���׼ȷ��
if hjpjwc1<hjpjwc2
    disp('���ں����Ѿƶ��ԣ���һ������Ա�ȵڶ����׼ȷ')
else
    disp('���ں����Ѿƶ��ԣ��ڶ�������Ա�ȵ�һ���׼ȷ')
end
%����������ѾƵ�
%����ֵ��׼����������Ϊ0~1֮��
[bfxwz1,minbfxwz,maxbfxwz]=premnmx(bptjfxwz');
bfxwz1=bfxwz1';
bfxwz=(bfxwz1+1)/2*100;
%����ÿ��ָ���¸����Ѿ���ռ�ı���
sumb=sum(bfxwz);
for i=1:128
    for j=1:28
        pb(j,i)=bfxwz(j,i)/sumb(i);
    end
end
%����ÿһ��ָ�����ֵ
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
%����ÿһ��ָ��Ĳ���ϵ��
Eb=sum(eb);
gb=(1-eb)/(128-Eb);

%��Ȩ��
Gb=sum(gb);
wb=gb/Gb;
%��������Ȩ����ȡ�ɸ÷���õ������÷�
for i=1:28
    sb(i)=0;
    for j=1:128
        sb(i)=sb(i)+wb(j)*pb(i,j);
    end
end
[f,bjpm]=sort(sb);
%�������������򣬵õ�1:28��������������ռ����λ���ڽ���������
[q4,i4]=sort(bjpm);
[q5,i5]=sort(bpm1);
[q6,i6]=sort(bpm2);
disp('���ڰ����Ѿƣ���һ������Ա���ʱ�õ���������ƽ����λ���Ϊ��')
bjpjwc1=sum(abs(i4-i5))/28/28
disp('���ڰ����Ѿƣ��ڶ�������Ա���ʱ�õ���������ƽ����λ���Ϊ��')
bjpjwc2=sum(abs(i4-i6))/28/28
%���±Ƚ�����֮���׼ȷ��
if hjpjwc1<hjpjwc2
    disp('���ڰ����Ѿƶ��ԣ���һ������Ա�ȵڶ����׼ȷ')
else
    disp('���ڰ����Ѿƶ��ԣ��ڶ�������Ա�ȵ�һ���׼ȷ')
end

