clc
clear
	x1=[-7.16E-08	-3.95E-06	2.80E-09];
	x2=[1.05E-08	-3.48E-06	-5.58E-08];
	x3=[1.83E-07	-4.40E-05	-1.44E-06];
	x4=[-6.65E-07	-3.05E-05	-3.83E-07];
	x5=[3.09E-08	-3.50E-05	-1.34E-06];
	x6=[-1.21E-07	-4.12E-05	-4.87E-08];
	x7=[-8.74E-08	-2.59E-05	1.32E-07];
	x8=[7.86E-08	-2.32E-05	-1.56E-07];
	x9=[-5.02E-08	-2.10E-05	-1.62E-07];
	x10=[1.18E-07	-1.84E-05	-1.76E-06];
	x11=[1.76E-07	-3.68E-05	-1.96E-06];
	x12=[1.98E-07	-4.70E-05	1.66E-06];
	x13=[1.59E-07	-7.17E-05	-2.39E-07];

x0=x1(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a1(1,:)=x0;
a1(2,:)=x0_hat;
a1(3,:)=epsilon;
a1(4,:)=delta;

x0=x2(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a2(1,:)=x0;
a2(2,:)=x0_hat;
a2(3,:)=epsilon;
a2(4,:)=delta;

x0=x3(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a3(1,:)=x0;
a3(2,:)=x0_hat;
a3(3,:)=epsilon;
a3(4,:)=delta;

x0=x4(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a4(1,:)=x0;
a4(2,:)=x0_hat;
a4(3,:)=epsilon;
a4(4,:)=delta;

x0=x5(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a5(1,:)=x0;
a5(2,:)=x0_hat;
a5(3,:)=epsilon;
a5(4,:)=delta;

x0=x6(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a6(1,:)=x0;
a6(2,:)=x0_hat;
a6(3,:)=epsilon;
a6(4,:)=delta;

x0=x7(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a7(1,:)=x0;
a7(2,:)=x0_hat;
a7(3,:)=epsilon;
a7(4,:)=delta;

x0=x8(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a8(1,:)=x0;
a8(2,:)=x0_hat;
a8(3,:)=epsilon;
a8(4,:)=delta;

x0=x9(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a9(1,:)=x0;
a9(2,:)=x0_hat;
a9(3,:)=epsilon;
a9(4,:)=delta;

x0=x10(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a10(1,:)=x0;
a10(2,:)=x0_hat;
a10(3,:)=epsilon;
a10(4,:)=delta;

x0=x11(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a11(1,:)=x0;
a11(2,:)=x0_hat;
a11(3,:)=epsilon;
a11(4,:)=delta;

x0=x12(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a12(1,:)=x0;
a12(2,:)=x0_hat;
a12(3,:)=epsilon;
a12(4,:)=delta;

x0=x13(1,:);%ԭʼ��������
n=length(x0);
a_x0=diff(x0)';%��1���ۼ����У���1����ǰ���
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%��С������ϲ���
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%�����΢�ַ��̵ķ��Ž�
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%����֪���ݵ�1���ۼ����е�Ԥ��ֵ
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%����֪���ݵ��Ԥ��ֵ
epsilon=x0-x0_hat%��в�
delta=abs(epsilon./x0)%��������
a13(1,:)=x0;
a13(2,:)=x0_hat;
a13(3,:)=epsilon;
a13(4,:)=delta;