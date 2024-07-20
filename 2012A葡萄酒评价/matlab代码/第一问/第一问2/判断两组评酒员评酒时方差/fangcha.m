clear all
clc
clf
%��������Ŀ���ݴ����ĸ�����Ա�Բ�ͬ�ƵĴ��
load clhsjfile

%��������ۺ������������Ա����ʱ�ķ���
for i=1:27
    %�����������Ա����ʱ��ƽ��ֵ
    r1(i)=sum(red1(i,:))/10;
    r2(i)=sum(red2(i,:))/10;
end
%������Ա���ۺ��ʱ�����������ƽ��ֵ�Ƚ������Ӧ����
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
%�����������Ա�Ժ������ʱ��ƽ������
fchjpj1=(sum(fchj1))/27;
fchjpj2=(sum(fchj2))/27;

%��������۰׾�����������Ա����ʱ�ķ���
for i=1:28
    %�����������Ա����ʱ��ƽ��ֵ
    w1(i)=sum(white1(i,:))/10;
    w2(i)=sum(white2(i,:))/10;
end
%������Ա���۰׾�ʱ�����������ƽ��ֵ�Ƚ������Ӧ����
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
%�����������Ա�԰׾�����ʱ��ƽ������
fcbjpj1=(sum(fcbj1))/28;
fcbjpj2=(sum(fcbj2))/28;

%������������־�����ʱ����������Ա��ƽ������
fcpj1=(fchjpj1+fcbjpj1)/2;
fcpj2=(fchjpj2+fcbjpj2)/2;

%����������ʱ�����
disp('�������ʱ����������Ա���ʱ�ķ���ֱ�Ϊ��')
[fchjpj1 fchjpj2]
disp('�����׾�ʱ����������Ա���ʱ�ķ���ֱ�Ϊ��')
[fcbjpj1 fcbjpj2]
disp('�ۺϺ���������Ա���ʱ�ķ���ֱ�Ϊ��')
[fcpj1 fcpj2]

%��ͼֱ�۱��������
jb=[1 2];
zu1=[fchjpj1 fcbjpj1];
zu2=[fchjpj2 fcbjpj2];
plot(jb,zu1,'r*',jb,zu2,'bo')
title('��������Ա���ʱ�ķ���Ƚ�');
xlabel('�������ֲ�ͬ�ľ�');
ylabel('��������Ա���ʱ��ƽ�����');
text(1,fchjpj1+0.2,'һ�������ʱ����')
text(2-0.3,fcbjpj1-0.3,'һ�����׾�ʱ����')
text(1,fchjpj2+0.2,'���������ʱ����')
text(2-0.3,fcbjpj2+0.2,'�������׾�ʱ����')
legend('��һ������Ա�������ݵķ���','�ڶ�������Ա�������ݵķ���')