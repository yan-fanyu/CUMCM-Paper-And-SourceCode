clear,clc;
C=0.85;
A=0.49*pi;%小孔面积
V=12500*pi;%油管体积
tstep=0.02;%确定步长
z=zeros(1,length(0.01:0.01:5));%储存稳定目标值
pos1=1;    %z的下标
%遍历法探索可能解
for topen=0.01:0.01:5
    Pyb=160;      %油泵压力
    Pyg=100;      %油管压力
    rouyb=0.8725; %油泵油密度
    rouyg=0.85;   %油管油密度
    tclose=10;    %闭阀时间
    myg=rouyg*V;  %起始油管油质量
    P=zeros(1,length(0:tstep:2000)); %储存油管压力值
    pos2=1;       %P的下标
    %迭代时间
    for t=0:tstep:2000
        %计算体积变化
        if Pyb>Pyg
            Qin=State(t,topen,tclose)*C*A*sqrt(2*(Pyb-Pyg)/rouyb)*tstep;
        else
            Qin=0;
        end
        Qout=py(t)*tstep; 
        myg=myg+(Qin-Qout)*rouyg; %计算油管油质量
        rouyg=myg/V;              %更新油管油密度
        Pyg=y(rouyg);             %更新油管油压力
        P(pos2)=Pyg;
        pos2=pos2+1;
    end  
    z(pos1)=sum((100-P).^2);
    pos1=pos1+1;
end
[i,j]=min(z);
topen=j/100;

%密度转化为压力
function P=y(x)
P=17284.0015*x^2-27111.3456*x+10656.1125;
end
%单向阀状态
function flag=State(t,topen,tclose)
 %topen为开阀时间，tclose为关阀时间
 T=topen+tclose;%总周期
 mt=mod(t,T);  %放入第一周期
 if mt<=topen  %开阀
    flag=1;
 else
    flag=0;  %闭阀
 end
end

%输入时间，输出喷油速率
function v=py(t)
nt=mod(t,100);%放入第一周期
    if nt<=0.2
       v=100*nt;
    elseif nt<=2.2
       v=20;
    elseif nt<=2.4
       v=240-100*nt;
    else
       v=0;
    end
end
