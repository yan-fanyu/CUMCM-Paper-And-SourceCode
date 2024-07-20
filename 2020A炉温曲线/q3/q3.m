clc; clear;  %问题三
global xm L u0
L=50+30.5*11+5*10;
alpha = 7.15e-04;
H1 = 6975.37;
H2 = 97.60;
xm=[alpha;H1;alpha;H1;alpha;H1;alpha;H1;alpha;H2];
x=[]; 

% 粒子群找最优解
[x, fv]=PSO(@area, 60 ,0.8, 2, 2,[185,205,245,265,10/6],[165,185,225,245,65/60],1000,5);

F=[25,x(1),x(2),x(3),x(4),25]; 
v=x(5);
T=L/v;
S=area(x);
t=0:0.5:T;
k=find(u0==max(u0));
figure  
hold on
plot(t,u0, 'blue', 'linewidth', 1.5);
hold on;
plot(t,217*ones(length(t),1), 'red', 'linewidth', 1.5);
xlabel( '时间/s');
ylabel('温度/°C');
title('炉温曲线');
text(T,217,'T=217℃','color','black');
line([t(k),t(k)],[0,280],'color','g', 'linewidth', 1.5);
daspect([1,1.6,1]);



function y=f(x,F)
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

function t=heat(u1,u2,u3,u4,v)     
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
    n=ceil(l/x)+1; m=floor(T/dt)+1;
    u=zeros(n,m);t=ones(m,1)*25;
    u(:,1)=25;
    u0=f(v*(0:floor(T/dt))*dt,F);
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

function a=area(x)
global u0
    u0=heat(x(1),x(2),x(3),x(4),x(5));
    u=u0(u0>=30);
    tmp2=u(u>=217)-217;
    t2=length(tmp2)*0.5;
    TMax=max(u);  
    tmp3=abs(u(2:length(u))-u(1:length(u)-1))/0.5;
    KMax=max(tmp3);
    s=u(u(2:length(u))>=u(1:length(u)-1));
    s=s(s>=150);
    s=s(s<=190);
    t1=length(s)*0.5;   
    y=logical((TMax<=250)*(TMax>=240)*(t2>=40)*(t2<=90)*(KMax<=3)*(t1<=120)*(t1>=60));
    if y
        k=find(tmp2==max(tmp2));
        if k>2
            a=(sum(tmp2(1:k))-(tmp2(1)+tmp2(k))/2)*0.5;
        else
            a=(tmp2(1)+tmp2(k))*0.5/2;
        end
    else
        a=inf;
    end
end
