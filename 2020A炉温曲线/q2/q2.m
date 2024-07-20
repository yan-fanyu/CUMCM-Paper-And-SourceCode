clc; clear;  %问题二
global F v T xm
F=[25 182 203 237 254 25];
L=50+30.5*11+5*10; 
alpha = 7.15e-04;
H1 = 6975.37;
H2 = 97.60;
xm=[alpha;H1;alpha;H1;alpha;H1;alpha;H1;alpha;H2];
T_150_190_Arr=zeros(41,1);
T_217_Arr=T_150_190_Arr; 
T_Max_Arr=T_150_190_Arr; 
K_Max_Arr=T_150_190_Arr; 

% 遍历温度
for i=0:40
    v=1+i/60;           % 本次遍历的速度
    T=L/v;              % 总时间
    u=heat(xm);         % 温度分布
    T_217=find(u>=217);
    T_217_Arr(i+1)=(length(T_217)-1)*0.5;
    T_Max_Arr(i+1)=max(u);  
    tmp3=abs(u(2:length(u))-u(1:length(u)-1))/0.5;
    K_Max_Arr(i+1)=max(tmp3);
    u=u(u(2:length(u))>=u(1:length(u)-1));
    u=u(u>=150);
    u=u(u<=190);
    T_150_190_Arr(i+1)=(length(u)-1)*0.5;   
end

figure
ax1=subplot(2,2,1);ax2=subplot(2,2,2);
ax3=subplot(2,2,3);ax4=subplot(2,2,4);
plot(ax1,60:100,K_Max_Arr);
title(ax1,'斜率的最大值与过炉速度的关系');
xlabel(ax1, '过炉速度（cm/min）');ylabel(ax1,'斜率');

plot(ax2,60:100,T_Max_Arr);
title(ax2,'温度峰值与过炉速度的关系');
xlabel(ax2, '过炉速度（cm/min）');ylabel(ax2,'温度（℃）');

plot(ax3,60:100,T_150_190_Arr);
title(ax3,'升温期温度在150-190℃的时长与过炉速度的关系');
xlabel(ax3, '过炉速度（cm/min）');ylabel(ax3,'时间(s)');

plot(ax4,60:100,T_217_Arr);
title(ax4,'温度在217℃的时长与过炉速度的关系');
xlabel(ax4, '过炉速度（cm/min）');ylabel(ax4,'时间(s)');


v1=65/60; v2=100/60;
while 1
    v=(v1+v2)/2; 
    T=L/v;
    if check()
        v1=v;
    else
        v2=v;
    end
    if v2-v1<1e-4
        break;
    end        
end
v=(v1+v2)/2*60;


function y=f(x)
global F
gap=5; 
W=30.5; 

x1=0; 
x2=25;
x3=x2+5*W+4*gap; 
x4=x3+gap;
x5=x4+W;
x6=x5+gap;
x7=x6+W;
x8=x7+gap;
x9=x8+2*W+gap;
x10=x9+gap;
y=(exp(0.2007*x)+24).*(x<=x2)+F(2).*(x>x2).*(x<=x3)+((F(3)-F(2))/gap.*(x-x3)+F(2)).*(x>x3).*(x<=x4)+F(3).*(x>x4).*(x<=x5)...
+((F(4)-F(3))/gap.*(x-x5)+F(3)).*(x>x5).*(x<=x6)+F(4).*(x>x6).*(x<=x7)...
+((F(5)-F(4))/gap.*(x-x7)+F(4)).*(x>x7).*(x<=x8)+F(5).*(x>x8).*(x<=x9)...
+((F(6)-F(5))/gap.*(x-x9)+F(5)).*(x>x9).*(x<=x10) + F(6).*(x>x10);
end

function t=heat(xm)     
    global T   v
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
    u0=f(v*(0:floor(T/dt))*dt);
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

function y=check()
    global xm
    u=heat(xm);
    Arr_217=find(u>=217);
    T217=length(Arr_217)*0.5;
    TMax=max(u);  
    K=abs(u(2:length(u))-u(1:length(u)-1))/0.5;
    KMax=max(K);
    s=u(  u(2:length(u))>=u(1:length(u)-1)  );
    s=s(s>=150);
    s=s(s<=190);
    T_60_120=length(s)*0.5;   
    y=(TMax<=250)*(TMax>=240)...
        *(T217>=40)*(T217<=90)...
        *(KMax<=3)...
        *(T_60_120<=120)*(T_60_120>=60);
end