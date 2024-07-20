clc; clear;  %问题一
global F v T
F=[25 178 198 225 264 25];
v = 83.00337877/60;
% 225-245
TT = [225 230 235 240];
alpha = 7.15e-04;
H1 = 6975.37;
H2 = 97.60;
xm=[alpha;H1;alpha;H1;alpha;H1;alpha;H1;alpha;H2];
W = 30.5;
Left = 25;
Right = 25;
gap = 5;
L=Left*2+W*11+gap*10;  % 总长度
dt=0.5;             % 时间变化率
T=L/v;              % 总时间
t=0:dt:T;           % 各个时间点
for i=1:4
    F(2) = TT(i);
    if i==1
        u1=heat(xm);
    elseif i==2 
        u2=heat(xm);
    elseif i==3
        u3=heat(xm);
    elseif i==4
        u4=heat(xm);
    end
end

size = 15;
plot(t,u1, 'linewidth', 2);
hold on;
plot(t,u2, 'linewidth', 2);
hold on;
plot(t,u3, 'linewidth', 2);
hold on;
plot(t,u4, 'linewidth', 2);
xlabel( '时间/s','FontSize',size);
ylabel('温度/℃','FontSize',size);
title('小温区7温度灵敏度分析','FontSize',size);
daspect([1,1.6,1]);
ylim([0 280]);
legend('T=225/°C', 'T=230/°C', 'T=235/°C', 'T=240/°C','FontSize',size-5);





function y=f(x)
    global F
    l=5; L=30.5; s=25;
    x1=0; x2=25;
    x3=x2+5*L+4*l; x4=x3+l;
    x5=x4+L;x6=x5+l;
    x7=x6+L;x8=x7+l;
    x9=x8+2*L+l;x10=x9+l;
    y=(exp(0.2007*x)+24).*(x<=x2)+F(2).*(x>x2).*(x<=x3)+((F(3)-F(2))/l.*(x-x3)+F(2)).*(x>x3).*(x<=x4)+F(3).*(x>x4).*(x<=x5)...
    +((F(4)-F(3))/l.*(x-x5)+F(3)).*(x>x5).*(x<=x6)+F(4).*(x>x6).*(x<=x7)...
    +((F(5)-F(4))/l.*(x-x7)+F(4)).*(x>x7).*(x<=x8)+F(5).*(x>x8).*(x<=x9)...
    +((F(6)-F(5))/l.*(x-x9)+F(5)).*(x>x9).*(x<=x10) + F(6).*(x>x10);
end

function t=heat(xm)     
    global T  v
    L1=25+5*30.5+5*5; 
    L2=L1+30.5+5;
    L3=L2+30.5+5;
    t1=L1/v;
    t2=L2/v;
    t3=L3/v;
    dt=0.5; 
    m1=floor(t1/dt)+1;
    m2=floor(t2/dt)+1;
    m3=floor(t3/dt)+1;
   
    l=0.015; 
    x=1e-4; 
    q1=xm(1)^2*dt/(x^2);
    q2=xm(3)^2*dt/(x^2);
    q3=xm(5)^2*dt/(x^2);
    q4=xm(7)^2*dt/(x^2);
    q5=xm(9)^2*dt/(x^2);
    h1=xm(2);
    h2=xm(4);
    h3=xm(6);
    h4=xm(8);
    h5=xm(10);
    n=ceil(l/x)+1; 
    m=floor(T/dt)+1;
    u=zeros(n,m);
    t=ones(m,1)*25;
    u(:,1)=25;
    u0=f(v*(0:floor(T/dt))*dt);
    k=ceil(l/2/x);
    A1=diag([1+h1*x,2*ones(1,n-2)*(1+q1),1+h1*x]);
    A1=A1+diag([-1,-q1*ones(1,n-2)],1);
    A1=A1+diag([-q1*ones(1,n-2),-1],-1);          
    B1=diag([0,2*ones(1,n-2)*(1-q1),0]);
    B1=B1+diag([0,q1*ones(1,n-2)],1);
    B1=B1+diag([q1*ones(1,n-2),0],-1);
    C1=A1\B1;
    c=zeros(n,m); c(1,:)=h1*u0*x; 
    c(n,:)=c(1,:);
    c=A1\c;    
    for j=1:m1-1
       u(:,j+1)=C1*u(:,j)+c(:,j+1);
       t(j+1)=u(k,j+1);
    end
    
    A2=diag([1+h2*x,2*ones(1,n-2)*(1+q2),1+h2*x]);
    A2=A2+diag([-1,-q2*ones(1,n-2)],1);
    A2=A2+diag([-q2*ones(1,n-2),-1],-1);          
    B2=diag([0,2*ones(1,n-2)*(1-q2),0]);
    B2=B2+diag([0,q2*ones(1,n-2)],1);
    B2=B2+diag([q2*ones(1,n-2),0],-1);
    C2=A2\B2;
    c=zeros(n,m); c(1,:)=h2*u0*x; 
    c(n,:)=c(1,:);
    c=A2\c;    
    for j=m1:m2-1
       u(:,j+1)=C2*u(:,j)+c(:,j+1);
       t(j+1)=u(k,j+1);
    end
    
    A3=diag([1+h3*x,2*ones(1,n-2)*(1+q3),1+h3*x]);
    A3=A3+diag([-1,-q3*ones(1,n-2)],1);
    A3=A3+diag([-q3*ones(1,n-2),-1],-1);          
    B3=diag([0,2*ones(1,n-2)*(1-q3),0]);
    B3=B3+diag([0,q3*ones(1,n-2)],1);
    B3=B3+diag([q3*ones(1,n-2),0],-1);
    C3=A3\B3;
    c=zeros(n,m); c(1,:)=h3*u0*x; 
    c(n,:)=c(1,:);
    c=A3\c;    
    for j=m2:m3-1
       u(:,j+1)=C3*u(:,j)+c(:,j+1);
       t(j+1)=u(k,j+1);
    end
        
    
    A4=diag([1+h4*x,2*ones(1,n-2)*(1+q4),1+h4*x]);
    A4=A4+diag([-1,-q4*ones(1,n-2)],1);
    A4=A4+diag([-q4*ones(1,n-2),-1],-1);          
    B4=diag([0,2*ones(1,n-2)*(1-q4),0]);
    B4=B4+diag([0,q4*ones(1,n-2)],1);
    B4=B4+diag([q4*ones(1,n-2),0],-1);
    C4=A4\B4;
    c4(1,:)=h4*u0*x; 
    c4(n,:)=c4(1,:);
    c4=A4\c4;    
        
    A5=diag([1+h5*x,2*ones(1,n-2)*(1+q5),1+h5*x]);
    A5=A5+diag([-1,-q5*ones(1,n-2)],1);
    A5=A5+diag([-q5*ones(1,n-2),-1],-1);          
    B5=diag([0,2*ones(1,n-2)*(1-q5),0]);
    B5=B5+diag([0,q5*ones(1,n-2)],1);
    B5=B5+diag([q5*ones(1,n-2),0],-1);
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