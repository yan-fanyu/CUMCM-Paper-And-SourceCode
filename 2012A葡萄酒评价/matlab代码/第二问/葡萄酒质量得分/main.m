%ͨ������Ա����ʱ�ķ����Ծƽ�������������ÿ�־����������ߵ͸��������÷�
clear all
clc
load clhsjfile red2 white2

hjjz=sum(red2,2)';
bjjz=sum(white2,2)';
%�����Ѿ��������а��մ�С����������򲢸������
[hj,hjpm]=sort(hjjz);
[bj,bjpm]=sort(bjjz);
hjdf=linspace(0,1,27);
bjdf=linspace(0,1,28);

%���ں�ƺͰ׾ƣ�������Ʒ�������и������
[hjsx,hji]=sort(hjpm);
[bjsx,bji]=sort(bjpm);
%���¶��ں�Ƹ������
for i=1:27
    hjzldf(i)=hjdf(hji(i));
end
%���¶��ڰ׾Ƹ������
for i=1:28
    bjzldf(i)=bjdf(bji(i));
end
disp('����Ϊ�����Ѿư��������õ��ķ�����')
hjzldf
disp('����Ϊ�����Ѿư��������õ��ķ�����')
bjzldf
%�����ư�����Ʒ����������������ͼ
plot(hjsx,hjzldf,'r*-')
title('�����Ѿ�������������ͼ')
xlabel('�����Ѿ���Ʒ����')
ylabel('�����Ѿư������������÷�')
%����׾ư�����Ʒ����������������ͼ
figure
plot(bjsx,bjzldf,'bo-')
title('�����Ѿ�������������ͼ')
xlabel('�����Ѿ���Ʒ����')
ylabel('�����Ѿư������������÷�')
%��������ѾƵ������÷�
save zldffile hjzldf bjzldf