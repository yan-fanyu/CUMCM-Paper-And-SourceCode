clear,clc;
C=0.85;
A=0.49*pi;%小孔面积
V=12500*pi;%油管体积
d1=2.5;
d3=1.4;
s1=0.25*pi*d1^2;     %针阀面积
s3=0.25*pi*d3^2;     %圆锥缺口圆环面积
L=0.5*d1/tan(pi/20); %初始针阀底端到圆锥缺口高度

tstep=0.02;%确定步长
z=zeros(1,length(0.0001:0.0001:0.05));%储存稳定目标值
pos1=1;    %z的下标
%遍历法探索可能解
for w=0.0001:0.0001:0.05
    Pyb=0.5;      %油泵压力
    Pyg=100;      %油管压力
    rouyg=0.85;   %油管油密度
    myg=rouyg*V;  %起始油管油质量
    P=zeros(1,length(0:tstep:2000)); %储存油管压力值
    pos2=1;       %P的下标
    %迭代时间
    for t=0:tstep:2000
        rouyb=0.7919*17.896/(17.896-H(w,t));
        Pyb=y(rouyb);%此时油泵油压力
        r2=(L+h(t))*tan(pi/20);
        s2=pi*r2^2;          %针阀底端与圆锥相切处圆环的面积
        B=min(s2-s1,s3);     %流出面积
        %计算体积变化
        Qin=State1(Pyb,Pyg)*C*A*sqrt(2*(Pyb-Pyg)/rouyb)*tstep;
        Qout=State2(t)*C*B*sqrt(2*(Pyg-0.1)/Y(Pyg))*tstep; 
        myg=myg+(Qin-Qout)*rouyg; %计算油管油质量
        rouyg=myg/V;              %更新油管油密度
        Pyg=y(rouyg);             %更新油管油压力
        P(pos2)=Pyg;
        pos2=pos2+1;
    end  
    z(1,pos1)=sum((100-P).^2);
    pos1=pos1+1;
end
[i,j]=min(z);
mubiao=j/10000;

%密度转化为压力
function P=y(x)
P=17284.0015*x^2-27111.3456*x+10656.1125;
end

%压力转化为密度
function rou=Y(x1)
 rou=-1.68e-6*x1^2+0.0006374*x1+0.7916;
end

%极角化极径
function jj=r(a)
 jj=-0.06315*a^4+0.7934*a^3-2.647*a^2+0.9696*a+7.09;
end

%单向阀状态
function flag1=State1(Pyb,Pyg)
 if Pyb>Pyg  %开阀
    flag1=1;
 else
    flag1=0;  %闭阀
 end
end

%喷口状态
function flag2=State2(t)
  nt=mod(t,100);%放入第一周期
 if nt<2.45    %喷出
    flag2=1;
 else
    flag2=0;    %不喷出
 end
end

%计算活塞上升高度
function HT=H(w,t)
u=zeros(1,length(0:0.1:2*pi));
pos3=1;
for a=0:0.1:2*pi
 u(1,pos3)=r(a)*sin(w*t+a);
 pos3=pos3+1;
end
HT=max(u)-2.143;
end

%针阀上升高度
function hp=h(t)
 kt=mod(t,100);%放入一个周期
 if kt<0.45
     hp=2.016*exp(-((t-0.4551)/0.1661)^2);
 elseif kt<=2
     hp=2;
 elseif kt<2.45
     hp=2.016*exp(-((-(t-2.45)-0.4551)/0.1661)^2);
 else
     hp=0;
 end
end


