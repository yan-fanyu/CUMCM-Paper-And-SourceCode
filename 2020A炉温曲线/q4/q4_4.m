clc; clear;  % 第四问

L=50+30.5*11+5*10;
alpha = 7.15e-04;
H1 = 6975.37;
H2 = 97.60;
xm=[alpha;H1;alpha;H1;alpha;H1;alpha;H1;alpha;H2];


Temp15 = 174.6:0.1:174.8;
Temp6 = 185.4:0.1:186.6;
Temp7 = 230.2:0.1:230.4;
Temp89 = 264.2:0.1:264.4;
V = 87.5:0.1:88.5;

Z_SArr = [];
n = 0;
Z_Sk = [];

T1 = [];
T2 = [];
T3 = [];
T4 = [];
T5 = [];
T6 = [];
T7 = [];
T8 = [];

Z_Result = zeros(1, 5);


for i1=1:length(Temp15)
    i1
    for i2=1:length(Temp6)
        for i3=1:length(Temp7)
            for i4=1:length(Temp89)
                for i5=1:length(V)
                    x = [Temp15(i1) Temp6(i2) Temp7(i3) Temp89(i4) V(i5)/60];
    
    
                    u0 = GetTemp(x(1),x(2),x(3),x(4), x(5));

                    
                    v=x(5);
                    F=[25,x(1),x(2),x(3),x(4),25];

                    T=L/v;
                    t=0:0.5:T;
                    S = -1;
                    tt = area1(x, u0);
                    if tt < 999
                        S = tt;
                        
                        
                        
                        
                        
                        % 所有大于217的温度
                        AllTemp = u0(u0>217);
                        
                        %plot(1:1:length(AllTemp), AllTemp);
                        hold on;

                        Xbar = sum(AllTemp)/length(AllTemp);    % 均值
                        M0 = max(AllTemp);                      % 众数，最大值
                        Sigma2 = 0;                             % 方差
                        for i=1:length(AllTemp)
                            Sigma2 = Sigma2 + (AllTemp(i) - Xbar)^2/length(AllTemp);
                        end
                        Sigma = Sigma2^(1/2);
                        Sk = abs(Xbar-M0)/Sigma;
                        if(Sk < 1.315)
                            n = n+1;
                            Z_SArr(n) = S;
                            Z_Sk(n) = Sk;
                            Z_Result(n, :) = x;
                        end
                    end
                end
            end
        end
    end

end


scatter(1:1:n, Z_Sk, 8, 'b');
xlabel('序号');
ylabel('SK');
title('')



% 外部温度分布（斜线的那个图）
function y=f(x,F)
    gap=5; W=30.5; Left=25;
    x1=0; x2=25;
    x3=x2+5*W+4*gap; x4=x3+gap;
    x5=x4+W;x6=x5+gap;
    x7=x6+W;x8=x7+gap;
    x9=x8+2*W+gap;x10=x9+gap;
    y=(exp(0.2007*x)+24).*(x<=x2)+F(2).*(x>x2).*(x<=x3)+((F(3)-F(2))/gap.*(x-x3)+F(2)).*(x>x3).*(x<=x4)+F(3).*(x>x4).*(x<=x5)...
    +((F(4)-F(3))/gap.*(x-x5)+F(3)).*(x>x5).*(x<=x6)+F(4).*(x>x6).*(x<=x7)...
    +((F(5)-F(4))/gap.*(x-x7)+F(4)).*(x>x7).*(x<=x8)+F(5).*(x>x8).*(x<=x9)...
    +((F(6)-F(5))/gap.*(x-x9)+F(5)).*(x>x9).*(x<=x10) + F(6).*(x>x10);
end

