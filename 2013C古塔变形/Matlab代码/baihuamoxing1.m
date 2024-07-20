clc
clear
x1=[0.000141404 	0.000121639 	0.000089860 	0.000056555]; 
x2=[0.000141405 	0.000121641 	0.000089920 	0.000056556 ];
x3=[0.000141406 	0.000121642 	0.000089977 	0.000056556 ];
x4=[0.000141407 	0.000121643 	0.000090030 	0.000056557 ];
x5=[0.000141408 	0.000121644 	0.000090089 	0.000056557 ];
x6=[0.000141408 	0.000121645 	0.000090149 	0.000056558 ];
x7=[0.000141409 	0.000121646 	0.000090200 	0.000056558 ];
x8=[0.000141409 	0.000121646 	0.000090250 	0.000056558 ];
x9=[0.000141409 	0.000121647 	0.000090301 	0.000056559 ];
x10=[0.000141409 	0.000121647 	0.000090352 	0.000056559 ];
x11=[0.000141408 	0.000121648 	0.000090417 	0.000056559 ];
x12=[0.000141408 	0.000121648 	0.000090486 	0.000056560 ];
x13=[0.000141408 	0.000121648 	0.000090555 	0.000056560 ];
x14=[0.000141407 	0.000121648 	0.000090599 	0.000056560 ];

x0=x1(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a1(1,:)=x0;
a1(2,:)=x0_hat;
a1(3,:)=epsilon;
a1(4,:)=delta;

x0=x2(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a2(1,:)=x0;
a2(2,:)=x0_hat;
a2(3,:)=epsilon;
a2(4,:)=delta;

x0=x3(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a3(1,:)=x0;
a3(2,:)=x0_hat;
a3(3,:)=epsilon;
a3(4,:)=delta;

x0=x4(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a4(1,:)=x0;
a4(2,:)=x0_hat;
a4(3,:)=epsilon;
a4(4,:)=delta;

x0=x5(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a5(1,:)=x0;
a5(2,:)=x0_hat;
a5(3,:)=epsilon;
a5(4,:)=delta;

x0=x6(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a6(1,:)=x0;
a6(2,:)=x0_hat;
a6(3,:)=epsilon;
a6(4,:)=delta;

x0=x7(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a7(1,:)=x0;
a7(2,:)=x0_hat;
a7(3,:)=epsilon;
a7(4,:)=delta;

x0=x8(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a8(1,:)=x0;
a8(2,:)=x0_hat;
a8(3,:)=epsilon;
a8(4,:)=delta;

x0=x9(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a9(1,:)=x0;
a9(2,:)=x0_hat;
a9(3,:)=epsilon;
a9(4,:)=delta;

x0=x10(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a10(1,:)=x0;
a10(2,:)=x0_hat;
a10(3,:)=epsilon;
a10(4,:)=delta;

x0=x11(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a11(1,:)=x0;
a11(2,:)=x0_hat;
a11(3,:)=epsilon;
a11(4,:)=delta;

x0=x12(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a12(1,:)=x0;
a12(2,:)=x0_hat;
a12(3,:)=epsilon;
a12(4,:)=delta;

x0=x13(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a13(1,:)=x0;
a13(2,:)=x0_hat;
a13(3,:)=epsilon;
a13(4,:)=delta;

x0=x14(1,:);%原始数据序列
n=length(x0);
a_x0=diff(x0)';%求1次累减序列，即1阶向前差分
B=[-x0(2:end)',ones(n-1,1)];
u=B\a_x0%最小二乘拟合参数
x=dsolve('D2x+a*Dx=b','x(0)=c1,Dx(0)=c2');%求二阶微分方程的符号解
x=subs(x,{'a','b','c1','c2'},{u(1),u(2),x0(1),x0(1)});
yuce=subs(x,'t',0:n-1)%求已知数据点1次累加序列的预测值
x=vpa(x,6)
x0_hat=[yuce(1),diff(yuce)]%求已知数据点的预测值
epsilon=x0-x0_hat%求残差
delta=abs(epsilon./x0)%求相对误差
a14(1,:)=x0;
a14(2,:)=x0_hat;
a14(3,:)=epsilon;
a14(4,:)=delta;
