clc; clear;  %最小化， 优化参数
global F v L T T0 u0 t0
F=[25,175,195,235,255,25];
v=7/6;
L=50+30.5*11+5*10; 
T=L/v; 
T0=19;
filename="附件.xlsx";
E=xlsread(filename,1);
u0=E(:,2); t0=E(:,1);
alpha = 7.15e-04;
H1 = 6975.37;
H2 = 97.60;
xm=[0.000684514481228462,26398.9868529373,0.00162055320975832,703.214659036578,0.000469982038319754,993.825103852669,0.00108002910728946,539.461094902766,0.000580284429834169,927.721459431793];

u=heat(xm);


plot(t0*v,u0,t0*v,u, 'linewidth', 1.5);
X = t0;
Y = u;
xlabel('距离（cm）');ylabel('温度（℃）');
title('实际温度与拟合温度对比图');
legend('实际温度','拟合温度');
daspect([1,1.6,1]);

function t=heat(xm)     
    global T T0  v
    L1=25+5*30.5+5*5; 
    L2=L1+30.5+5;
    L3=L2+30.5+5;
    t1=L1/v;t2=L2/v;t3=L3/v;
    dt=0.5; 
    m1=floor(t1/dt)+1;
    m2=floor(t2/dt)+1;
    m3=floor(t3/dt)+1;
   
    l=0.015; 
    dh=1e-4; 
    q1=xm(1)^2*dt/(dh^2);
    q2=xm(3)^2*dt/(dh^2);
    q3=xm(5)^2*dt/(dh^2);
    q4=xm(7)^2*dt/(dh^2);
    q5=xm(9)^2*dt/(dh^2);
    h1=xm(2);h2=xm(4);h3=xm(6);h4=xm(8);h5=xm(10);
    n=ceil(l/dh)+1; m=floor(T/dt)+1;
    u=zeros(n,m);t=ones(m,1)*25;
    u(:,1)=25;
    u0=f(v*(0:floor(T/dt))*dt);
    k=ceil(l/2/dh);i=floor(T0/dt)+1;
    A1=diag([1+h1*dh,2*ones(1,n-2)*(1+q1),1+h1*dh]);
    A1=A1+diag([-1,-q1*ones(1,n-2)],1);
    A1=A1+diag([-q1*ones(1,n-2),-1],-1);          
    B1=diag([0,2*ones(1,n-2)*(1-q1),0]);
    B1=B1+diag([0,q1*ones(1,n-2)],1);
    B1=B1+diag([q1*ones(1,n-2),0],-1);
    C1=A1\B1;
    c=zeros(n,m); c(1,:)=h1*u0*dh; 
    c(n,:)=c(1,:);
    c=A1\c;    
    for j=1:m1-1
       u(:,j+1)=C1*u(:,j)+c(:,j+1);
       t(j+1)=u(k,j+1);
    end
    
    A2=diag([1+h2*dh,2*ones(1,n-2)*(1+q2),1+h2*dh]);
    A2=A2+diag([-1,-q2*ones(1,n-2)],1);
    A2=A2+diag([-q2*ones(1,n-2),-1],-1);          
    B2=diag([0,2*ones(1,n-2)*(1-q2),0]);
    B2=B2+diag([0,q2*ones(1,n-2)],1);
    B2=B2+diag([q2*ones(1,n-2),0],-1);
    C2=A2\B2;
    c=zeros(n,m); c(1,:)=h2*u0*dh; 
    c(n,:)=c(1,:);
    c=A2\c;    
    for j=m1:m2-1
       u(:,j+1)=C2*u(:,j)+c(:,j+1);
       t(j+1)=u(k,j+1);
    end
    
    A3=diag([1+h3*dh,2*ones(1,n-2)*(1+q3),1+h3*dh]);
    A3=A3+diag([-1,-q3*ones(1,n-2)],1);
    A3=A3+diag([-q3*ones(1,n-2),-1],-1);          
    B3=diag([0,2*ones(1,n-2)*(1-q3),0]);
    B3=B3+diag([0,q3*ones(1,n-2)],1);
    B3=B3+diag([q3*ones(1,n-2),0],-1);
    C3=A3\B3;
    c=zeros(n,m); c(1,:)=h3*u0*dh; 
    c(n,:)=c(1,:);
    c=A3\c;    
    for j=m2:m3-1
       u(:,j+1)=C3*u(:,j)+c(:,j+1);
       t(j+1)=u(k,j+1);
    end
        
    
    A4=diag([1+h4*dh,2*ones(1,n-2)*(1+q4),1+h4*dh]);
    A4=A4+diag([-1,-q4*ones(1,n-2)],1);
    A4=A4+diag([-q4*ones(1,n-2),-1],-1);          
    B4=diag([0,2*ones(1,n-2)*(1-q4),0]);
    B4=B4+diag([0,q4*ones(1,n-2)],1);
    B4=B4+diag([q4*ones(1,n-2),0],-1);
    C4=A4\B4;
    c4(1,:)=h4*u0*dh; 
    c4(n,:)=c4(1,:);
    c4=A4\c4;    
        
    A5=diag([1+h5*dh,2*ones(1,n-2)*(1+q5),1+h5*dh]);
    A5=A5+diag([-1,-q5*ones(1,n-2)],1);
    A5=A5+diag([-q5*ones(1,n-2),-1],-1);          
    B5=diag([0,2*ones(1,n-2)*(1-q5),0]);
    B5=B5+diag([0,q5*ones(1,n-2)],1);
    B5=B5+diag([q5*ones(1,n-2),0],-1);
    C5=A5\B5;
    c5(1,:)=h5*u0*dh; 
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
    t=t(i:length(t));
end


function y=f(x)
    global F
    gap=5; L=30.5; s=25;
    x1=0; x2=25;
    x3=x2+5*L+4*gap; x4=x3+gap;
    x5=x4+L;x6=x5+gap;
    x7=x6+L;x8=x7+gap;
    x9=x8+2*L+gap;x10=x9+gap;
    y=(exp(0.2007*x)+24).*(x<=x2)+F(2).*(x>x2).*(x<=x3)+((F(3)-F(2))/gap.*(x-x3)+F(2)).*(x>x3).*(x<=x4)+F(3).*(x>x4).*(x<=x5)...
    +((F(4)-F(3))/gap.*(x-x5)+F(3)).*(x>x5).*(x<=x6)+F(4).*(x>x6).*(x<=x7)...
    +((F(5)-F(4))/gap.*(x-x7)+F(4)).*(x>x7).*(x<=x8)+F(5).*(x>x8).*(x<=x9)...
    +((F(6)-F(5))/gap.*(x-x9)+F(5)).*(x>x9).*(x<=x10) + F(6).*(x>x10);
    
end