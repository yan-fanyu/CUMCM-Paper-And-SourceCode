clc,clear
%第二问按年主函数
%此程序运行时间10分钟左右
X=xlsread('weather.xls','B1:D8760');
Y=xlsread('weather.xls','I1:J8760');
efficiency=xlsread('classical.xls','G3:G26');
W=xlsread('classical.xls','C3:C26');
ts=Y(:,1)+1;
n=ceil((Y(:,2)+1)/24);
level_radio=X(:,1);
scattering_radio=X(:,2);
vertical_radio=X(:,3);
[m,o]=size(X);
max=0;
a(m)=0;A(m)=0;c(m)=0;C(m)=0;cant_radio(m)=0;
broad(24)=0;
area=[1.58*0.808 1.966*0.991 1.58*0.808 1.651*0.991 1.65*0.991 1.956*0.991 1.65*0.991 1.956*0.991 1.482*0.992 1.64*0.992 1.956*0.992 1.956*992 1.668*1 1.3*1.1 1.321*0.711 1.414*1.114 1.4*1.1 1.4*1.1 0.310*0.355 0.615*0.180 0.615*0.355 0.92*0.355 0.818*0.355 1.645*0.712];
broad(3)=42;
for i=1:m
    if vertical_radio(i)>0
       u=ts(i);
       v=n(i);
       [j,k]=sun_azimuth(u,v);
       a(i)=j;A(i)=k;
    end
end
for cita=0.01:0.01:1.57
    for i=1:8760
        %c为直线与法向量的余弦值，即直线与平面的正弦值
        c(i)=(1+tan(cita)*tan(a(i))*sqrt(1+tan(A(i))^2))/sqrt(1+tan(cita)^2)/sqrt(1+tan(A(i))^2+tan(a(i))^2*(1+tan(A(i))^2));
        cant_direct(i)=abs(c(i))*vertical_radio(i);
        cant_radio(i)=cant_direct(i)+scattering_radio(i);
    end
   [COST1,VALUE1]=cost_value(broad,cant_radio');
    if max<VALUE1;
        max=VALUE1;
        CI=cita;
    end
end
disp('倾角:')
CI/pi*180
disp('最大价值:')
max
%东面
radio2=xlsread('weather.xls','E1:E8760');
broad2(24)=0;
broad2(14)=13;
broad2(20)=40;
[COST2,VALUE2]=cost_value(broad2,radio2);
%南面
radio3=xlsread('weather.xls','F1:F8760');
broad3(24)=0;
broad3(14)=2;
broad3(20)=16;
broad3(23)=40;
[COST3,VALUE3]=cost_value(broad3,radio3);
%西面
radio4=xlsread('weather.xls','G1:G8760');
broad4(24)=0;
broad4(14)=14;
broad4(20)=14;
broad4(21)=4;
broad4(23)=13;
[COST4,VALUE4]=cost_value(broad4,radio4);
%北面不管怎么排布，都是亏本，不予考虑
year_value=max*40*0.94/42+max*2*0.86/42+0.94*(VALUE2+VALUE3+VALUE4)
total_cost=COST1+COST2+COST3+COST4
total_value=year_value*(10+15*0.9+10*0.8)