% 求温度分布
function t=GetTemp(u1,u2,u3,u4,v)     
    global xm L
    F=[25,u1,u2,u3,u4,25]; T=L/v;
    L1=25+5*30.5+5*5; 
    L2=L1+30.5+5;
    L3=L2+30.5+5;
    t1=L1/v;t2=L2/v;t3=L3/v;
    dt=0.5; 
    m1=floor(t1/dt)+1;
    m2=floor(t2/dt)+1;
    m3=floor(t3/dt)+1;
   
    l=0.015; 
    x=1e-4; 
    r1=xm(1)^2*dt/(x^2);
    r2=xm(3)^2*dt/(x^2);
    r3=xm(5)^2*dt/(x^2);
    r4=xm(7)^2*dt/(x^2);
    r5=xm(9)^2*dt/(x^2);
    h1=xm(2);h2=xm(4);h3=xm(6);h4=xm(8);h5=xm(10);
    n=ceil(l/x)+1; m=floor(T/dt)+1;
    u=zeros(n,m);t=ones(m,1)*25;
    u(:,1)=25;
    u0=f(v*(0:floor(T/dt))*dt,F);
    k=ceil(l/2/x);
    A1=diag([1+h1*x,2*ones(1,n-2)*(1+r1),1+h1*x]);
    A1=A1+diag([-1,-r1*ones(1,n-2)],1);
    A1=A1+diag([-r1*ones(1,n-2),-1],-1);          
    B1=diag([0,2*ones(1,n-2)*(1-r1),0]);
    B1=B1+diag([0,r1*ones(1,n-2)],1);
    B1=B1+diag([r1*ones(1,n-2),0],-1);
    C1=A1\B1;
    c=zeros(n,m); c(1,:)=h1*u0*x; 
    c(n,:)=c(1,:);
    c=A1\c;    
    for j=1:m1-1
       u(:,j+1)=C1*u(:,j)+c(:,j+1);
       t(j+1)=u(k,j+1);
    end
    
    A2=diag([1+h2*x,2*ones(1,n-2)*(1+r2),1+h2*x]);
    A2=A2+diag([-1,-r2*ones(1,n-2)],1);
    A2=A2+diag([-r2*ones(1,n-2),-1],-1);          
    B2=diag([0,2*ones(1,n-2)*(1-r2),0]);
    B2=B2+diag([0,r2*ones(1,n-2)],1);
    B2=B2+diag([r2*ones(1,n-2),0],-1);
    C2=A2\B2;
    c=zeros(n,m); c(1,:)=h2*u0*x; 
    c(n,:)=c(1,:);
    c=A2\c;    
    for j=m1:m2-1
       u(:,j+1)=C2*u(:,j)+c(:,j+1);
       t(j+1)=u(k,j+1);
    end
    
    A3=diag([1+h3*x,2*ones(1,n-2)*(1+r3),1+h3*x]);
    A3=A3+diag([-1,-r3*ones(1,n-2)],1);
    A3=A3+diag([-r3*ones(1,n-2),-1],-1);          
    B3=diag([0,2*ones(1,n-2)*(1-r3),0]);
    B3=B3+diag([0,r3*ones(1,n-2)],1);
    B3=B3+diag([r3*ones(1,n-2),0],-1);
    C3=A3\B3;
    c=zeros(n,m); c(1,:)=h3*u0*x; 
    c(n,:)=c(1,:);
    c=A3\c;    
    for j=m2:m3-1
       u(:,j+1)=C3*u(:,j)+c(:,j+1);
       t(j+1)=u(k,j+1);
    end
        
    
    A4=diag([1+h4*x,2*ones(1,n-2)*(1+r4),1+h4*x]);
    A4=A4+diag([-1,-r4*ones(1,n-2)],1);
    A4=A4+diag([-r4*ones(1,n-2),-1],-1);          
    B4=diag([0,2*ones(1,n-2)*(1-r4),0]);
    B4=B4+diag([0,r4*ones(1,n-2)],1);
    B4=B4+diag([r4*ones(1,n-2),0],-1);
    C4=A4\B4;
    c4(1,:)=h4*u0*x; 
    c4(n,:)=c4(1,:);
    c4=A4\c4;    
        
    A5=diag([1+h5*x,2*ones(1,n-2)*(1+r5),1+h5*x]);
    A5=A5+diag([-1,-r5*ones(1,n-2)],1);
    A5=A5+diag([-r5*ones(1,n-2),-1],-1);          
    B5=diag([0,2*ones(1,n-2)*(1-r5),0]);
    B5=B5+diag([0,r5*ones(1,n-2)],1);
    B5=B5+diag([r5*ones(1,n-2),0],-1);
    C5=A5\B5;
    c5(1,:)=h5*u0*x; 
    c5(n,:)=c5(1,:);
    c5=A5\c5;    
    for j=m3:m-1
       if t(j)>=t(j-1)
            u(:,j+1)=C4*u(:,j)+c4(:,j+1);            
       else
           u(:,j+1)=C5*u(:,j)+c5(:,j+1); 
       end
       t(j+1)=u(k,j+1);
    end
end

% a：积分面积
function [a]=area1(x, u0)
    
    S=0;
    
    u=u0(u0>=30);
    % 温度大于 217 的部分
    tmp2=u(u>=217)-217;
    Temp_217 = tmp2;
    t2=length(tmp2)*0.5;
    umax=max(u);  
    tmp3=abs(u(2:length(u))-u(1:length(u)-1))/0.5;
    kmax=max(tmp3);
    s=u(u(2:length(u))>=u(1:length(u)-1));
    s=s(s>=150);
    s=s(s<=190);
    t1=length(s)*0.5;   
    y=logical((umax<=250)*(umax>=240)*(t2>=40)*(t2<=90)*(kmax<=3)*(t1<=120)*(t1>=60));
    % 如果满足第三问的条件
    if y
        k=find(tmp2==max(tmp2));
        if k>2
            a=(sum(tmp2(1:k))-(tmp2(1)+tmp2(k))/2)*0.5;
        else
            a=(tmp2(1)+tmp2(k))*0.5/2;
        end
        if a > 406.1637111*1.05
            a=10000; 
        end

    else
        a=10000; 
    end
       
end


